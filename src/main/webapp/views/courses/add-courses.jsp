<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>课程添加</title>
<div class="row">
    <div class="col-md-2">
        <div>
            <a href="#contentsCreateModal" role="button" class="btn" data-toggle="modal">
                添加目录
            </a>
        </div>
    </div>
    <div class="col-md-10">
        <div>
            <a href="#coursesCreateModal" role="button" class="btn" data-toggle="modal">
                添加课程
            </a>
        </div>
    </div>
</div>
<!-- <section>
    <div style="float: right">
        <a class="button">添加目录</a>
    </div>
</section> -->
<div class="modal fade" id="contentsCreateModal" tabindex="-1" role="dialog" aria-labelledby="contentsCreateLable" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="contentsCreateLable">新建课程目录</h4>
            </div>
            <div class="modal-body content">
                <div class="row content border">
                    <form id="addUserForm" method="post" class="form-horizontal" role="form" action="${ctx}/courses/contents/create">
                        <input name="contentsType" value="courses_contents" type="hidden">
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
<div class="modal fade" id="coursesCreateModal" tabindex="-1" role="dialog" aria-labelledby="coursesCreateLable" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="coursesCreateLable">添加课程</h4>
            </div>
            <div class="modal-body">
                <div class="row content border">
                    <form id="addCoursesForm" method="post" class="form-horizontal" role="form" action="${ctx}/courses/add">
                        <div class="container-fluid content-item">
                            <div class="row form">
                                <div class="col-md-3 info">
                                    <label for="contentsInput">目录节点</label>
                                </div>
                                <div class="col-md-9">
                                    <div>
                                        <select id="contentsInput" name="contentsId">
                                            <option>153</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row form">
                                <div class="col-md-3 info">
                                    <label for="videoDescriptionInput">描述</label>
                                </div>
                                <div class="col-md-9">
                                    <div>

                                        <textarea name="description" id="videoDescriptionInput" class="input form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row form">
                                <div class="col-md-3 info">
                                    <label for="videoInput">上传课程视频</label>
                                </div>
                                <div class="col-md-9">
                                    <div>
                                        <input class="input form-control" name="file" id="videoInput" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="editSubmit" type="button" class="btn btn-primary">save</button>
                <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
