package com.papergen.dao;

import org.apache.ibatis.annotations.Mapper;

import com.papergen.domain.Admin;

@Mapper
public interface AdminDao {

	Admin selectAdminByUserName(String userName);
}
