package stu.ovs.service.module;

import stu.ovs.dao.entity.Comment;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
public interface CommentService extends Service<Comment>{

    List<Comment> findByCourses(Integer id);

    void delete(Integer id);

}
