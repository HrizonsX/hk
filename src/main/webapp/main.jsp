<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/1
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>

    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="laydate/laydate.js" type="text/javascript"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="form.js" type="text/javascript"></script>
    <title>厦门航空</title>
    <link href="css/main.css" type="text/css" rel="stylesheet"/>
    <link href="css/button.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script src="js/img_ver.js"></script>
    <style>
        .verBox {
            width: 100%;
            height: 230px;
            text-align: center;
            left: 0px;
            top: 5px;
            opacity: 1;
            transition: all 0.8s;
            padding-top: 7px;
        }
    </style>
</head>
<body>
<%--导航栏部分--%>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%--申请获取登录状态--%>
    <%
        String bpCode = (String) session.getAttribute("bpCode");
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
                <%if (bpCode == null) {%>
                <li>
                    <%--登录词条触发模态框--%>
                    <a data-toggle="modal" data-target="#signInModal" href="#">登录</a>
                    <%--模态框内的表单设计，包括提交及方法--%>
                    <%--<form method="post" action="#" class="form-horizontal" role="form" id="signIn" onsubmit="return">--%>
                    <%--登录模态框设置属性，其中data-backdrop 为设置不被覆盖--%>
                    <div class="modal fade" id="signInModal" tabindex="-1" role="dialog"
                         aria-labelledby="signInModalLabel" aria-hidden="true" data-backdrop="false">
                        <div class="modal-dialog">
                            <div class="modal-content modalWidth">
                                <%--模态框头部--%>
                                <div class="modal-header modalHeader">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4>登录</h4>
                                </div>
                                <%--模态框主体部分--%>
                                <div class="modal-body">
                                    <%--主体内的表单，提交位置和方法记得改--%>
                                    <form class="form-horizontal" role="form" method="post"
                                          action="./passengerTicket/loginUser.do" id="signIn" name="signIn">
                                        <%--用户名--%>
                                        <div class="form-group">
                                            <label for="bpCode" class="col-sm-3 control-label">用户名</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="bpCode" name="bpCode" class="form-control"
                                                       placeholder="请输入用户名">
                                            </div>
                                        </div>
                                        <%--密码--%>
                                        <div class="form-group">
                                            <label for="bpPassword" class="col-sm-3 control-label">密码</label>
                                            <div class="col-sm-9">
                                                <input type="password" id="bpPassword" name="bpPassword"
                                                       class="form-control" placeholder="请输入密码"/>
                                            </div>
                                        </div>
                                            <div class="verBox">
                                                <div id="imgVer" style="display:inline-block;"></div>
                                            </div>
                                        <%--提交按钮--%>
                                        <button id="loginSubmit" class="button button-pill button-primary" type="submit" disabled="disabled">登录</button>
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
                    <div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
                         aria-labelledby="signUpModalLabel" aria-hidden="true" data-backdrop="false">
                        <div class="modal-dialog">
                            <div class="modal-content modalWidth">
                                <%--模态框头部--%>
                                <div class="modal-header modalHeader">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4>注册</h4>
                                </div>
                                <%--模态框主体部分--%>
                                <div class="modal-body">
                                    <%--主体内的表单，提交位置和方法还没动--%>
                                    <form class="form-horizontal" role="form" method="post" action="#" id="signUp"
                                          name="signUp">
                                        <%--用户名--%>
                                        <div class="form-group">
                                            <label for="UbpCode" class="col-sm-3 control-label">用户名</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="UbpCode" name="pcCode" class="form-control"
                                                       placeholder="请输入用户名">
                                            </div>
                                        </div>
                                        <%--密码--%>
                                        <div class="form-group">
                                            <label for="UbpPassword" class="col-sm-3 control-label">密码</label>
                                            <div class="col-sm-9">
                                                <input type="password" id="UbpPassword" name="bpPassword"
                                                       class="form-control" placeholder="请输入密码"/>
                                            </div>
                                        </div>
                                        <%--姓名--%>
                                        <div class="form-group">
                                            <label for="UbpName" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="UbpName" name="bpName" class="form-control"
                                                       placeholder="请输入姓名">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UbpPhone" class="col-sm-3 control-label">电话</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="UbpPhone" name="bpPhone" class="form-control"
                                                       placeholder="请输入联系电话">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UbpEmail" class="col-sm-3 control-label">电子邮箱</label>
                                            <div class="col-sm-9">
                                                <input type="email" id="UbpEmail" name="bpEmail" class="form-control"
                                                       placeholder="请输入电子邮箱">
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
                <%} else {%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <%=bpCode%>,你好
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">我的订单</a></li>
                        <li><a href="#">注销</a></li>
                    </ul>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>
<%--主体部分--%>
<%--网格布局--%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <div class="listTabSiz col-xs-3">
                <ul class="nav nav-tab vertical-tab tab_backgroundColor listTab" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#tab1" class="text-center textSize" aria-controls="home" role="tab" data-toggle="tab">
                            <img src="png/book.png" class="imgSize"><br>
                            机票预订
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#tab2" class="text-center textSize" aria-controls="inbox" role="tab" data-toggle="tab">
                            <img src="png/check.png" class="imgSize"><br>
                            办理值机
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#tab3" class="text-center textSize" aria-controls="inbox1" role="tab"
                           data-toggle="tab">
                            <img src="png/air.png" class="imgSize"><br>
                            航班动态
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#tab4" class="text-center textSize" aria-controls="inbox2" role="tab"
                           data-toggle="tab">
                            <img src="png/service.png" class="imgSize"><br>
                            附加服务
                        </a>
                    </li>
                </ul>
            </div>
            <div class="tab-content vertical-tab-content col-xs-9">
                <div role="tabpanel" class="tab-pane active" id="tab1">
                    <%--查询航班的，用于订票--%>
                    <form class="form-horizontal" role="form" method="post" action="/test" name="bookForm"
                          onsubmit="return notNull()">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="dcityName" name="dcityName"
                                       placeholder="出发城市">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="tcityName" name="tcityName"
                                       placeholder="到达城市" data-container="body" data-toggle="popover"
                                       data-placement="bottom">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="fightDate" name="fightDate"
                                       placeholder="去程日期">
                                <%--<input type="text" class="form-control" id="fightDate" name="fightDate" placeholder="去程日期">--%>
                            </div>
                        </div>
                        <div class="btn_right size">
                            <button class="button button-pill button-primary" type="submit">查询</button>
                            <%--<button type="submit" class="btn btn-info">查询</button>--%>
                        </div>
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab2">
                    <%--办理值机表单，不用动了--%>
                    <form class="form-horizontal" role="form" method="post" action="#">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="passName" name="passName"
                                       placeholder="请输入乘机人姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="passID" name="passID" placeholder="身份证号">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="passPhone" name="passPhone"
                                       placeholder="请输入乘机人手机号">
                            </div>
                        </div>
                        <div class="btn_right size">
                            <button class="button button-pill button-primary" type="submit">办理值机</button>
                        </div>
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab3">
                    <%--查询航班的表单，action还没写--%>
                    <form class="form-horizontal" role="form" method="post" action="#">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="adcityName" name="dcityName"
                                       placeholder="出发城市">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="atcityName" name="tcityName"
                                       placeholder="到达城市">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="afightDate" name="fightDate"
                                       placeholder="去程日期">
                            </div>
                        </div>
                        <div class="btn_right size">
                            <button class="button button-pill button-primary" type="submit">查询航班</button>
                        </div>
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab4">施工中</div>
            </div>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>

<script>
    imgVer({
        el: '$("#imgVer")',
        width: '260',
        height: '113',
        img: [
            'png/ver-1.png',
            'png/ver-2.png',
            'png/ver-3.png'
        ],
        success: function () {
            //验证成功后做的事情
            $("#loginSubmit").attr("disabled",false);
        },
        error: function () {
            // alert("这么简单的拼图都不会");
        }
    });
</script>
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
