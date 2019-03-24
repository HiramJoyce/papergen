package com.papergen.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.papergen.dao.StudentDao;
import com.papergen.domain.Student;
import com.papergen.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;
	
	public Student login(String userName, String password) {
		Student student = studentDao.selectStudentByUserName(userName);
		if (student != null && StringUtils.equals(student.getPassword(), password)) {
			return student;
		}
		return null;
	}

	@Override
	public Student register(String userName, String password, String realName) {
		Student student = new Student();
		student.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		student.setUserName(userName);
		student.setPassword(password);
		student.setRealName(realName);
		return studentDao.insertStudent(student) > 0 ? student : null;
	}

	@Override
	public Student getStudentById(String id) {
		return studentDao.selectStudentById(id);
	}

	
}
