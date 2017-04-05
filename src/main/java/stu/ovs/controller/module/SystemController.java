package stu.ovs.controller.module;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Alcott Hawk on 4/5/2017.
 */
@Controller
@RequestMapping(value = "/system")
public class SystemController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "";
    }

    @RequestMapping(value = "/category/add", method = RequestMethod.POST)
    public String createCategory(){
        return "";
    }

    @RequestMapping(value = "/category/delete", method = RequestMethod.POST)
    public String deleteCategory(){
        return "";
    }

}
