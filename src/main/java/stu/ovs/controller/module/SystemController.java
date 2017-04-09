package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import stu.ovs.dao.entity.Contents;
import stu.ovs.service.module.ContentsService;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/5/2017.
 */
@Controller
@RequestMapping(value = "/system")
public class SystemController {

    @Autowired
    private ContentsService contentsService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "system/index";
    }

    @RequestMapping(value = "/category/get")
    @ResponseBody
    public Object getCategory(){
        return contentsService.findCategory();
    }

    @RequestMapping(value = "/category/add", method = RequestMethod.GET)
    public String createCategory(){
        return "system/add-category";
    }

    @RequestMapping(value = "/category/add", method = RequestMethod.POST)
    public String createCategory(Contents contents){
        return "system/index";
    }

    @RequestMapping(value = "/category/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteCategory(){
        return "";
    }

    @RequestMapping(value = "/registered", method = RequestMethod.GET)
    public String registered(){
        return "registered";
    }

}
