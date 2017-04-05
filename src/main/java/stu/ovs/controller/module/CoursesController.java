package stu.ovs.controller.module;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stu.ovs.dao.entity.Courses;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
@RequestMapping(value = "/courses")
public class CoursesController {

    /**
     * 课程首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(){
        return "";
    }

    /**
     * 课程添加
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(Courses courses){
        return "";
    }

    /**
     * 课程删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete")
    public Object delete(Integer id){
        return "";
    }

    /**
     * 点赞
     * @param id
     * @return
     */
    @RequestMapping(value = "/agree")
    public Object agree(Integer id){
        return "";
    }

    /**
     * 踩
     * @param id
     * @return
     */
    @RequestMapping(value = "/disagree")
    public Object disagree(Integer id){
        return "";
    }

    /**
     * 收藏
     * @param id
     * @return
     */
    @RequestMapping(value = "/collect")
    public Object collect(Integer id){
        return "";
    }

    /**
     * 添加课程目录
     * @param parent_id
     * @return
     */
    @RequestMapping(value = "/create/contents", method = RequestMethod.POST)
    public String add_contents(Integer parent_id){
        return "";
    }

    /**
     * 删除课程目录
     * @param parent_id
     * @return
     */
    @RequestMapping(value = "/delete/contents", method = RequestMethod.POST)
    public String delete_contents(Integer parent_id){
        return "";
    }

    /**
     * 上传课程视频
     * @return
     */
    @RequestMapping(value = "/add/video", method = RequestMethod.POST)
    public String add_video(){
        return "";
    }

}
