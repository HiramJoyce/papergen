package com.papergen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.papergen.domain.Question;

@Mapper
public interface QuestionDao {
	List<Question> selectAllQuestions();

    int deleteQuestionById(int id);

    int insertQuestion(Question question);

    Question selectQuestionById(String id);

    int updateQuestion(Question question);

    List<Question> selectQuestionsByChapterSectionLevelType(@Param("chapter") String chapter, @Param("section") String section, @Param("level") List<String> level, @Param("type") int type);
}
