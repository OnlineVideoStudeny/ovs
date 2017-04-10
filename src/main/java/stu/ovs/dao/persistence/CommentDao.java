package stu.ovs.dao.persistence;

import java.util.List;

import org.springframework.stereotype.Component;

import stu.ovs.dao.entity.Comment;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */

@Component
public interface CommentDao extends BaseDao<Comment>{

    List<Comment> findByCourses(Integer id);

}
