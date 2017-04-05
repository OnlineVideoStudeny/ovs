package stu.ovs.controller.module;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stu.ovs.dao.entity.User;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    /**
     * 用户中心首页
     * @param id
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(String id){
        return "";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(User user){
        return "";
    }

    @RequestMapping(value = "/delete")
    public String delete(String id){
        return "";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(User user){
        return "";
    }

}
