<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<head>
<title><sitemesh:write property='title' /></title>
<%@ include file="/layouts/header.jsp"%>
</head>


<title>分类管理</title>
<body>
	<div class="row1">
		<section>
			<a href="#categoryCreateModal" role="button" class="btn"
				data-toggle="modal"> 添加分类 </a>
		</section>

		<!-- 显示分类 -->
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
	</div>

	<div class="modal fade" id="categoryCreateModal" tabindex="-1"
		role="dialog" aria-labelledby="categoryCreateLable" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="categoryCreateLable">新建分类</h4>
				</div>
				<div class="modal-body content">
					<div class="row content border">
						<form id="addUserForm" method="post" class="form-horizontal"
							role="form" action="${ctx}/system/category/add">
							<input name="contentsType" value="system_category" type="hidden">
							<div class="container-fluid content-item">
								<div class="row form">
									<div class="col-md-3 info">
										<label for="nameInput" id="name">名称</label>
									</div>
									<div class="col-md-9">
										<div>
											<input name="name" id="nameInput" class="input form-control" />
										</div>
									</div>
								</div>
								<div class="row form">
									<div class="col-md-3 info">
										<label for="contentsDescriptionInput" id="description">描述</label>
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
                                                <c:forEach items="${parentCategory}" var="category">
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



</body>
<js>
    <script type="text/javascript">

	/* function getTree() {
	 return data;
	}
	$('#tree').treeview({data: getTree()}); */

        $(function() {
            $("#addSubmit").click(function() {
                var nameInput = $("#nameInput").val();
                var contentsDescriptionInput = $(
                        "#contentsDescriptionInput").val();
                if ((nameInput == null || nameInput == "")
                        && (contentsDescriptionInput == null || contentsDescriptionInput == "")) {
                    alert("名称或描述不能为空");
                } else {
                    $("#addUserForm").submit();
                }
            })
        })

        $("#parentInput").change(function () {
            $.getJSON("${ctx}/system/getNext?id="+$(this).val(), function (data) {
                if (null != data && data.length > 0){
                    var selectEle = $("<select id='parentInput' name='parentId' />")
                    $.each(data, function () {
                        var optionEle = $("<option/>")
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
    </script>
</js>
</html>
