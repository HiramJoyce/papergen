package com.papergen.dao;

import com.papergen.domain.Paper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PaperDao {
	List<Paper> selectAllPapers();

    int deletePaperById(String id);

    int insertPaper(Paper Paper);

    Paper selectPaperById(String id);

    int updatePaper(Paper Paper);

    List<Paper> selectPaperByChapterSection(@Param("chapter") String chapter, @Param("section") String section);
}
