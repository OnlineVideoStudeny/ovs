package stu.ovs.service.module.impl;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.User;
import stu.ovs.dao.persistence.UserDao;
import stu.ovs.service.module.UserService;
import stu.ovs.service.module.VideoProcessService;
import stu.ovs.util.EncryptUtil;
import stu.ovs.util.HashKit;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{

    private static Logger logger = LoggerFactory.getLogger(VideoProcessService.class);

    @Autowired
    private UserDao userDao;

    public User login(String user) {
        return null;
    }

    public User findOne(Object id) {
        User user = userDao.findById(id.toString());
        if (null == user){
            return new User();
        }
        return user;
    }

    public List<? extends Class> findAll() {
        return null;
    }

    public void add(User user){
        String salt = EncryptUtil.encodeHex(EncryptUtil.salt(8));
        SimpleHash simpleHash = new SimpleHash("SHA-1",user.getPassword(),salt,1024);
        user.setSalt(salt);
        user.setPassword(simpleHash.toString());
        userDao.save(user);
    }

    public void delete(Object id) {
        userDao.delete(id.toString());
    }
}
