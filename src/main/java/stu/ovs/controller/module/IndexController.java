package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stu.ovs.dao.entity.Courses;
import stu.ovs.service.module.ContentsService;
import stu.ovs.service.module.CoursesService;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
public class IndexController {

    @Autowired
    private ContentsService contentsService;

    @Autowired
    private CoursesService coursesService;

    /**
     * 首页index，传递分类数据到前台显示
     * @param model
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(Model model){
        List category = contentsService.findCategory();
        model.addAttribute("categoryList",category);
        model.addAttribute("newVideo", coursesService.search(new Courses(), "id","",3));
        model.addAttribute("bestVideo", coursesService.search(new Courses(),"collect", "",3));
        return "index";
    }

    /**
     * 注册
     * @return
     */
    @RequestMapping(value = "/registered", method = RequestMethod.GET)
    public String registered(){
        return "registered";
    }

}
