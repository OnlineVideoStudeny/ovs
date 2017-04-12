package stu.ovs.service.module.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import stu.ovs.dao.entity.Courses;
import stu.ovs.dao.persistence.CoursesDao;
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

	@Autowired
	private VideoProcessService videoProcessService;

	@Autowired
	private CoursesDao coursesDao;
	
	/**
	 * 根据课程ID查找某个课程
	 */
    public Courses findOne(Object id) {
        Courses courses = coursesDao.findById(id);
        if (null != courses){
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
		coursesDao.save(courses);
		courses.getId();
		Map arg = new HashMap();
		arg.put("coursesId", courses.getId());
		arg.put("contentsId", courses.getContentsId());
		coursesDao.addCoursesIndex(arg);
	}

    @Override
    public List<Courses> findByCategoryId(Integer id) {
        if (null != id){
            return coursesDao.findByCategory(id);
        }
        return new ArrayList<>();
    }
}
