package com.papergen.dao;

import org.apache.ibatis.annotations.Mapper;

import com.papergen.domain.Admin;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminDao {

	Admin selectAdminByUserName(String userName);
}
