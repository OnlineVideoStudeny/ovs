package stu.ovs.service.module.impl;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Courses;
import stu.ovs.dao.persistence.CoursesDao;
import stu.ovs.service.module.ContentsService;
import stu.ovs.service.module.CoursesService;
import stu.ovs.service.module.VideoProcessService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class CoursesServiceImpl implements CoursesService {

	private static Logger logger = LoggerFactory.getLogger(VideoProcessService.class);

    public static String PATH = "/file/";

	@Autowired
	private VideoProcessService videoProcessService;

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private CoursesDao coursesDao;

	/**
	 * 根据课程ID查找某个课程
	 */
	public Courses findOne(Object id) {
		Courses courses = coursesDao.findById(id);
		if (null != courses) {
			return courses;
		}
		return new Courses();
	}

	public List<Courses> findAll() {
		return coursesDao.findAll();
	}

	public void delete(Courses id) {

	}

	public void update(Courses courses) {
		coursesDao.update(courses);
	}

	public void add(Courses courses) {
        String imgPath = "";
        try {
            imgPath = videoProcessService.makeScreenCut(courses.getImg(), videoProcessService.SCREN_SIZE, videoProcessService.CUT_TIME);
            courses.setImg(imgPath);
            coursesDao.save(courses);
            courses.getId();
            Map arg = new HashMap();
            arg.put("coursesId", courses.getId());
            arg.put("contentsId", courses.getContentsId());
            coursesDao.addCoursesIndex(arg);
        } catch (Exception e) {
            logger.error("生成截图失败："+e.getMessage());
        }
	}

	@Override
	public List<Courses> findByCategoryId(Integer id) {
		if (null != id) {
			return coursesDao.findByCategory(id);
		}
		return new ArrayList<>();
	}

	@Override
	public Courses findCourses(Integer id) {
		if (null != id) {
			Courses courses = (Courses) coursesDao.findByContents(id);
			if (null != courses) {
				return courses;
			} else {
				return new Courses();
			}
		}
		return new Courses();
	}

    @Override
    public List<Courses> search(Courses courses, String order, String sort, Integer size) {
	    if (null == courses){
	        return coursesDao.findAll();
        }else {
            if (StringUtils.isBlank(sort)){
                sort = "DESC";
            }
            if (null == size){
                size = 10;
            }
            List list = coursesDao.filter(courses, sort, size);
            if (null != list && list.size() > 0){
                return list;
            } else {
                return new ArrayList<>();
            }
        }
    }
}
