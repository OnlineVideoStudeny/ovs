<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类管理</title>
</head>
<body>
    <div class="row">
        <section>
            <a href="#categoryCreateModal" role="button" class="btn" data-toggle="modal">
                添加分类
            </a>
        </section>
        <section>

        </section>
    </div>
    <div class="modal fade" id="categoryCreateModal" tabindex="-1" role="dialog" aria-labelledby="categoryCreateLable" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="categoryCreateLable">新建分类</h4>
                </div>
                <div class="modal-body content">
                    <div class="row content border">
                        <form id="addUserForm" method="post" class="form-horizontal" role="form" action="${ctx}/courses/contents/create">
                            <input name="contentsType" value="system_category" type="hidden">
                            <div class="container-fluid content-item">
                                <div class="row form">
                                    <div class="col-md-3 info">
                                        <label for="nameInput">名称</label>
                                    </div>
                                    <div class="col-md-9">
                                        <div>
                                            <input name="description" id="nameInput" class="input form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form">
                                    <div class="col-md-3 info">
                                        <label for="contentsDescriptionInput">描述</label>
                                    </div>
                                    <div class="col-md-9">
                                        <div>

                                            <textarea name="description" id="contentsDescriptionInput" class="input form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form">
                                    <div class="col-md-3 info">
                                        <label for="parentInput">上级目录</label>
                                    </div>
                                    <div class="col-md-9">
                                        <div>
                                            <select id="parentInput" name="parentId">
                                                <option>选择上级分类目录</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="addSubmit" type="button" class="btn btn-primary">create</button>
                    <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
