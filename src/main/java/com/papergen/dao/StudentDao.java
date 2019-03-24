package com.papergen.dao;

import com.papergen.domain.Student;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentDao {

	Student selectStudentByUserName(String userName);

	int insertStudent(Student student);

	Student selectStudentById(String id);
}
