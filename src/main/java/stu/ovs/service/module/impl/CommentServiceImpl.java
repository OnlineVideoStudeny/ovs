package stu.ovs.service.module.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Comment;
import stu.ovs.dao.entity.User;
import stu.ovs.service.module.CommentService;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService{

    public User findOne(Object id) {
        return null;
    }

    public List<? extends Class> findAll() {
        return null;
    }

    public void delete(Comment id) {

    }

    public void update(Comment comment) {

    }

    public void add(Comment comment) {

    }
}
