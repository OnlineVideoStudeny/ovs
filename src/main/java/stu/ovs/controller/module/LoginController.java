package stu.ovs.controller.module;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author Alcott Hawk
 * @Date 12/13/2016
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    /**
     * 登陆
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * 登陆验证，此处为登陆失败的跳转，登陆实际在shiroFilter中处理
     * @param userName
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        model.addAttribute("fail", "用户名或密码错误");
        return "login";
    }

}
