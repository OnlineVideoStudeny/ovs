package stu.ovs.controller.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import stu.ovs.dao.entity.Comment;
import stu.ovs.dao.entity.Contents;
import stu.ovs.dao.entity.Courses;
import stu.ovs.service.module.CommentService;
import stu.ovs.service.module.ContentsService;
import stu.ovs.service.module.CoursesService;
import stu.ovs.util.FileUtil;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
@Controller
@RequestMapping(value = "/courses")
public class CoursesController {

    @Autowired
    private CoursesService coursesService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private ContentsService contentsService;

    /**
     * 课程首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(Integer id, Model model){
        Courses courses = coursesService.findOne(id);
        model.addAttribute("courses", courses);
        List<Comment> comment = commentService.findByCourses(id);
        model.addAttribute("comment", comment);
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
    public String addVideo(Courses courses, MultipartFile file, Model model){
        if (FileUtil.save(file, "c://file")){
            courses.setImg(file.getOriginalFilename());
            coursesService.add(courses);
            //TODO 查找目录
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
        Courses courses = coursesService.findOne(id);
        if (null != courses){
            coursesService.delete(courses);
            return "ok";
        }
        return "error";
    }

    /**
     * 点赞
     * @param id
     * @return
     */
    @RequestMapping(value = "/agree")
    @ResponseBody
    public Object agree(Integer id){
        Courses courses = coursesService.findOne(id);
        if (null != courses){
            courses.setAgree(courses.getAgree()+1);
            coursesService.update(courses);
            return courses.getAgree();
        }
        return "error";
    }

    /**
     * 踩
     * @param id
     * @return
     */
    @RequestMapping(value = "/disagree")
    @ResponseBody
    public Object disagree(Integer id){
        Courses courses = coursesService.findOne(id);
        if (null != courses){
            courses.setAgree(courses.getAgree()+1);
            coursesService.update(courses);
            return courses.getAgree();
        }
        return "error";
    }

    /**
     * 收藏
     * @param id
     * @return
     */
    @RequestMapping(value = "/collect")
    @ResponseBody
    public Object collect(Integer id){
        Courses courses = coursesService.findOne(id);
        if (null != courses){
            courses.setAgree(courses.getCollect()+1);
            coursesService.update(courses);
            return courses.getCollect();
        }
        return "error";
    }

    /**
     * 添加课程目录
     * @param contents
     * @param model
     * @return
     */
    @RequestMapping(value = "/contents/create", method = RequestMethod.POST)
    public String addContents(Contents contents,Model model){
        contentsService.addContents(contents);
        return "courses/add-courses";
    }

    /**
     * 删除课程目录
     * @param parent_id
     * @return
     */
    @RequestMapping(value = "/contents/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteContents(Integer id){
        Courses courses = coursesService.findOne(id);
        if (null != courses){
            contentsService.delete(id);
            return "ok";
        }
        return "error";
    }

}
