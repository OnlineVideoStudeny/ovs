package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import stu.ovs.dao.entity.User;
import stu.ovs.service.module.UserService;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户中心首页
     * @param id
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(String id){
        return "user/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(User user, Model model){
        if (userService.regiter(user)){
            return "redirect:index";
        } else {
            return "redirect:/registered";
        }
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(String id){
        User user = userService.findOne(id);
        if (null != user){
            userService.delete(user);
            return "ok";
        }
        return "error";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(User user){
        userService.update(user);
        return "user/index";
    }

}
