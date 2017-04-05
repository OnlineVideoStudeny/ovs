package stu.ovs.service.module;

import stu.ovs.dao.entity.Contents;

import java.util.List;
import java.util.Map;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
public interface ContentsService extends Service<Contents>{

    List<Map> findCategory();

    List<Map> findContents(Integer id);

    void addCategory(Contents contents);

    void addContents(Contents contents);

    Object delete(Integer id);

}
