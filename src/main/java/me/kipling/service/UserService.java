package me.kipling.service;

import java.util.List;
import java.util.Map;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageInfo;

import me.kipling.common.page.EasyUIResult;
import me.kipling.common.page.QueryInfo;
import me.kipling.entity.User;

public interface UserService {

	/**
	 * 获取用户
	 * 
	 * @param id
	 * @return
	 */
	int insert(User user);

	/**
	 * 获取用户
	 * 
	 * @param id
	 * @return
	 */
	User getById(int id);

	/**
	 * 获取用户列表
	 * 
	 * @param paramMap
	 * @return
	 */
	List<User> getList(Map<String, Object> paramMap);

	/**
	 * 更新用户
	 * 
	 * @param user
	 * @return
	 */
	int update(User user);

	/**
	 * 删除用户
	 * 
	 * @param user
	 * @return
	 */
	int delete(Integer id);

	/**
	 * 测试分页
	 * 
	 * @param queryInfo
	 * @return
	 */
	EasyUIResult queryUserList(QueryInfo queryInfo);

	/**
	 * 
	 * ----------------------以下测试通用mapper----------------------
	 * 
	 * 
	 */
	List<User> selectCountByExample();

	int deleteByExample();

	User selectByPrimaryKey(Integer userId);

	User selectOne(User user);

	PageInfo<User> select(Integer page, Integer rows);
}