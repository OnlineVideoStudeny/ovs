package stu.ovs.service.module.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Contents;
import stu.ovs.dao.entity.User;
import stu.ovs.service.module.ContentsService;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class ContentsServiceImpl implements ContentsService{
    public User findOne(Object id) {
        return null;
    }

    public List<? extends Class> findAll() {
        return null;
    }

    public void delete(Contents id) {

    }

    public void update(Contents contents) {

    }

    public void add(Contents contents) {

    }
}
