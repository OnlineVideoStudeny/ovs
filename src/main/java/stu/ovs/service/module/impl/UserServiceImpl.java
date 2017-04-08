package stu.ovs.service.module.impl;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.Sha1Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import stu.ovs.dao.entity.User;
import stu.ovs.dao.persistence.UserDao;
import stu.ovs.service.module.UserService;
import stu.ovs.service.module.VideoProcessService;
import stu.ovs.util.EncryptUtil;
import java.util.List;
import java.util.UUID;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{

    private static Logger logger = LoggerFactory.getLogger(VideoProcessService.class);

    @Autowired
    private UserDao userDao;

    public User login(String nickname) {
        User user = userDao.findByNickName(nickname);
        return user;
    }

    public User findOne(Object id) {
        User user = userDao.findById(id.toString());
        if (null == user){
            return new User();
        }
        return user;
    }

    public List<User> findAll() {
        return null;
    }

    public void delete(User id) {
        userDao.delete(id.toString());
    }

    public void update(User user) {

    }

    public void add(User user) {
        userDao.save(user);
    }

    @Override
    public boolean regiter(User user) {
        String salt = Hex.encodeToString(EncryptUtil.salt(8));
        user.setSalt(salt);
        user.setName(user.getNickName());
        String password = new SimpleHash("SHA-1", user.getPassword().trim(), salt, 1024).toString();
        user.setPassword(password);
        String id = StringUtils.remove(UUID.randomUUID().toString(),"-");
        user.setId(id);
        try {
            add(user);
            return true;
        } catch (Exception e){
            return false;
        }
    }

}
