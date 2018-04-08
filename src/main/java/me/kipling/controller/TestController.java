package me.kipling.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import me.kipling.entity.User;


/**
 * 在Controller的方法中，如果需要WEB元素HttpServletRequest，HttpServletResponse和HttpSession，
 * 只需要在给方法一个对应的参数，那么在访问的时候SpringMVC就会自动给其传值，
 * 但是需要注意的是在传入Session的时候如果是第一次访问系统的时候就调用session会报错，因为这个时候session还没有生成。
 * @author Kipling
 *
 */
@Controller
@RequestMapping("/test") 
public class TestController {
	
	private static Map<String, String> sortTypes = new LinkedHashMap<String, String>();
    static {
		sortTypes.put("id_ASC", "自动");
		sortTypes.put("name_ASC", "名称");
		sortTypes.put("resType_ASC", "类型");
		sortTypes.put("resString_ASC", "资源字符串");
    }
    

    @RequestMapping("login.do")  // 请求url地址映射，类似Struts的action-mapping
    public String testLogin(@RequestParam(value="username")String username, String password, HttpServletRequest request) {
        // @RequestParam是指请求url地址映射中必须含有的参数(除非属性required=false)
        // @RequestParam可简写为：@RequestParam("username")

        if (!"admin".equals(username) || !"admin".equals(password)) {
            return "loginError"; // 跳转页面路径（默认为转发），该路径不需要包含spring-servlet配置文件中配置的前缀和后缀
        }
        return "loginSuccess";
    }

    @RequestMapping("/login2.do")
    public ModelAndView testLogin2(String username, String password, int age){
        // request和response不必非要出现在方法中，如果用不上的话可以去掉
        // 参数的名称是与页面控件的name相匹配，参数类型会自动被转换
        
        if (!"admin".equals(username) || !"admin".equals(password) || age < 5) {
            return new ModelAndView("loginError"); // 手动实例化ModelAndView完成跳转页面（转发），效果等同于上面的方法返回字符串
        }
        return new ModelAndView(new RedirectView("../index.jsp"));  // 采用重定向方式跳转页面
        // 重定向还有一种简单写法
        // return new ModelAndView("redirect:../index.jsp");
    }

    @RequestMapping("login3.do")
    public ModelAndView testLogin3(User user) {
        // 同样支持参数为表单对象，类似于Struts的ActionForm，User不需要任何配置，直接写即可
        String username = user.getName();
        String password = user.getPassword();
        int age = user.getAge();
        
        if (!"admin".equals(username) || !"admin".equals(password) || age < 5) {
            return new ModelAndView("loginError");
        }
        return new ModelAndView("loginSuccess");
    }
	
    @RequestMapping("login4.do")
    public String testLogin4(User user) {
        return "loginSuccess";
    }
    
    @RequestMapping(value="/user/{userId}", method=RequestMethod.POST)
    public void comment(User user,@PathVariable int blogId, HttpSession session, HttpServletResponse response) throws IOException {
        
    }
    
    @RequestMapping(value="login5.do",method=RequestMethod.GET)
    public String testLogin5(User user) {
        return "loginSuccess";
    }
    
	@RequestMapping("/ajaxTest")
	@ResponseBody
	public Map<String, Object> ajaxTest(String name, String password) {
		System.out.println("name:" + name + ",password:" + password);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "我接到ajax请求了！！！");
		return map;
	}
}