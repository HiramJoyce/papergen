package com.papergen.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.papergen.dao.StudentDao;
import com.papergen.domain.Student;
import com.papergen.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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
	public Student register(String studentNum, String userName, String realName, String password, String chapter, String section) {
		Student student = new Student();
		student.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		student.setStudentNum(studentNum);
		student.setUserName(userName);
		student.setRealName(realName);
		student.setPassword(password);
		student.setChapter(chapter);
		student.setSection(section);
		return studentDao.insertStudent(student) > 0 ? student : null;
	}

	@Override
	public Student getStudentById(String id) {
		return studentDao.selectStudentById(id);
	}

	@Override
	public List<Student> getAllStudents() {
		return studentDao.selectAllStudents();
	}

	@Override
	public int delete(String id) {
		return studentDao.deleteStudentById(id);
	}

    @Override
    public int updateStudent(Student student) {
        return studentDao.updateStudent(student);
    }


}
