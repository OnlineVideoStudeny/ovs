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
            <li><a href="http://www.internetke.com/"></i>编程开发<span class="submenu-icon"></span></a>
                <ul>
                    <li><a href="http://www.internetke.com/">前端开发</a></li>
                    <li><a href="http://www.internetke.com/">移动开发</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                </ul>
            </li>
            <li><a href="http://www.internetke.com/"></i>办公效率<span class="submenu-icon"></span></a>
                <ul>
                    <li><a href="http://www.internetke.com/">PPT</a></li>
                    <li><a href="http://www.internetke.com/">办公软件</a></li>
                    <li><a href="http://www.internetke.com/">二级导航<span class="submenu-icon"></span></a>
                        <!-- <ul>
                            <li><a href="http://www.internetke.com/">三级导航</a></li>
                            <li><a href="http://www.internetke.com/">三级导航</a></li>
                            <li><a href="http://www.internetke.com/">三级导航 <span class="submenu-icon"></span></a>
                                <ul>
                                    <li><a href="http://www.internetke.com/">四级导航</a></li>
                                    <li><a href="http://www.internetke.com/">四级导航</a></li>
                                    <li><a href="http://www.internetke.com/">四级导航</a></li>
                                    <li><a href="http://www.internetke.com/">四级导航</a></li>
                                </ul>
                            </li>
                            <li><a href="http://www.internetke.com/">三级导航</a></li>
                        </ul> -->
                    </li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
    <js>
        <script>
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
        </script>
    </js>
</div>
