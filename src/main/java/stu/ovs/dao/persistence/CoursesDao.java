package stu.ovs.dao.persistence;

import org.springframework.stereotype.Component;
import stu.ovs.dao.entity.Courses;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Component
public interface CoursesDao extends BaseDao{

    List<Courses> findByContents(Integer id);

}
