package me.kipling.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import me.kipling.common.page.EasyUIResult;
import me.kipling.common.page.QueryInfo;
import me.kipling.dao.UserDao;
import me.kipling.entity.User;
import me.kipling.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private static final Log log = LogFactory.getLog(UserServiceImpl.class);

	@Autowired
	private UserDao userDao;

	public UserServiceImpl() {
		log.info("----------spring容器初始化-----------NewUserServiceImpl----------------------------");
	}

	@Override
	public User getById(int id) {
		return userDao.findOne(id);
	}

	@Transactional
	@Override
	public int insert(User user) {
		int flag = userDao.insertOne(user);
		log.info(JSON.toJSONString(user));
		return flag;
	}

	@Override
	public List<User> getList(Map<String, Object> paramMap) {
		return null;
	}

	@Transactional
	@Override
	public int update(User user) {
		return userDao.updateOne(user);
	}

	@Override
	public int delete(Integer id) {
		return userDao.deleteOne(id);
	}

	/******************************************** 以下是使用分页组件和通用Mapper的写法 ****************************************************/

	@Override
	public EasyUIResult queryUserList(QueryInfo queryInfo) {
		// 设置分页参数
		PageHelper.startPage(queryInfo.getPage(), queryInfo.getRows());
		// List<User> users = userDao.queryUserPageInfo("s");
		List<User> users = userDao.queryUserPageInfo1("s");
		// 获取分页之后的信息
		PageInfo<User> pageInfo = new PageInfo<User>(users);
		return new EasyUIResult(pageInfo.getTotal(), users);
	}

	/**
	 * 根据条件查询
	 */
	public List<User> selectCountByExample() {
		// 根据多个id查询用户信息
		List<Object> ids = new ArrayList<Object>();
		ids.add(1);
		ids.add(2);
		ids.add(3);
		Example example = new Example(User.class);
		example.createCriteria().andIn("id", ids);
		List<User> list = userDao.selectByExample(example);
		return list;
	}

	/**
	 * 根据条件删除
	 */
	@Transactional
	public int deleteByExample() {
		Example example = new Example(User.class);
		example.createCriteria().andBetween("age", 23, 30);
		int result = userDao.deleteByExample(example);
		if (log.isInfoEnabled()) {
			log.info("----------result-------" + result);
		}
		return result;
	}

	/**
	 * 根据条件获得数据
	 */
	public User selectByPrimaryKey(Integer userId) {
		return userDao.selectByPrimaryKey(userId);
	}

	@Override
	public User selectOne(User user) {
		return userDao.selectOne(user);
	}

	@Override
	public PageInfo<User> select(Integer page, Integer rows) {
		// 设置分页参数
		PageHelper.startPage(page, rows);
		List<User> users = userDao.select(null);
		// 获取分页之后的信息
		PageInfo<User> pageInfo = new PageInfo<User>(users);
		return pageInfo;
	}
}