package com.papergen.dao;

import com.papergen.domain.Paper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaperDao {
	List<Paper> selectAllPapers();

    int deletePaperById(String id);

    int insertPaper(Paper Paper);

    Paper selectPaperById(String id);

    int updatePaper(Paper Paper);
}
