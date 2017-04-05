package stu.ovs.service.module.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Courses;
import stu.ovs.dao.entity.User;
import stu.ovs.dao.persistence.CoursesDao;
import stu.ovs.service.module.CoursesService;
import stu.ovs.service.module.VideoProcessService;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class CoursesServiceImpl implements CoursesService{

    private static Logger logger = LoggerFactory.getLogger(VideoProcessService.class);

    @Autowired
    private VideoProcessService videoProcessService;

    @Autowired
    private CoursesDao coursesDao;


    public Courses findOne(Object id) {
        coursesDao.findById(id);
        return null;
    }

    public List<Courses> findAll() {
        return null;
    }

    public void delete(Courses id) {

    }

    public void update(Courses courses) {

    }

    public void add(Courses courses) {

    }
}
