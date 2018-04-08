package me.kipling.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.abel533.mapper.Mapper;

import me.kipling.entity.User;

public interface UserDao extends Mapper<User> {

	int insertOne(User user);

	User findOne(Integer id);

	int deleteOne(Integer id);

	int updateOne(User user);

	// 模糊查询单字段 报There is no getter for property named in ‘class java.lang.String
	List<User> queryUserPageInfo(@Param(value = "param") String param);

	List<User> queryUserPageInfo1(String param);

	int deleteByExample();
}