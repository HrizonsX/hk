<%@ page import="com.hk.pojo.Fights" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hk.pojo.Fight" %>
<%@ page import="java.util.logging.Filter" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/9
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <title>航班动态</title>
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/button.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/img_ver.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/citySet.js"></script>
    <script type="text/javascript" language="JavaScript">
        function ajaxValidate() {
            var bpCode = $("#UbpCode").val();
            // alert(bpCode);
            $.ajax({
                type: "POST",
                url: "/hk_war_exploded/passengerTicket/registerUser1.do",//提交地址
                contentType: 'text/plain;charset=utf-8', //设置请求头信息
                data: bpCode,//提交数据
                dataType: "text",//返回text内容
                async: false,
                success: function (data) {
                    if ("no" == data) {
                        //后端传来的msg的值是no,不能注册。反之。
                        $("#remind").html("<font color='red'>用户名已被注册</font>");
                        $("#submit").attr("disabled", true);
                    }
                    if ("yes" == data) {
                        //如果没有被注册，将提示语清空。
                        $("#remind").html("用户名可用");
                        $("#submit").attr("disabled", false);
                    }
                },
                error: function (data) {
                    alert("发生了一个错误");
                }
            });
        }
    </script>
</head>
<body>

<%
    String jsonFights = (String) request.getAttribute("jsonFights");
    List<Fights> fights = JSON.parseArray(jsonFights, Fights.class);
%>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%
        String bpCode = (String) session.getAttribute("bpCode");
    %>
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/hk_war_exploded/main.jsp">
                <img src="${pageContext.request.contextPath}/png/xmhk.png" class="img-responsive headImgHigh"
                     alt="Cinque Terre">
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
                                              action="/hk_war_exploded/passengerTicket/loginUser.do" id="signIn" name="signIn">
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
                                            <button id="loginSubmit" class="button button-pill button-primary" type="submit"
                                                    disabled="disabled">登录
                                            </button>
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
                                        <form class="form-horizontal" role="form" method="post"
                                              action="/hk_war_exploded/passengerTicket/registerUser.do" id="signUp"
                                              name="signUp">
                                            <%--用户名--%>
                                            <div class="form-group">
                                                <label for="UbpCode" class="col-sm-3 control-label">用户名</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="UbpCode" name="bpCode" class="form-control"
                                                           placeholder="请输入用户名" onblur="ajaxValidate()"/>
                                                    <div id="remind" color="red"></div>
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
                                            <button class="button button-pill button-primary" type="submit" id="submit"
                                                    disabled="disabled">注册
                                            </button>
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
                        <li><a href="/hk_war_exploded/passengerTicket/getBooks.do?bpCode=<%=bpCode%>">我的订单</a></li>
                        <li><a href="#">注销</a></li>
                    </ul>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>
<%--// 搜索部分，功能未添加--%>
<%--//未补全，仍需吧用户信息传递过来--%>

<div class="container" align="center">
    <div class="row clearfix" style="width: 900px">
        <ul class="nav nav-o"></ul>
        <div class="tabbable" id="tabs">
            <ul class="nav nav-pills">
                <li class="active">
                    <a href="#panel1" data-toggle="tab">按航班线路</a>
                </li>
                <li>
                    <a href="#panel2" data-toggle="tab">按航班号</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="panel1" style="margin-top: 15px">
                    <%--由上一个页面获取的城市和日期还未填入--%>
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
                </div>
                <div class="tab-pane" id="panel2" style="margin-top: 15px">
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <input type="text" name="alCode" class="form-control" value="" placeholder="请输入航班号"/>
                        </div>
                        <div class="form-group space"></div>
                        <div class="form-group">
                            <input type="text" name="fightDate" class="form-control" value="" placeholder="出发日期"/>
                        </div>
                        <div class="form-group space"></div>
                        <button class="button button-pill button-primary" type="submit">查询</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--//for循环添加航班还没写，航班状态这个写的有点多，可能有很多是没必要写的，第一个tbody是测试，可以直接删除，--%>
<%--//这次的css部分还没有写到css文件里，--%>
<%--//css文件里有一个属性我修改了--%>
<%--//在有航班状态的那部分，用了if else，可能会让代码有点长，重复的部分会有点多。--%>

<%--//需要获取到传递过来的出发城市，终点城市，日期和航班号--%>
<%--//需要一个list，记录要搜索的航班--%>

