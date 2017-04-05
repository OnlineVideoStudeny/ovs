package stu.ovs.service.module;

import stu.ovs.dao.entity.User;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
public interface Service {

    User findOne(Object id);

    List<? extends Class> findAll();

    void delete(Object id);

}
