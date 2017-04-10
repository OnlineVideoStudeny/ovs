package stu.ovs.dao.persistence;

/**
 * Created by Alcott Hawk on 4/3/2017.
 */
public interface BaseDao<T> {

    @SuppressWarnings("hiding")
	<T> T findById(Object id);

    void save(T arg);

    void delete(Object id);

    void update(T arg);

}
