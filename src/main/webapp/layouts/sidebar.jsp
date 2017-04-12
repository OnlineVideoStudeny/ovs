<%--
  Created by IntelliJ IDEA.
  User: Developer
  Date: 4/6/2017
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>$(document).ready(function(){$(".vertical-nav").verticalnav({speed: 400,align: "left"});});</script>
<div style="clear:both;">
</div>
<div class="kePublic" style="min-height: 500px">
    <div class="content">
        <ul class="vertical-nav dark red">
            <c:set var="index" value="0" scope="request" />
            <c:set var="level" value="0" scope="request" />
            <c:import url="_r.jsp" />
        </ul>
    </div>
    <div class="clear"></div>
    <js>
        <%--<script>
            $(document).ready(function () {
                $.getJSON("${ctx}/system/category/get", function(json){
                    var parent = $(".vertical-nav");
                    process(json, parent);
                });
            })

            function process(json, parentEle) {
                if (null == json || json.length <= 0){
                    return;
                }
                $.each(json, function (i, v) {
                    var ue = $("<ul>")
                    var lie = $("<li/>");
                    var ae = $("<a/>");
                    var spane = $("<span/>");
                    if (v.children.size() > 0){
                        spane.css("submenu-icon");
                        lie.appendChild(ae);
                        lie.appendChild(spane);
                        process(v.children);
                        ue.appendChild(lie);
                    } else {
                        ae.attr("href","");
                        lie.appendChild(ae);
                    }
                    parentEle.appendChild(lie);
                });
            }
        </script>--%>
    </js>
</div>
