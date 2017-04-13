package stu.ovs.dao.entity;

/**
 * 目录实体
 * Created by Alcott Hawk on 4/2/2017.
 */
public class Contents {

    private Integer id;          //id
    private String name;         //名称
    private String description;  //描述
    private Integer parentId;    //父id
    private boolean isTop;       //是否是顶级目录
    private Integer topId;       //顶级目录id
    private String path;         //分类路径
    private String contentsType; //目录类型

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public boolean isTop() {
        return isTop;
    }

    public void setTop(boolean top) {
        isTop = top;
    }

    public Integer getTopId() {
        return topId;
    }

    public void setTopId(Integer topId) {
        this.topId = topId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getContentsType() {
        return contentsType;
    }

    public void setContentsType(String contentsType) {
        this.contentsType = contentsType;
    }
}
