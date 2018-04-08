package me.kipling.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import me.kipling.common.page.EasyUIResult;
import me.kipling.common.page.QueryInfo;
import me.kipling.entity.User;
import me.kipling.service.UserService;

/**
 * 测试Mybatis分页助手和通用mapper控制器
 * 
 * @author Kipling
 *
 */
@Controller
@RequestMapping("newuser")
public class UserNewController {

	@Resource
	private UserService userService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String toUsersPage() {
		return "users";
	}

	@RequestMapping(value = "data/list", method = RequestMethod.GET)
	@ResponseBody
	public EasyUIResult queryUserList(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "5") Integer rows) {
		QueryInfo queryInfo = new QueryInfo(page, rows);
		return userService.queryUserList(queryInfo);
	}

	@RequestMapping(value = "mapper/list", method = RequestMethod.GET)
	@ResponseBody
	public List<User> selectCountByExample() {
		return userService.selectCountByExample();
	}

	@RequestMapping(value = "mapper/delete1", method = RequestMethod.GET)
	@ResponseBody
	public int deleteByExample() {
		return userService.deleteByExample();
	}

	@RequestMapping(value = "mapper/get/{id}", method = RequestMethod.GET)
	@ResponseBody
	public User deleteByExample(@PathVariable(value = "id") Integer userId) {
		return userService.selectByPrimaryKey(userId);
	}

	@RequestMapping(value = "mapper/user", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public User selectOne(@RequestBody User user) {
		return userService.selectOne(user);
	}

	@RequestMapping(value = "mapper/page", method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<User> select(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "5") Integer rows) {
		return userService.select(page, rows);
	}
}