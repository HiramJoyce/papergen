package com.papergen.controller.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.papergen.domain.Question;
import com.papergen.service.QuestionService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/questionsPage")
    public String toQuestionPage(Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        List<Question> questions = questionService.getAllQuestions();
        model.addAttribute("questions", questions);
        System.out.println(questions);
        return "admin/questions";
    }

    @RequestMapping("/addQuestion")
    public String toAddQuestion(HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        return "admin/questionAdd";
    }

    @RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
    public String addQuestion(Question question, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> addQuestion ->");
        System.out.println(question);
        checkRightOption(question);
        Question addQuestion = questionService.addQuestion(question);
        if (addQuestion != null) {
            model.addAttribute("question", addQuestion);
            return "admin/question";
        }
        return "redirect:/questionsPage";
    }

    @RequestMapping("/queryQuestion")
    public String queryQuestion(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Question addQuestion = questionService.getQuestionById(id);
        if (addQuestion != null) {
            model.addAttribute("question", addQuestion);
            return "admin/question";
        }
        return "redirect:/questionsPage";
    }

    @RequestMapping("/updateQuestion")
    public String updateQuestion(String id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        Question addQuestion = questionService.getQuestionById(id);
        if (addQuestion != null) {
            model.addAttribute("question", addQuestion);
            return "admin/questionUpd";
        }
        return "redirect:/questionsPage";
    }

    @RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
    public String updateQuestion(Question question, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> updateQuestion ->");
        System.out.println(question);
        checkRightOption(question);
        Question addQuestion = questionService.updateQuestion(question);
        if (addQuestion != null) {
            model.addAttribute("question", addQuestion);
            return "admin/question";
        }
        return "redirect:/questionsPage";
    }

    private void checkRightOption(Question question) {
        if (question.getType() == 1) {
            if (question.getRightOption() == null || question.getRightOption().equals("") || question.getRightOption().length() <= 0) {
                question.setRightOption("A");
            }
            if (question.getRightOption().split(",").length > 1) {
                question.setRightOption(question.getRightOption().split(",")[0]);
            }
        }
    }

    @RequestMapping("/deleteQuestion")
    public String deleteQuestion(String id, HttpServletRequest request) {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        if (id != null) {
            String ids[] = id.split(",");
            for (String id1 : ids) {
                questionService.delete(Integer.parseInt(id1));
            }
        }
        return "redirect:/questionsPage";
    }

    @RequestMapping(value = "uploadQuestions", method = RequestMethod.POST)
    public String uploadQuestions(@RequestParam(value = "excelFile") MultipartFile excelFile, Model model,
                                  HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("role") == null || !request.getSession().getAttribute("role").equals("admin")) {
            return "404";
        }
        System.out.println("-> uploadQuestions start");
        //判断文件是否为空
        List<Question> questions = questionService.getAllQuestions();
        model.addAttribute("questions", questions);
        if (excelFile == null) {
            model.addAttribute("message", "文件不正确！");
            return "admin/questions";
        }
        //获取文件名
        String name = excelFile.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size = excelFile.getSize();
        if (name == null || ("").equals(name) && size == 0) {
            model.addAttribute("message", "文件不正确！");
            return "admin/questions";
        }

        String extension = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
        if (!Objects.equals("xls", extension) && !Objects.equals("xlsx", extension)) {
            model.addAttribute("message", "文件格式不正确！");
            return "admin/questions";
        }
        //批量导入。参数：文件名，文件。
        List<Question> questionList = questionService.batchImport(excelFile);
        if (questionList != null) {
            questionList.forEach((question) -> questionService.addQuestion(question));
            model.addAttribute("message", "批量导入EXCEL成功，下表为导入的新数据！");
            model.addAttribute("questions", questionList);
        } else {
            model.addAttribute("error", "批量导入EXCEL失败，已加载原有题库！");
            model.addAttribute("questions", questions);
        }
        return "admin/questions";
    }
}
