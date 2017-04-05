package stu.ovs.dao.persistence;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
public interface BaseDao {

    <T> T findById(Integer id);

    void save(Class<?> arg);

    void delete(String id);

    void update(Class<?> arg);

}
