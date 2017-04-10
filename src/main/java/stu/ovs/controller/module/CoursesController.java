package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import stu.ovs.dao.entity.Contents;
import stu.ovs.dao.entity.Courses;
import stu.ovs.service.module.CoursesService;
import stu.ovs.util.FileUtil;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
@RequestMapping(value = "/courses")
public class CoursesController {

    @Autowired
    private CoursesService coursesService;

    /**
     * 课程首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(){
        return "courses/index";
    }

    /**
     * 课程添加
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Courses courses){
        return "courses/add-courses";
    }

    /**
     * 上传课程视频
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addVideo(Courses courses, MultipartFile file){
        if (FileUtil.save(file, "c://file")){
            courses.setImg(file.getOriginalFilename());
            coursesService.add(courses);
        }
        return "system/index";
    }

    /**
     * 课程删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(Integer id){
        return "ok";
    }

    /**
     * 点赞
     * @param id
     * @return
     */
    @RequestMapping(value = "/agree")
    @ResponseBody
    public Object agree(Integer id){
        return "";
    }

    /**
     * 踩
     * @param id
     * @return
     */
    @RequestMapping(value = "/disagree")
    @ResponseBody
    public Object disagree(Integer id){
        return "";
    }

    /**
     * 收藏
     * @param id
     * @return
     */
    @RequestMapping(value = "/collect")
    @ResponseBody
    public Object collect(Integer id){
        return "";
    }

    /**
     * 添加课程目录
     * @param parent_id
     * @return
     */
    @RequestMapping(value = "/contents/create", method = RequestMethod.POST)
    public String addContents(Contents contents){
        return "";
    }

    /**
     * 删除课程目录
     * @param parent_id
     * @return
     */
    @RequestMapping(value = "/contents/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteContents(Integer parent_id){
        return "";
    }

}
