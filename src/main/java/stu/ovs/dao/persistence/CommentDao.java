package stu.ovs.dao.persistence;

import org.springframework.stereotype.Component;
import stu.ovs.dao.entity.Comment;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Component
public interface CommentDao extends BaseDao{

    List<Comment> findByCourses(Integer id);

}
