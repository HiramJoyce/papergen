package com.papergen.service;

import com.papergen.domain.Student;

import java.util.List;

public interface StudentService {
	Student login(String userName, String password);

	Student register(String studentNum, String userName, String realName, String password, String chapter, String section);
	
	Student getStudentById(String id);

	List<Student> getAllStudents();

	int delete(String id1);

	int updateStudent(Student student);
}
