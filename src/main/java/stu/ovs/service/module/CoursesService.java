package stu.ovs.service.module;

import stu.ovs.dao.entity.Courses;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
public interface CoursesService extends Service<Courses>{

    List<Courses> findByCategoryId(Integer id);

    Courses findCourses(Integer id);

    List<Courses> search(Courses courses, String orderBy, String sort, Integer size);

}
