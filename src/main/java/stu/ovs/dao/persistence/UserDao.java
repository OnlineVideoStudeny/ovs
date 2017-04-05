package stu.ovs.dao.persistence;

import org.springframework.stereotype.Component;
import stu.ovs.dao.entity.User;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Component
public interface UserDao {

    User findById(String id);

    List<User> findByPagination(int pageSize, int pageNo);

    void save(User user);

    void delete(String id);

    void update(User user);

}
