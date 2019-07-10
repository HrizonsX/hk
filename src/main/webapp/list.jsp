<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hk.pojo.Fights" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.hk.pojo.FightShipping" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/8
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <title>查询页</title>
    <script src="${pageContext.request.contextPath}/js/img_ver.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/button.css" type="text/css" rel="stylesheet"/>
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

<%--需要数据：用户信息，list（航班），上个页面里的出发和终点城市以及日期--%>
<%--补充部分：搜索表单的提交可能需要刷新页面，预定的标签需添加跳转，for循环部分还没写--%>
<%--可能注释有点问题，会显示在界面上，记得删---特别是//这种--%>

<body>
<%
    String jsonFights = (String)request.getAttribute("jsonFights");
    List<Fights> fights = JSON.parseArray(jsonFights, Fights.class);
%>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%
        String bpCode = (String)session.getAttribute("bpCode");
    %>
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/hk_war_exploded/main.jsp">
                <img src="${pageContext.request.contextPath}/png/xmhk.png" class="img-responsive headImgHigh" alt="Cinque Terre">
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

<div class="container" align="center"><%--// 搜索部分，功能未添加--%>
    <div class="row clearfix" style="width: 900px">
        <%--<div class="col-sm-7 column">--%>
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
        <%--</div>--%>
    </div>
</div>
<div class="container" align="center">
    <div class="row clearfix" style="width: 900px">
        <%--<div class="col-sm-7 column"></div>--%>
        <%--一个航班的详细信息，每次要从list里拿一个信息来用--%>
        <%--可能要用 for 循环来填--%>
        <%
            for(int from = 0; from < fights.size(); from++) {
                Fights fight = fights.get(from);
        %>
        <ul class="list-group">
            <li class="list-group-item">
                <div class="list-group-item-heading itemHeadSize">
                    <div class="itemHeadFightSize"><%=fight.getAlCode()%></div>
                    <div class="itemHeadAirSize"><%=fight.getAircraftType()%></div>
                </div>
                <div class="item_Size">
                    <div class="itemTimeSize">
                        <%--出发时间和出发机场--%>
                        <div class="item_Time">
                            <%=fight.hmDateFormat(fight.getETD())%>
                        </div>
                        <div class="item_air">
                            <%=fight.getDairportName()%>
                        </div>
                    </div>
                    <div style="width: 100px;float:left;text-align: center">
                        -------------->
                        <%--中间分隔--%>
                    </div>
                    <div class="itemTimeSize">
                        <%--终点机场和到达时间--%>
                        <div class="item_Time">
                            <%=fight.hmDateFormat(fight.getETA())%>
                        </div>
                        <div class="item_air">
                            <%=fight.getTairportName()%>
                        </div>
                    </div>
                    <div style="width: 100px;float:left">
                        <%--预计用时--%>
                    </div>
                    <div >
                        <%--价格--%>
                    </div>
                </div>
                <%for(int i = 0; i <  fight.getFightShippings().size(); i++){
                    FightShipping fightShipping = fight.getFightShippings().get(i);
                %>
                <div class="ship_space">
                    <%--经济舱--%>
                    <%if(fightShipping.getSsName() == "ec"){%>
                    <div class="site">经济舱</div>
                    <div class="price"><%=fightShipping.getSsPrice()%></div>
                    <div class="choose-fight" style="margin-left: 200px;">预定</div>
                    <div class="remark">
                        <%if(fightShipping.getEcsqNumber() == 0){%>
                        售空
                        <%}else{%>
                        剩余<%=fightShipping.getEcsqNumber()%>票
                        <%}%>
                    </div>
                    <%}else if(fightShipping.getSsName() == "bc"){%>
                    <div class="site">经济舱</div>
                    <div class="price"><%=fightShipping.getSsPrice()%></div>
                    <div class="choose-fight" style="margin-left: 200px;">预定</div>
                    <div class="remark">
                        <%if(fightShipping.getBcsqNumber() == 0){%>
                        售空
                        <%}else{%>
                        剩余<%=fightShipping.getBcsqNumber()%>票
                        <%}%>
                    </div>
                    <%}else{%>
                    <div class="site">头等舱</div>
                    <div class="price"><%=fightShipping.getSsPrice()%></div>
                    <div class="choose-fight" style="margin-left: 200px;">预定</div>
                    <div class="remark">
                        <%if(fightShipping.getFcsqNumber() == 0){%>
                        售空
                        <%}else{%>
                        剩余<%=fightShipping.getFcsqNumber()%>票
                        <%}%>
                    </div>
                    <%}%>
                </div>
                <%}%>
            </li>
        </ul>
        <%}%>
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
