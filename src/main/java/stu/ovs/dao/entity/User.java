package stu.ovs.dao.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体
 * Created by Alcott Hawk on 4/2/2017.
 */
public class User implements Serializable{

    public final static String MAN = "M";
    public final static String WOMAN = "W";

    public User(){
    }

    public User(String name, String password){
        this.password = password;
        this.name  = name;
    }

    private String id;          //id
    private String name;        //名称
    private String nickName;    //昵称
    private String password;    //密码
    private String salt;        //盐
    private String phone;       //电话
    private String email;       //电子邮件
    private String gender;      //性别
    private Date createDate;    //创建日期
    private Integer age;        //年龄
    private String avatars;     //头像

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAvatars() {
        return avatars;
    }

    public void setAvatars(String avatars) {
        this.avatars = avatars;
    }
}
