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
<div class="kePublic">
    <div class="content">
        <ul class="vertical-nav dark red">
            <li><a href="http://www.internetke.com/"></i>服务
                <span class="submenu-icon"></span></a>
                <ul>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                </ul>
            </li>
            <li><a href="http://www.internetke.com/"></i>产品
                <span class="submenu-icon"></span></a>
                <ul>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航</a></li>
                    <li><a href="http://www.internetke.com/">二级导航<span class="submenu-icon"></span></a><ul>
                        <li><a href="http://www.internetke.com/">三级导航</a></li>
                        <li><a href="http://www.internetke.com/">三级导航</a></li>
                        <li><a href="http://www.internetke.com/">三级导航 <span class="submenu-icon"></span>
                        </a>
                            <ul>
                                <li><a href="http://www.internetke.com/">四级导航</a></li>
                                <li><a href="http://www.internetke.com/">四级导航</a></li>
                                <li><a href="http://www.internetke.com/">四级导航</a></li>
                                <li><a href="http://www.internetke.com/">四级导航</a></li>
                            </ul>
                        </li>
                        <li><a href="http://www.internetke.com/">三级导航</a></li>
                    </ul>
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
                var data;
                $.getJSON("${ctx}/system/category/get", function(json){
                    data = json;
                });
            })
        </script>    
    </js>
</div>
