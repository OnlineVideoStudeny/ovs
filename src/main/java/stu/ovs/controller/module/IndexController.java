package stu.ovs.controller.module;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import stu.ovs.service.module.ContentsService;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
public class IndexController {

    @Autowired
    private ContentsService contentsService;

    @RequestMapping(value = "/index")
    public String index(Model model){
        List category = contentsService.findCategory();
        model.addAttribute("categoryList",category);
        return "index";
    }

    @RequestMapping(value = "/registered", method = RequestMethod.GET)
    public String registered(){
        return "registered";
    }

}
