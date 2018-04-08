package me.kipling.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import me.kipling.entity.User;
import me.kipling.service.UserService;

/**
 * 
 * 用户控制器
 * 
 * @author Kipling
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger log = Logger.getLogger(UserController.class);

	public UserController() {
		log.info("---------springmvc初始化 ------UserController-----------------------------");
	}

	@Resource
	private UserService userService;

	/**
	 * 
	 * 新增一个用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public User addUser(User user) {
		log.info("UserController showUser-----------------");
		log.info("UserController showUser");
		try {
			Integer falg = userService.insert(user);
			log.info("================ flag =====" + falg);
		} catch (Exception e) {
			log.error("测试一下日志：", e);
		}
		return user;
	}

	/**
	 * 展示一个用户
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/show")
	public String showUser(HttpServletRequest request, Model model) {
		log.info("UserController showUser");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			User user = userService.getById(id);
			model.addAttribute("user", user);
		} catch (Exception e) {
			log.error("测试一下日志：", e);
		}
		return "showUser";
	}

	/**
	 * 获取用户,REST风格
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public User findUser(@PathVariable(value = "id") Integer userId) {
		log.info("UserController showUser");
		User user = null;
		try {
			user = userService.getById(userId);
		} catch (Exception e) {
			log.error("测试一下日志：", e);
		}
		return user;
	}

	/**
	 * 更新用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public User updateUser(User user) {
		int flag = userService.update(user);
		if (flag == 1) {
			log.info("更新成功");
		} else {
			log.info("更新失败");
		}
		return user;
	}

	/**
	 * 删除用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public Map<String, String> deleteUser(@PathVariable("id") Integer id) {
		int flag = userService.delete(id);
		Map<String, String> resultMap = new HashMap<String, String>();
		if (flag == 1) {
			resultMap.put("msg", "删除成功");
		} else {
			resultMap.put("msg", "删除失败");
		}
		return resultMap;
	}

}