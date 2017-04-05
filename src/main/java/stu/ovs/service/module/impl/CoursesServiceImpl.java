package stu.ovs.service.module.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.User;
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
    private CoursesService coursesService;

    public User findOne(Object id) {
        return null;
    }

    public List<? extends Class> findAll() {
        return null;
    }

    public void delete(Object id) {

    }
}
