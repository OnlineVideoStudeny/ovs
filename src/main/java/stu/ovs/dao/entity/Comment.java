package stu.ovs.dao.entity;

import java.util.Date;

/**
 * 评论实体
 * Created by Alcott Hawk on 4/2/2017.
 */
public class Comment {

    private Integer id;            //id
    private String commentator;    //评论人
    private Integer commentTarget; //评论目标
    private String content;        //评论内容
    private Date createDate;       //评论日期
    private Integer disagree;      //不赞同
    private Integer agree;         //赞同

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCommentator() {
        return commentator;
    }

    public void setCommentator(String commentator) {
        this.commentator = commentator;
    }

    public Integer getCommentTarget() {
        return commentTarget;
    }

    public void setCommentTarget(Integer commentTarget) {
        this.commentTarget = commentTarget;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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
