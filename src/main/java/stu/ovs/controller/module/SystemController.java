package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import stu.ovs.dao.entity.Contents;
import stu.ovs.service.module.ContentsService;
import stu.ovs.service.module.impl.ContentsServiceImpl;

import java.util.ArrayList;
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

    /**
     * 分类的添加
     * @param model
     * @return
     */
    @RequestMapping(value = "/category/add", method = RequestMethod.GET)
    public String createCategory(Model model){
        model.addAttribute("category",contentsService.findCategory());
        model.addAttribute("parentCategory", contentsService.findTopCategory());
        return "system/add-category";
    }

    @RequestMapping(value = "/category/add", method = RequestMethod.POST)
    public String createCategory(Contents contents, Model model){
        contents.setContentsType(ContentsServiceImpl.SYSTEM_CATEGRY);
        contentsService.addCategory(contents);
        model.addAttribute("category",contentsService.findCategory());
        return "redirect:/system/category/add";
    }

    @RequestMapping(value = "/getNext", method = RequestMethod.GET)
    @ResponseBody
    public List<Contents> getNext(Integer id){
        List next = contentsService.findNext(id, ContentsServiceImpl.SYSTEM_CATEGRY);
        if (null != next){
            return next;
        }
        return new ArrayList<>();
    }

    @RequestMapping(value = "/category/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteCategory(Integer id){
        return contentsService.delete(id);
    }

}
