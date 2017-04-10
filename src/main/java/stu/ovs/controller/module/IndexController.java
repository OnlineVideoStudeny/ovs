package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import stu.ovs.dao.entity.User;
import stu.ovs.dao.persistence.UserDao;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
public class IndexController {

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/index")
    public String index(){
        User user = userDao.findById("55");
        System.out.println(user);
        return "index";
    }

    @RequestMapping(value = "/registered", method = RequestMethod.GET)
    public String registered(){
        return "registered";
    }

}
