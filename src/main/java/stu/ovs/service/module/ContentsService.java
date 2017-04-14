package stu.ovs.service.module;

import stu.ovs.dao.entity.Contents;

import java.util.List;
import java.util.Map;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
public interface ContentsService extends Service<Contents>{

    /**
     * 获取分类信息
     * @return
     */
    List<Map> findCategory();

    /**
     * 获取目录信息
     * @param id
     * @return
     */
    List<Map> findContents(Integer id);

    /**
     * 获取目录信息
     * @param id
     * @return
     */
    Contents findContentsWithCourses(Integer id);

    /**
     * 获取子节点信息
     * @param id
     * @return
     */
    List<Contents> findNext(Integer id, String type);

    /**
     * 查找顶级结点下的信息
     * @param id
     * @return
     */
    List<Map> findByTopId(Integer id);

    List<Contents> findTopCategory();

    /**
     * 添加分类
     * @param contents
     */
    void addCategory(Contents contents);

    /**
     * 添加目录
     * @param contents
     */
    void addContents(Contents contents);

    /**
     * 删除信息
     * @param id
     * @return
     */
    Object delete(Integer id);

}
