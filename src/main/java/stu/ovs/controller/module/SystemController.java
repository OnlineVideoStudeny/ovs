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

    /**
     * 获取分类信息，返回数据为接送数据
     * @return
     */
    @RequestMapping(value = "/category/get")
    @ResponseBody
    public Object getCategory(){
        return contentsService.findCategory();
    }

    /**
     * 分类的添加，传递分类数据和顶级分类供前台显示
     * @param model
     * @return
     */
    @RequestMapping(value = "/category/add", method = RequestMethod.GET)
    public String createCategory(Model model){
        model.addAttribute("category",contentsService.findCategory());
        model.addAttribute("parentCategory", contentsService.findTopCategory());
        return "system/add-category";
    }

    /**
     * 分类添加， 返回分类数据到前台供显示
     * @param contents 分类数据对象
     * @param model
     * @return
     */
    @RequestMapping(value = "/category/add", method = RequestMethod.POST)
    public String createCategory(Contents contents, Model model){
        contents.setContentsType(ContentsServiceImpl.SYSTEM_CATEGORY);
        contentsService.addCategory(contents);
        model.addAttribute("category",contentsService.findCategory());
        return "redirect:/system/category/add";
    }

    /**
     * 获取下一个分类节点的数据，返回数据为json格式
     * @param id
     * @return
     */
    @RequestMapping(value = "/getNext", method = RequestMethod.GET)
    @ResponseBody
    public List<Contents> getNext(Integer id){
        List next = contentsService.findNext(id, ContentsServiceImpl.SYSTEM_CATEGORY);
        if (null != next){
            return next;
        }
        return new ArrayList<>();
    }

    /**
     * 删除一个分类
     * @param id
     * @return
     */
    @RequestMapping(value = "/category/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteCategory(Integer id){
        return contentsService.delete(id);
    }

}
