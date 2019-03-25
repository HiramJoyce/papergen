package com.papergen.dao;

import com.papergen.domain.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StudentDao {

	Student selectStudentByUserName(String userName);

	int insertStudent(Student student);

	Student selectStudentById(String id);

	List<Student> selectAllStudents();

	int deleteStudentById(String id);

	int updateStudent(Student student);
}
