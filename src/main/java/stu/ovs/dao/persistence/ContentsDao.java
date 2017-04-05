package stu.ovs.dao.persistence;

import org.springframework.stereotype.Component;
import stu.ovs.dao.entity.Contents;

import java.util.List;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Component
public interface ContentsDao extends BaseDao{

    List<Contents> findByContentsType(String type);

    List<Contents> findByCourses(Integer id);

    Contents findByParentId(Integer id);

}
