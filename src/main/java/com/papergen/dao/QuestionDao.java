package com.papergen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.papergen.domain.Question;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QuestionDao {
	List<Question> selectAllQuestions();

    int deleteQuestionById(int id);

    int insertQuestion(Question question);

    Question selectQuestionById(String id);

    int updateQuestion(Question question);

    List<Question> selectQuestionsByChapterSectionLevelType(@Param("chapter") String chapter, @Param("section") String section, @Param("level") List<String> level, @Param("type") int type);

    List<Question> selectQuestionsByChapterSectionSubjectLevelType(@Param("chapter") String chapter, @Param("section") String section, @Param("subject") String subject, @Param("level") List<String> level, @Param("type") int type);
}
