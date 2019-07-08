<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/8
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="laydate/laydate.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>查询页</title>
    <link href="css/main.css" type="text/css" rel="stylesheet"/>
    <link href="css/button.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%
        String bpCode = (String)session.getAttribute("bpCode");
    %>
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">
                <img src="png/xmhk.png" class="img-responsive headImgHigh" alt="Cinque Terre">
            </a>
        </div>
        <div class="navbar-collapse collapse" style="text-align:center">
            <ul class="nav navbar-nav" style="display:inline-block;float:none;">
                <li class=""><a href="#">白鹭会员</a></li>
                <li class=""><a href="#">预定管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        互动专区
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>施工中</li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        出行帮助
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>施工中</li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right" style="display:inline-block;float:none;">
                <%if(bpCode == null){%>
                <li>
                    <%--登录词条触发模态框--%>
                    <a data-toggle="modal" data-target="#signInModal" href="#">登录</a>
                    <%--模态框内的表单设计，包括提交及方法--%>
                    <%--<form method="post" action="#" class="form-horizontal" role="form" id="signIn" onsubmit="return">--%>
                    <%--登录模态框设置属性，其中data-backdrop 为设置不被覆盖--%>
                    <div class="modal fade" id="signInModal" tabindex="-1" role="dialog" aria-labelledby="signInModalLabel" aria-hidden="true" data-backdrop="false">
                        <div class="modal-dialog">
                            <div class="modal-content modalWidth">
                                <%--模态框头部--%>
                                <div class="modal-header modalHeader">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4>登录</h4>
                                </div>
                                <%--模态框主体部分--%>
                                <div class="modal-body">
                                    <%--主体内的表单，提交位置和方法记得改--%>
                                    <form class="form-horizontal" role="form" method="post" action="#" id="signIn" name="signIn">
                                        <%--用户名--%>
                                        <div class="form-group">
                                            <label for="bpCode" class="col-sm-3 control-label">用户名</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="bpCode" name="pcCode" class="form-control" placeholder="请输入用户名">
                                            </div>
                                        </div>
                                        <%--密码--%>
                                        <div class="form-group">
                                            <label for="bpPassword" class="col-sm-3 control-label">密码</label>
                                            <div class="col-sm-9">
                                                <input type="password" id="bpPassword" name="bpPassword" class="form-control" placeholder="请输入密码"/>
                                            </div>
                                        </div>
                                        <%--提交按钮--%>
                                        <button class="button button-pill button-primary" type="submit">登录</button>
                                    </form>
                                </div>
                                <%--<div class="modal-footer">--%>
                                <%--<!--  模态框底部样式，一般是提交或者确定按钮 -->--%>
                                <%--<button type="submit" class="btn btn-info">登录</button>--%>
                                <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                    <%--</form>--%>
                </li>
                <li class=""><a>|</a></li>
                <li>
                    <%--注册词条触发模态框--%>
                    <a data-toggle="modal" data-target="#signUpModal" href="#">注册</a>
                    <%--模态框内的表单设计及提交方法--%>
                    <div  class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="signUpModalLabel" aria-hidden="true" data-backdrop="false">
                        <div class="modal-dialog">
                            <div class="modal-content modalWidth">
                                <%--模态框头部--%>
                                <div class="modal-header modalHeader">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4>注册</h4>
                                </div>
                                <%--模态框主体部分--%>
                                <div class="modal-body">
                                    <%--主体内的表单，提交位置和方法还没动--%>
                                    <form class="form-horizontal" role="form" method="post" action="#" id="signUp" name="signUp">
                                        <%--用户名--%>
                                        <div class="form-group">
                                            <label for="UbpCode" class="col-sm-3 control-label">用户名</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="UbpCode" name="pcCode" class="form-control" placeholder="请输入用户名">
                                            </div>
                                        </div>
                                        <%--密码--%>
                                        <div class="form-group">
                                            <label for="UbpPassword" class="col-sm-3 control-label">密码</label>
                                            <div class="col-sm-9">
                                                <input type="password" id="UbpPassword" name="bpPassword" class="form-control" placeholder="请输入密码"/>
                                            </div>
                                        </div>
                                        <%--姓名--%>
                                        <div class="form-group">
                                            <label for="UbpName" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="UbpName" name="bpName" class="form-control" placeholder="请输入姓名">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UbpPhone" class="col-sm-3 control-label">电话</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="UbpPhone" name="bpPhone" class="form-control" placeholder="请输入联系电话">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UbpEmail" class="col-sm-3 control-label">电子邮箱</label>
                                            <div class="col-sm-9">
                                                <input type="email" id="UbpEmail" name="bpEmail" class="form-control" placeholder="请输入电子邮箱">
                                            </div>
                                        </div>
                                        <%--提交按钮--%>
                                        <button class="button button-pill button-primary" type="submit">注册</button>
                                    </form>
                                </div>
                                <%--<div class="modal-footer">--%>
                                <%--<!--  模态框底部样式，一般是提交或者确定按钮 -->--%>
                                <%--<button type="submit" class="btn btn-info">登录</button>--%>
                                <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                </li>
                <%}else{%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <%=bpCode%>,你好
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">我的订单</a> </li>
                        <li><a href="#">注销</a></li>
                    </ul>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>

    <div class="container">
        <div class="row clearfix">
            <%--<div class="col-sm-7 column">--%>
                <form class="form-inline" role="form">
                    <div class="form-group">
                        <input type="text" name="dcityName" class="form-control" value="" placeholder="出发城市">
                    </div>
                    <div class="form-group space"></div>
                    <div class="form-group">
                        <input type="text" name="tcityName" class="form-control" value="" placeholder="到达城市">
                    </div>
                    <div class="form-group space"></div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="fightDate" name="fightDate" placeholder="去程日期">
                    </div>
                    <div class="form-group space"></div>
                    <button class="button button-pill button-primary" type="submit">查询</button>
                </form>
            <%--</div>--%>
        </div>
    </div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-sm-7 column">

            </div>
        </div>
    </div>
    <script>
        laydate.render({
            elem: '#fightDate' //指定元素
        });
    </script>
    <script>
        laydate.render({
            elem: '#afightDate' //指定元素
        });
    </script>
</body>
</html>
