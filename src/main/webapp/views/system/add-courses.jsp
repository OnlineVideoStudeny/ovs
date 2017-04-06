<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Title</title>
<section>
    <h3>
        课程目录
    </h3>
</section>
<section>
    <div style="float: right">
        <a class="button">添加目录</a>
    </div>
</section>
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">选择组</h4>
            </div>
            <div class="modal-body content">
                <div class="row content border">
                    <form id="addUserForm" method="post" class="form-horizontal" role="form" action="${ctx}/user/manager/add">
                        <div class="container-fluid content-item">
                            <div class="row form">
                                <div class="col-md-3 info">
                                    <label class="dinosaurOA-lable" for="nameInput">用户名:</label>
                                </div>
                                <div class="col-md-9">
                                    <div>
                                        <input class="input form-control" name="name" id="nameInput" type="text" required placeholder="请输入用户名">
                                    </div>
                                </div>
                            </div>
                            <div class="row form">
                                <div class="col-md-3 info">
                                    <label class="dinosaurOA-lable" for="phoneInput">电话号码:</label>
                                </div>
                                <div class="col-md-9">
                                    <div>
                                        <input class="input form-control" name="phone" id="phoneInput" type="text" required placeholder="请输入电话号码">
                                    </div>
                                </div>
                            </div>
                            <div class="row form">
                                <div class="col-md-3 info">
                                    <label class="dinosaurOA-lable" for="passwordInput">密码:</label>
                                </div>
                                <div class="col-md-9">
                                    <div>
                                        <input class="input form-control" name="password" id="passwordInput" type="text" required placeholder="请输入">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="createUserSubmit" type="button" class="btn btn-primary" onclick="submit()">create</button>
                <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">选择组</h4>
            </div>
            <div class="modal-body">
                <p>no content</p>
            </div>
            <div class="modal-footer">
                <button id="editSubmit" type="button" class="btn btn-primary">save</button>
                <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
