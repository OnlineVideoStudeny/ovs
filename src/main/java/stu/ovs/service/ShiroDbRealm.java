package stu.ovs.service;

import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import stu.ovs.dao.entity.User;
import stu.ovs.service.module.UserService;
import stu.ovs.util.EncryptUtil;

import javax.annotation.PostConstruct;

/**
 * 自定义ShiroDbRealm
 * shiro认证授权由此处理
 */
public class ShiroDbRealm extends AuthorizingRealm{

    @Autowired
    protected UserService userService;

    /**
     * 授权回调
     * @param principalCollection
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        ShiroUser shiroUser = (ShiroUser) principalCollection.getPrimaryPrincipal();
        User user = userService.login(shiroUser.loginNmae);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        return info;
    }

    /**
     * 认证回调
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        User user = userService.login(username);
        if (user != null) {
            ShiroUser shiroUser = new ShiroUser(user.getNickName(), user.getName(),token.getHost(),user.getId());
            String salt = user.getSalt();
            return new SimpleAuthenticationInfo(shiroUser,user.getPassword(), ByteSource.Util.bytes(salt),getName());
        } else {
            return null;
        }
    }


    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    /*public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher("SHA-1");
        SimpleCredentialsMatcher simpleCredentialsMatcher = new SimpleCredentialsMatcher();
        matcher.setHashIterations(1024);
        setCredentialsMatcher(matcher);
    }*/

}
