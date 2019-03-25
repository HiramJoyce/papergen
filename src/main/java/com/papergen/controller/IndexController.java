package com.papergen.controller;

import com.papergen.domain.Paper;
import com.papergen.domain.Student;
import com.papergen.service.PaperService;
import com.papergen.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author hiram 2019年03月17日 22:59
 */
@Controller
public class IndexController {
    @Autowired
    private PaperService paperService;
    @Autowired
    private StudentService studentService;
    @RequestMapping("/")
    public String index(Model model, HttpSession session) {
//        List<Paper> allPapers = paperService.getAllPapers();
        String id;
        if ((id = (String) session.getAttribute("id")) != null) {
            Student student = studentService.getStudentById(id);
            List<Paper> allPapers = paperService.getPapersByChapterSection(student.getChapter(), student.getSection());
            model.addAttribute("papers", allPapers);
        }
        return "index";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }
}
