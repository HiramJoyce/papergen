package com.papergen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.papergen.dao.AdminDao;
import com.papergen.domain.Admin;
import com.papergen.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	public Admin login(String userName, String password) {
		Admin admin = adminDao.selectAdminByUserName(userName);
		if (admin != null && StringUtils.equals(admin.getPassword(), password)) {
			return admin;
		}
		return null;
	}
	
}
