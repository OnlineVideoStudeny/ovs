package stu.ovs.service.module.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Comment;
import stu.ovs.dao.entity.User;
import stu.ovs.dao.persistence.CommentDao;
import stu.ovs.service.ShiroUser;
import stu.ovs.service.module.CommentService;

import java.util.List;

/**
 * 评论service
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentDao commentDao;

    public Comment findOne(Object id) {
        Comment comment = (Comment) commentDao.findById(id);
        if ( null != comment){
            return comment;
        }
        return new Comment();
    }

    public List<Comment> findAll() {
        return null;
    }

    @Override
    public void delete(Integer id) {
        commentDao.delete(id);
    }

    @Deprecated
    public void delete(Comment id) {
    }

    public void update(Comment comment) {
        commentDao.update(comment);
    }

    public void add(Comment comment) {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        comment.setCommentator(shiroUser.id);
        commentDao.save(comment);
    }

    @Override
    public List<Comment> findByCourses(Integer id) {
        List<Comment> commentList = commentDao.findByCourses(id);
        return commentList;
    }

}
package stu.ovs.service.module.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Comment;
import stu.ovs.dao.entity.User;
import stu.ovs.dao.persistence.CommentDao;
import stu.ovs.service.ShiroUser;
import stu.ovs.service.module.CommentService;

import java.util.List;

/**
 * 评论service
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentDao commentDao;

    public Comment findOne(Object id) {
        Comment comment = (Comment) commentDao.findById(id);
        if ( null != comment){
            return comment;
        }
        return new Comment();
    }

    public List<Comment> findAll() {
        return null;
    }

    @Override
    public void delete(Integer id) {
        commentDao.delete(id);
    }

    @Deprecated
    public void delete(Comment id) {
    }

    public void update(Comment comment) {
        commentDao.update(comment);
    }

    public void add(Comment comment) {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        comment.setCommentator(shiroUser.id);
        commentDao.save(comment);
    }

    @Override
    public List<Comment> findByCourses(Integer id) {
        List<Comment> commentList = commentDao.findByCourses(id);
        return commentList;
    }

}
