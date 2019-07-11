<%@ page import="com.hk.pojo.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.alibaba.fastjson.JSON" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/11
  Time: 0:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="//g.alicdn.com/sd/smartCaptcha/0.0.4/index.js"></script>
    <script src="//g.alicdn.com/sd/quizCaptcha/0.0.1/index.js"></script>

    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="form.js" type="text/javascript"></script>
    <title>厦门航空</title>
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/citySet.js"></script>
    <link href="${pageContext.request.contextPath}/css/button.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/img_ver.js"></script>
    <title>我的订单</title>
    <script type="text/javascript" language="JavaScript">
        function ajaxValidate() {
            var bpCode = $("#UbpCode").val();
            $.ajax({
                type: "POST",
                url: "./passengerTicket/registerUser1.do",//提交地址
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
    String jsonBooks = (String)request.getAttribute("jsonBooks");
    List<Book> books = JSON.parseArray(jsonBooks, Book.class);
%>


<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%--申请获取登录状态--%>
    <%
        String bpCode = (String) session.getAttribute("bpCode");
    %>
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">
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
                                          action="./passengerTicket/registerUser.do" id="signUp"
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
                        <%=bpCode%>, 你好
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

<div class="container" align="center">
    <div class="row clearfix" style="width: 900px">
        <div class="table-responsive">
            <table class="table" style="width:100%; table-layout:fixed">
                <caption>机票购买订单</caption>
                <thead>
                <tr style="height: 40px">
                    <th style="width: 50px;text-align:center;font-size:15px">订单编号</th>
                    <th style="width: 50px;text-align:center;font-size:15px">航线编号</th>
                    <th style="width: 50px;text-align:center;font-size:15px">航线日期</th>
                    <th style="width: 50px;text-align:center;font-size:15px">舱位等级</th>
                    <th style="width: 50px;text-align:center;font-size:15px">订票数量</th>
                    <th style="width: 50px;text-align:center;font-size:15px">订票总价</th>
                    <th style="width: 50px;text-align:center;font-size:15px">订票状态</th>
                    <th style="width: 50px;text-align:center;font-size:15px">订票时间</th>
                    <th style="text-align:center;font-size:15px">详情</th>
                </tr>
                </thead>
                <%
                    for(int i = 0; i < books.size(); i++){
                        Book book = books.get(i);
                %>
                <tbody style="height: 60px;">
                <tr>
                    <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookCode()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getAlCode()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 15px"><%=book.getFightDate()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 15px">
                        <%if(book.getShippingSpace().getSsName().compareTo("ec") == 0){%>
                        经济舱
                        <%}else if(book.getShippingSpace().getSsName().compareTo("bc") == 0){%>
                        商务舱
                        <%}else{%>
                        头等舱
                        <%}%>
                    </td>
                    <td align="center" style="vertical-align: middle;font-size: 15px"><%=book.getBookNumber()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookTotal()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 15px">
                        <%if(book.getBookState() == 0){%>
                        未支付
                        <%}else{%>
                        已支付
                        <%}%>
                    </td>
                    <td align="center" style="vertical-align: middle;font-size: 15px"><%=book.getBookDate()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 15px">
                        <a data-toggle="modal" data-target="#getLay<%=i%>" href="#">详情</a>
                        <div class="modal fade" id="getLay<%=i%>" tabindex="-1" role="dialog" aria-labelledby="getLay<%=i%>Label" aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog">
                                <div class="modal-content modalWidth" style="width: 600px">
                                    <%--模态框头部--%>
                                    <div class="modal-header modalHeader">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4>详情</h4>
                                    </div>
                                    <%--模态框主体部分--%>
                                    <div class="modal-body">
                                        <table class="table tbale-bordered">
                                            <thead>
                                            <tr>
                                                <td style="text-align:center;font-size:15px">乘客姓名</td>
                                                <td style="text-align:center;font-size:15px">乘客身份证</td>
                                                <td style="text-align:center;font-size:15px">乘客电话</td>
                                                <td style="text-align:center;font-size:15px">详单价格</td>
                                                <td style="text-align:center;font-size:15px">详单状态</td>
                                            </tr>
                                            </thead>
                                            <%for(int j = 0; j < book.getBookBills().size(); j++){%>
                                            <tbody>
                                            <tr>
                                                <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookBills().get(j).getPassenger().getPassName()%></td>
                                                <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookBills().get(j).getPassenger().getPassID()%></td>
                                                <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookBills().get(j).getPassenger().getPassPhone()%></td>
                                                <td  align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookBills().get(j).getBbPrice()%></td>
                                                <td align="center" style="vertical-align: middle;font-size: 15px;"><%=book.getBookBills().get(j).getBbState()%></td>
                                            </tr>
                                            </tbody>
                                            <%}%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
                <%}%>
            </table>
        </div>
    </div>
</div>

</body>
</html>
