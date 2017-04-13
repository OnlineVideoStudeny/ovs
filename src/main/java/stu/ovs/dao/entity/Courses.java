package stu.ovs.dao.entity;

/**
 * 课程实体
 * Created by Alcott Hawk on 4/2/2017.
 */
public class Courses {

    private Integer id;           //id
    private String name;          //名称
    private String description;   //描述
    private String img;           //图片
    private Integer contentsId;   //内容id
    private Integer attention;    //关注数量
    private Integer collect;      //收藏数量
    private Integer disagree;     //不赞同
    private Integer agree;        //赞同

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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getContentsId() {
        return contentsId;
    }

    public void setContentsId(Integer contentsId) {
        this.contentsId = contentsId;
    }

    public Integer getAttention() {
        return attention;
    }

    public void setAttention(Integer attention) {
        this.attention = attention;
    }

    public Integer getCollect() {
        return collect;
    }

    public void setCollect(Integer collect) {
        this.collect = collect;
    }

    public Integer getDisagree() {
        return disagree;
    }

    public void setDisagree(Integer disagree) {
        this.disagree = disagree;
    }

    public Integer getAgree() {
        return agree;
    }

    public void setAgree(Integer agree) {
        this.agree = agree;
    }
}