<div class="container" align="center">
    <div class="row clearfix" style="width: 900px">
        <div class="table-responsive">
            <table class="table" style="width: 100%;table-layout:fixed">
                <caption><%=fights.get(0).getDcityName()%>
                    - <%=fights.get(0).getTcityName()%>  <%=fights.get(0).ymdDateFormat(fights.get(0).getFightDate())%>
                </caption>
                <thead>
                <tr style="height: 40px;">
                    <th style="width: 150px;text-align:center;font-size:15px">航班</th>
                    <th style="width: 160px;text-align:center;font-size:15px">航班路线</th>
                    <th style="width: 160px;text-align:center;font-size:15px">航班日期</th>
                    <th style="width: 320px;text-align:center;font-size:15px;" colspan="2">航班时刻</th>
                    <th style="width: 110px;text-align:center;font-size:15px">航班状态</th>
                </tr>
                </thead>
                <%
                    for (int i = 0; i < fights.size(); i++) {
                        Fights fight = fights.get(i);
                %>
                <%--<tbody  style="height: 60px;width: 100px;">--%>
                <%--<tr>--%>
                <%--<td align="center" style="vertical-align:middle;font-size:15px"></td>--%>
                <%--<td align="center" style="vertical-align:middle;">--%>
                <%--<p style="font-size:15px"><%=fight.getDcityName()%> - <%=fight.getTcityName()%></p>--%>
                <%--<p style="color:gray;font-size:10px"><%=fight.getDairportName()%> - <%=fight.getTairportName()%></p>--%>
                <%--</td>--%>
                <%--<td align="center" style="vertical-align:middle;font-size:15px"><%=fight.getFightDate()%></td>--%>
                <%--<td align="center" style="width: 160px;vertical-align:middle;font-size:15px">--%>
                <%--<p style="color: gray;font-size: 10px">预计起飞</p>--%>
                <%--<p style="font-size: 15px;"><%=fight.getETD()%></p>--%>
                <%--<p style="color: gray;font-size: 10px">计划出港 <%=fight.getETD()%></p>--%>
                <%--</td>--%>
                <%--<td align="center" style="width: 160px;vertical-align:middle;font-size:15px">--%>
                <%--<p style="color: gray;font-size: 10px">预计着陆</p>--%>
                <%--<p style="font-size: 15px;">10:50</p>--%>
                <%--<p style="color: gray;font-size: 10px">计划到港 10:50</p>--%>
                <%--</td>--%>
                <%--<td align="center" style="vertical-align:middle;font-size:15px">到达</td>--%>
                <%--</tr>--%>
                <%--</tbody>--%>
                <tbody style="height: 60px;width: 100px">
                <tr>
                    <td align="center" style="vertical-align:middle;font-size:15px"><%=fight.getAlCode()%>
                    </td>
                    <td align="center" style="vertical-align:middle;">
                        <p style="font-size:15px"><%=fight.getDcityName()%> - <%=fight.getTcityName()%>
                        </p>
                        <p style="color:gray;font-size:10px"><%=fight.getDairportName()%> - <%=fight.getTairportName()%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">2019-07-09</td>
                    <%if (fight.getFightState() == 1) {%>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">实际起飞</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getATD())%>
                        </p>
                        <p style="color: gray;font-size: 10px">计划出港 <%=fight.hmDateFormat(fight.getETD())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">实际着陆</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getATA())%>
                        </p>
                        <p style="color: gray;font-size: 10px">计划到港 <%=fight.hmDateFormat(fight.getETA())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="font-size: 15px;color:cyan">到达</p>
                        <%--<%if(延误备注！= 空){%>--%>
                        <%--<p style="color: gray;font-size: 10px">备注内容</p>--%>
                        <%--<%}%>--%>
                    </td>
                    <%--取消--%>
                    <%} else if (fight.getFightState() == 3) {%>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">计划起飞</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getETD())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">计划着陆</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getETA())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="font-size: 15px;color:red">取消</p>
                    </td>
                    <%} else if (fight.getFightState() == 2) {%>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">实际起飞</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getATD())%>
                        </p>
                        <p style="color: gray;font-size: 10px">计划出港 <%=fight.hmDateFormat(fight.getETD())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">预计着陆</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getETA())%>
                        </p>
                        <p style="color: gray;font-size: 10px">计划到港 <%=fight.hmDateFormat(fight.getETA())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="font-size: 15px;color:lawngreen">飞行中</p>
                    </td>
                    <%} else {%>
                    <td align="center" style="width: 160px;vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">预计起飞</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getETD())%>
                        </p>
                        <p style="color: gray;font-size: 10px">计划出港 <%=fight.hmDateFormat(fight.getETD())%>
                        </p>
                    </td>
                    <td align="center" style="width: 160px;vertical-align:middle;font-size:15px">
                        <p style="color: gray;font-size: 10px">预计着陆</p>
                        <p style="font-size: 15px;"><%=fight.hmDateFormat(fight.getETA())%>
                        </p>
                        <p style="color: gray;font-size: 10px">计划到港 <%=fight.hmDateFormat(fight.getETA())%>
                        </p>
                    </td>
                    <td align="center" style="vertical-align:middle;font-size:15px">
                        <p style="font-size: 15px;color:lawngreen">计划</p>
                        <a class="choose-fight" href="list.jsp" style="font-size: 10px;vertical-align:middle;">立即预定</a>
                    </td>
                    <%}%>
                </tr>
                </tbody>
                <%}%>
            </table>
        </div>
    </div>
</div>
<script>
    imgVer({
        el: '$("#imgVer")',
        width: '260',
        height: '113',
        img: [
            '${pageContext.request.contextPath}/png/ver-1.png',
            '${pageContext.request.contextPath}/png/ver-2.png',
            '${pageContext.request.contextPath}/png/ver-3.png'
        ],
        success: function () {
            //验证成功后做的事情
            $("#loginSubmit").attr("disabled", false);
        },
        error: function () {
            // alert("这么简单的拼图都不会");
        }
    });
</script>
</body>
</html>
