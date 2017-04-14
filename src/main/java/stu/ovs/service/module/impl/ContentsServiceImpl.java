package stu.ovs.service.module.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stu.ovs.dao.entity.Contents;
import stu.ovs.dao.persistence.ContentsDao;
import stu.ovs.service.module.ContentsService;

import java.util.*;

/**
 * 目录service
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class ContentsServiceImpl implements ContentsService{

    public static String SYSTEM_CATEGORY = "system_category";
    public static String COURSES_CONTENTS = "courses_contents";

    @Autowired
    private ContentsDao contentsDao;

    public Contents findOne(Object id) {
        Object object = contentsDao.findById(id);
        if (null != object){
            return (Contents) object;
        }
        return new Contents();
    }

    public List<Contents> findAll() {
        return null;
    }

    @Override
    public Object delete(Integer id) {
        Contents target = (Contents) contentsDao.findById(id);
        if ( null != contentsDao.findByParentId(target.getId())){
            return false;
        } else {
            contentsDao.delete(id);
            return true;
        }
    }

    @Deprecated
    public void delete(Contents id) {
        Contents target = (Contents) contentsDao.findById(id);
        if ( null != contentsDao.findByParentId(target.getId())){
            contentsDao.delete(target.getId());
        }
    }

    public void update(Contents contents) {
        contentsDao.update(contents);
    }

    /**
     * 添加一条目录(课程目录，分类信息)
     * @param contents
     */
    public void add(Contents contents) {
        contentsDao.save(contents);
    }

    /**
     * 查找一个分类信息
     * @return
     */
    @Override
    public List<Map> findCategory() {
        List<Contents> contentsList = contentsDao.findByContentsType(SYSTEM_CATEGORY);
        List<Map> menuList = new ArrayList<Map>();
        for (Contents contents : contentsList){
            if (contents.getParentId() == 0){
                List children = findChildren(contentsList,contents.getId());
                this.loadData(menuList, contents, children);
            }
        }
        return menuList;
    }

    /**
     * 查找一个课程的目录
     * @param id
     * @return
     */
    @Override
    public List<Map> findContents(Integer id) {
        List<Contents> contentsList = contentsDao.findByCourses(id, COURSES_CONTENTS);
        return doProcess(contentsList);
    }

    @Override
    public Contents findContentsWithCourses(Integer id) {
        return contentsDao.findWithCourses(id);
    }

    @Override
    public Object findTop(Integer id) {
        List<Contents> contentsList = contentsDao.findByTopId(id, COURSES_CONTENTS);
        Iterator<Contents> iterator = contentsList.iterator();
        Contents contents = new Contents();
        while (iterator.hasNext()){
            Contents cont = iterator.next();
            if (cont.isTop()){
                contents = cont;
            }
        }
        if (null == contents.getId()){
            return "null";
        }
        return contents;
    }

    @Override
    public List<Contents> findNext(Integer id, String type) {
        if (null != id && ( StringUtils.equals(type, ContentsServiceImpl.COURSES_CONTENTS) ||
                StringUtils.equals(type, ContentsServiceImpl.SYSTEM_CATEGORY))){
            return contentsDao.findByParentId(id, type);
        }
        return new ArrayList<>();
    }

    @Override
    public List<Map> findByTopId(Integer id) {
        List<Contents> contentsList = contentsDao.findByTopId(id, COURSES_CONTENTS);
        return doProcess(contentsList);
    }

    @Override
    public List<Contents> findTopCategory() {
        List<Contents> contentsList = contentsDao.findByParentId(0, ContentsServiceImpl.SYSTEM_CATEGORY);
        if (null != contentsList){
            return contentsList;
        }
        return new ArrayList<>();
    }

    @Override
    public void addCategory(Contents contents) {
        if (null == contents.getParentId()){
            contents.setPath("0|");
            contents.setParentId(0);
        } else {
            Contents contentsParent = (Contents) contentsDao.findById(contents.getParentId());
            contents.setPath(contentsParent.getPath() + contentsParent.getId() + "|");
        }
        add(contents);
    }

    @Override
    public void addContents(Contents contents) {
        if (null == contents.getParentId()){
            contents.setPath("0|");
            contents.setParentId(0);
            contents.setTop(true);
            contents.setTopId(0);
        } else {
            Contents contentsParent = (Contents) contentsDao.findById(contents.getParentId());
            contents.setPath(contentsParent.getPath() + contentsParent.getId() + "|");
            contents.setTop(false);
            if (StringUtils.isBlank(contentsParent.getTopId().toString())){
                contents.setTopId(contentsParent.getParentId());
            } else {
                if (contentsParent.isTop()){
                    contents.setTopId(contentsParent.getId());
                } else {
                    contents.setTopId(contentsParent.getTopId());
                }
            }
        }
        add(contents);
    }

    /**
     * 查询子分类
     * @param contentsList
     * @param id
     * @return
     */
    private List findChildren(List<Contents> contentsList,int id){
        List<Map> menuList = new ArrayList<Map>();
        for(Contents contents : contentsList){
            if (contents.getParentId() == id){
                List children = findChildren(contentsList,contents.getId());
                this.loadData(menuList, contents, children);
            }
        }
        return menuList;
    }

    /**
     * 添加分类数据到集合
     * @param menuList 分类目标集合
     * @param children 子分类
     */
    private void loadData(List<Map> menuList, Contents contents, List children){
        Map map = new HashMap();
        map.put("name",contents.getName());
        map.put("id",contents.getId());
        map.put("children",children);
        menuList.add(map);
    }

    /**
     * 处理集合，封装出适合使用的json数据
     * @param contentsList
     * @return
     */
    private List<Map> doProcess(List<Contents> contentsList){
        List<Map> menuList = new ArrayList<Map>();
        for (Contents contents : contentsList){
            if (contents.isTop()){
                List children = findChildren(contentsList,contents.getId());
                this.loadData(menuList, contents, children);
            }
        }
        return menuList;
    }
}
