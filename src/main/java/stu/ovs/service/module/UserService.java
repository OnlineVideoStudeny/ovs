package stu.ovs.service.module;

import stu.ovs.dao.entity.User;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
public interface UserService extends Service{

    User login(String user);

}
