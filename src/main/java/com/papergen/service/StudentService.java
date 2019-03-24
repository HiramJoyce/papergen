package com.papergen.service;

import com.papergen.domain.Student;

public interface StudentService {
	Student login(String userName, String password);

	Student register(String userName, String password, String realName);
	
	Student getStudentById(String id);
}
