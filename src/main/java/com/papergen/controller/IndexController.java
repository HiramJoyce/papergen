package com.papergen.controller;

import com.papergen.domain.Paper;
import com.papergen.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author hiram 2019年03月17日 22:59
 */
@Controller
public class IndexController {
    @Autowired
    private PaperService paperService;
    @RequestMapping("/")
    public String index(Model model) {
        List<Paper> allPapers = paperService.getAllPapers();
        model.addAttribute("papers", allPapers);
        return "index";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }
}
