package stu.ovs.dao.entity;

/**
 * 目录实体
 * Created by Alcott Hawk on 4/2/2017.
 */
public class Contents {

    private Integer id;
    private String name;
    private String description;
    private Integer parentId;
    private boolean isTop;
    private Integer topid;
    private String path;
    private String contentsType;

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

    public Integer getTopid() {
        return topid;
    }

    public void setTopid(Integer topid) {
        this.topid = topid;
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
