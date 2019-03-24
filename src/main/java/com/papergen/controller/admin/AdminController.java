package com.papergen.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.papergen.domain.Admin;
import com.papergen.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin/loginPage")
	public String adminLoginPage() {
		return "admin/loginPage";
	}

	@RequestMapping("/admin/login")
	public String adminlogin() {
		return "admin/loginPage";
	}

	@RequestMapping(value = "/admin/login", method=RequestMethod.POST)
	public String adminLogin(String userName, String password, HttpServletRequest request) {
		System.out.println("admin login -> userName : " + userName + " password : " + password);
		Admin admin = adminService.login(userName, password);
		if (admin != null) {
			request.getSession().setAttribute("id", admin.getId());
			request.getSession().setAttribute("userName", admin.getUserName());
			request.getSession().setAttribute("realName", admin.getUserName());
			request.getSession().setAttribute("role", "admin");
			System.out.println("admin login success!");
			return "admin/adminPage";
		}
		System.out.println("admin login error!");
		return "admin/loginPage";
	}
}
