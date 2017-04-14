<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<title>分类管理</title>
<title><sitemesh:write property='title' /></title>
<%@ include file="/layouts/header.jsp"%>
</head>

<body>
	<div class="row1">
		<section>
			<a href="#categoryCreateModal" role="button" class="btn"
				data-toggle="modal"> 添加分类 </a>
		</section>

		<!-- 显示分类 -->
		<section>
            <ul>
                <c:set var="index" value="0" scope="request" />
                <c:set var="level" value="0" scope="request" />
                <c:import url="_r.jsp" />
            </ul>
        </section>
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
                if ((nameInput === null || nameInput === "")
                        && (contentsDescriptionInput === null || contentsDescriptionInput === "")) {
                    alert("名称或描述不能为空");
                } else {
                    $("#addUserForm").submit();
                }
            })
        })

    /*设置上一个有效的节点，并废弃当前无效的设置*/
        function chapre(obj) {
            if (null != obj && "undefined" != obj){
                if (obj.val() != "" && obj != "undefined" || obj.val() == ""){
                    obj.attr("name","parentId");
                } else{
                    bir.prop("name","");
                    chapre(bir.prev());
                }
            }
        }

        $("#parentChose").delegate("select", "change", function () {
            /*若选中节点值无效，择设置上一个有效的节点*/
            if ($(this).val() == null || $(this).val() == "undefined" || $(this).val() == ""){
                var bir = $(this).prev();
                chapre(bir);
                $(this).prop("name","");
            } else{
                $.getJSON("${ctx}/system/getNext?id="+$(this).val(), function (data) {
                    if (null !== data && data.length > 0){
                        var selectEle = $("<select id='parentInput' />")
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
                        selectEle.appendTo($("#parentChose"));
                    }
                })
                /*值上一个兄弟节点的name为空，并设置当前节点name可用*/
                var bir = $(this).prev();
                if (null != bir && "undefined" != bir || bir.val() == ""){
                    bir.prop("name","");
                }
                $(this).attr("name","parentId");
            }
        })
    </script>
</js>
</html>
