package stu.ovs.dao.persistence;

import org.springframework.stereotype.Component;
import stu.ovs.dao.entity.Courses;

import java.util.List;
import java.util.Map;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Component
public interface CoursesDao extends BaseDao<Courses>{

    List<Courses> findByContents(Integer id);

    void addCoursesIndex(Map arg);

}
