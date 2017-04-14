<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<%@ include file="/layouts/header.jsp"%>
</head>



<div class="row">
	<div class="col-md-2">
		<div>
			<a href="#contentsCreateModal" role="button" class="btn"
				data-toggle="modal"> 添加目录 </a>
		</div>
	</div>
	<div class="col-md-10">
		<div>
            <c:if test="${fn:length(contents) > 0}">
                <a href="#coursesCreateModal" role="button" class="btn"
                   data-toggle="modal"> 添加课程 </a>
            </c:if>
		</div>
	</div>
</div>

<!-- 显示课程目录 -->
<table class="table">
	<tr>
	    
		<td>名称</td>
		<td>描述</td>
		<td>上级分类目录</td>

	</tr>
    <c:set var="index" value="0" scope="request" />
    <c:set var="level" value="0" scope="request" />
    <c:import url="_r.jsp" />

</table>


<!-- <section>
    <div style="float: right">
        <a class="button">添加目录</a>
    </div>
</section> -->
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
									<div id="parentChose">
										<select id="parentInput" name="parentId">
											<option value="">选择上级分类目录</option>
											<c:forEach items="${contents}" var="category">
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:forEach>
										</select>
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
									<div>
										<select id="contentsInput" name="contentsId">
											<option>选择节点</option>
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
		$("#addSubmit")
				.click(
						function() {
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

		$("#editSubmit")
				.click(
						function() {
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
	
	$("#parentInput").change(function () {
        $.getJSON("${ctx}/contents/getNext?id="+$(this).val(), function (data) {
            if (null !== data && data.length > 0){
                var selectEle = $("<select id='parentInput' name='parentId' />")
                $.each(data, function () {
                    var optionEle = $("<option/>");
                    optionEle.val(this.id);
                    optionEle.html(this.name);
                    optionEle.appendTo(selectEle);
                })
                selectEle.appendTo($("#parentChose"));
                $(this).remove("name");
                $(this).remove("id");
            }
        })
    })
</script> </js>

