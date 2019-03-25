package com.papergen.controller.student;

import com.papergen.domain.Paper;
import com.papergen.domain.Question;
import com.papergen.domain.Student;
import com.papergen.service.PaperService;
import com.papergen.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author hiram 2019年03月17日 23:33
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private PaperService paperService;

    @RequestMapping("/studentLogin")
    public String studentLogin(String userName, String password, Model model, HttpServletRequest request) {
        System.out.println("-> student login : " + userName + " - " + password);
        Student student = studentService.login(userName, password);
        List<Paper> allPapers = paperService.getAllPapers();
        model.addAttribute("papers", allPapers);
        if (student == null) {
            model.addAttribute("error","用户名或密码错误");
            return "index";
        }
        request.getSession().setAttribute("id", student.getId());
        request.getSession().setAttribute("realName", student.getRealName());
        request.getSession().setAttribute("role", "student");
        return "redirect:/";
    }

    @RequestMapping("/studentRegister")
    public String studentRegister(String studentNum, String userName, String realName, String password, String chapter, String section, Model model, HttpServletRequest request) {
        System.out.println("-> student register : " + userName + " - " + password + " - " + realName);
        Student student = studentService.register(studentNum, userName, realName, password, chapter, section);
        List<Paper> allPapers = paperService.getAllPapers();
        model.addAttribute("papers", allPapers);
        if (student == null) {
            model.addAttribute("error","注册失败错误");
            return "index";
        }
        request.getSession().setAttribute("id", student.getId());
        request.getSession().setAttribute("realName", student.getRealName());
        request.getSession().setAttribute("role", "student");
        return "index";
    }

    @RequestMapping("/studentInfo")
    public String studentInfo(Model model, HttpServletRequest request) {
        System.out.println("-> student studentInfo");
        Student student = studentService.getStudentById((String) request.getSession().getAttribute("id"));
        if (student != null) {
            model.addAttribute("student", student);
            return "student/studentInfo";
        }
        return "redirect:/";
    }

    @RequestMapping("/studentsPage")
    public String toStudentPage(Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        System.out.println(students);
        return "admin/students";
    }

    @RequestMapping("/addStudent")
    public String toAddQuestion(HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        return "admin/studentAdd";
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    public String addStudent(Student student, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> addStudent ->");
        System.out.println(student);
        Student addStudent = studentService.register(student.getStudentNum(), student.getUserName(), student.getRealName(), student.getPassword(), student.getChapter(), student.getSection());
//        if (addStudent != null) {
//            model.addAttribute("student", student);
//            return "admin/students";
//        }
        return "redirect:/studentsPage";
    }

    @RequestMapping("/updateStudent")
    public String updateStudent(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Student student = studentService.getStudentById(id);
        if (student != null) {
            model.addAttribute("student", student);
            return "admin/studentUpd";
        }
        return "redirect:/studentsPage";
    }

    @RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
    public String updateStudent(Student student, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> updateStudent ->");
        System.out.println(student);
        studentService.updateStudent(student);
//        if (updateStudent != null) {
//            model.addAttribute("student", updateStudent);
//        }
        return "redirect:/studentsPage";
    }

    @RequestMapping(value = "/updateStudentInfo", method = RequestMethod.POST)
    public String updateStudentInfo(Student student, Model model, HttpServletRequest request) {
        System.out.println("-> updateStudent ->");
        System.out.println(student);
        studentService.updateStudent(student);
//        if (updateStudent != null) {
//            model.addAttribute("student", updateStudent);
//        }
        model.addAttribute("student", student);
        request.getSession().setAttribute("id", student.getId());
        request.getSession().setAttribute("realName", student.getRealName());
        request.getSession().setAttribute("role", "student");
        return "student/studentInfo";
    }

    @RequestMapping("/deleteStudent")
    public String deleteStudent(String id, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                studentService.delete(id1);
            }
        }
        return "redirect:/studentsPage";
    }
}
