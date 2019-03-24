package com.papergen.service;

import com.papergen.domain.Admin;

public interface AdminService {
	Admin login(String userName, String password);
}
