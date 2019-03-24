package com.papergen.controller.student;

import com.papergen.domain.Paper;
import com.papergen.domain.Student;
import com.papergen.service.PaperService;
import com.papergen.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        return "index";
    }

    @RequestMapping("/studentRegister")
    public String studentRegister(String userName, String password, String realName, Model model, HttpServletRequest request) {
        System.out.println("-> student register : " + userName + " - " + password + " - " + realName);
        Student student = studentService.register(userName, password, realName);
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
}
