package stu.ovs.dao.persistence;

import java.util.List;

import org.springframework.stereotype.Component;

import stu.ovs.dao.entity.User;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Component
public interface UserDao extends BaseDao<User>{

    List<User> findAll();

    User findByNickName(String nickname);

}
