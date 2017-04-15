<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<head>
<title>课程添加</title> <
<title><sitemesh:write property='title' /></title>
</head>
<div class="row">
	<div class="col-md-2">
		<div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#contentsCreateModal">
                添加目录
            </button>
		</div>
	</div>
	<div class="col-md-10">
		<div>
            <c:if test="${fn:length(contents) > 0}">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#coursesCreateModal">
                    添加课程
                </button>
            </c:if>
		</div>
	</div>
</div>
<!-- 显示课程目录 -->
<section class="content-box">
    <ul class="tree">
        <c:set var="index" value="0" scope="request" />
        <c:set var="level" value="0" scope="request" />
        <c:import url="_r.jsp" />
    </ul>
</section>
<div class="modal fade" id="contentsCreateModal" tabindex="-1"
	role="dialog" aria-labelledby="contentsCreateLable" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="contentsCreateLable">新建课程目录</h4>
			</div>
			<div class="modal-body content">
				<div class="row content border">
					<form id="addUserForm" method="post" class="form-horizontal"
						role="form" action="${ctx}/courses/contents/create">
						<input name="contentsType" value="courses_contents" type="hidden">
						<div class="container-fluid content-item">
							<div class="row form">
								<div class="col-md-3 info">
									<label for="nameInput">名称</label>
								</div>
								<div class="col-md-9">
									<div>
										<input name="name" id="nameInput"
											class="input form-control" />
									</div>
								</div>
							</div>
							<div class="row form">
								<div class="col-md-3 info">
									<label for="contentsDescriptionInput">描述</label>
								</div>
								<div class="col-md-9">
									<div>

										<textarea name="description" id="contentsDescriptionInput"
											class="input form-control"></textarea>
									</div>
								</div>
							</div>
							<div class="row form">
								<div class="col-md-3 info">
									<label for="parentInput">上级目录</label>
								</div>
								<div class="col-md-9">
									<div class="parentChose">
                                        <c:if test="${isTop != 'isTop'}">
                                            <select id="parentInput" name="parentId">
                                                <option value="">选择课程目录</option>
                                                <option value="${topContents.id}">${topContents.name}</option>
                                            </select>
                                        </c:if>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button id="addSubmit" type="submit" class="btn btn-primary">create</button>
				<button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="coursesCreateModal" tabindex="-1"
	role="dialog" aria-labelledby="coursesCreateLable" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="coursesCreateLable">添加课程</h4>
			</div>
			<div class="modal-body">
				<div class="row content border">
					<form id="addCoursesForm" method="post" class="form-horizontal"
						role="form" action="${ctx}/courses/add" enctype="multipart/form-data">
						<div class="container-fluid content-item">
							<div class="row form">
								<div class="col-md-3 info">
									<label for="contentsInput">目录节点</label>
									
								</div>
								<div class="col-md-9">
									<div class="parentChose">
										<select id="contentsInput" name="contentsId">
											<option value="">选择节点</option>
											<c:forEach items="${parentContents}" var="category">
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:forEach>
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

										<textarea name="description" id="videoDescriptionInput"
											class="input form-control"></textarea>
									</div>
								</div>
							</div>
							<div class="row form">
								<div class="col-md-3 info">
									<label for="videoInput">上传课程视频</label>
								</div>
								<div class="col-md-9">
									<div>
										<input class="input form-control" name="file" id="videoInput"
											type="file">
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

<js> <script type="text/javascript">
	$(function() {
		$("#addSubmit").click(function() {
            var nameInput = $("#nameInput").val();
            var contentsDescriptionInput = $(
                    "#contentsDescriptionInput").val();
            if ((nameInput == null || nameInput == "")
                    && (contentsDescriptionInput == null || contentsDescriptionInput == "")) {
                alert("名称和描述不能为空");
            } else {
                $("#addUserForm").submit();
            }
        });

		$("#editSubmit").click( function() {
            var contentsInput = $("#contentsInput").val();
            var videoDescriptionInput = $(
                    "#videoDescriptionInput").val();
            if ((contentsInput == null || contentsInput == "")
                    && (videoDescriptionInput == null || videoDescriptionInput == "")) {
                alert("目录节点和描述不能为空");
            } else {
                $("#addCoursesForm").submit();
            }
        });

	});

    /*设置上一个有效的节点，并废弃当前无效的设置*/
    function chapre(obj, idP) {
        if (null != obj && "undefined" != obj){
            if (obj.val() != "" && obj != "undefined" || obj.val() == ""){
                obj.attr("name",idP);
            } else{
                var bir = bir.prev();
                if (bir.length > 0){
                    chapre(bir,namev);
                    thv.remove();
                }
            }
        }
    }

    $(".parentChose").delegate("select", "change", function () {
        /*若选中节点值无效，择设置上一个有效的节点*/
        var thv = $(this)
        var idv = thv.attr("id");
        var namev = thv.attr("name");
        if (thv.val() == null || thv.val() == "undefined" || thv.val() == ""){
            var bir = thv.prev();
            if (bir.length > 0){
                chapre(bir,namev);
                thv.nextAll().remove();
                thv.remove();
            }
        } else{
            $.getJSON("${ctx}/courses/contents/getNext?id="+$(this).val(), function (data) {
                if (null !== data && data.length > 0){
                    var selectEle = $("<select />")
                    selectEle.attr("id",idv);
                    var optionEle = $("<option/>")
                    optionEle.val("");
                    optionEle.html("选择下级菜单");
                    optionEle.appendTo(selectEle);
                    $.each(data, function () {
                        var optionEle = $("<option/>")
                        optionEle.val(this.id);
                        optionEle.html(this.name);
                        optionEle.appendTo(selectEle);
                    })
                    selectEle.appendTo($(".parentChose"));
                }
            })
            /*值上一个兄弟节点的name为空，并设置当前节点name可用*/
            var bir = $(this).prev();
            if (null != bir && "undefined" != bir || bir.val() == ""){
                bir.prop("name","");
            }
            if ($(this).attr("id") == "contentsInput"){
                $(this).attr("name","contentsId");
            } else{
                $(this).attr("name","parentId");
            }
        }
    })
</script> </js>

