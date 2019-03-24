package com.papergen.service;

import java.io.IOException;
import java.util.List;

import com.papergen.domain.Question;
import org.springframework.web.multipart.MultipartFile;

public interface QuestionService {
    List<Question> getAllQuestions();

    void delete(int i);

    Question addQuestion(Question question);

    Question getQuestionById(String id);

    Question updateQuestion(Question question);

    List<Question> getQuestionsByChapterSectionLevelType(String chapter, String section, List<String> level, int i);

    List<Question> batchImport(MultipartFile excelFile) throws IOException;
}
