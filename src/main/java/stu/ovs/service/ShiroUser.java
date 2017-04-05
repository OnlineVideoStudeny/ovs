package stu.ovs.service;

/**
 * shiro认证用户实体，不会被持久化到数据库，只作为基本实体类使用
 */
public class ShiroUser {

    public String id;
    public String nickName;
    public String ip;

    public ShiroUser(String id, String nickName, String ip){
        this.id=id;
        this.nickName=nickName;
        this.ip=ip;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
