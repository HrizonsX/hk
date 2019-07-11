<%@ page import="com.hk.pojo.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hk.pojo.Insurance" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hk.pojo.BookBill" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/11
  Time: 5:43
  To change this template use File | Settings | File Templates.
 ]
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="//g.alicdn.com/sd/smartCaptcha/0.0.4/index.js"></script>
    <script src="//g.alicdn.com/sd/quizCaptcha/0.0.1/index.js"></script>

    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>保险</title>
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/button.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="JavaScript">
        function submitPassengerList() {
            var bookParams = {};
            var insArray = new Array();
            var p = document.getElementsByName("bbCode").length;
            for (var i = 0; i < p; i++) {
                var ins = 0;
                var obj = document.getElementsByName("ins"+i);
                for (var j = 0; j < obj.length; j++) { //遍历Radio
                    if (obj[j].checked) {
                        ins = obj[j].value;
                    }
                }
                alert(ins);
                var bookCode = document.getElementsByName("bookCode")[i].value;
                var bbCode = document.getElementsByName("bbCode")[i].value;
                alert()
                insArray.push({bookCode: bookCode, bbCode: bbCode, insuranceCode: ins});
            }
            bookParams.insuranceOrders = insArray;
            $.ajax({
                url: "./passengerTicket/buyInsurance.do",
                type: "POST",
                contentType : 'application/json;charset=utf-8', //设置请求头信息
                dataType:"text",
                data: JSON.stringify(bookParams),    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
                // data: $.toJSON(bookParams),    //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
                success:function(data) {
                    alert(data);
                    window.location.href = data;
                },
                error: function (data) {
                    alert("发生了一个错误");
                }
            });
        }
    </script>
</head>
<body>



<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%--申请获取登录状态--%>
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
                                        <div id="captcha"></div>
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

<div>
    <%

        Book newBook = (Book)session.getAttribute("newBook");
        List<Insurance> insurancesList = (ArrayList)session.getAttribute("insurancesList");
    %>
</div>

<div class="container" align="center">
    <div class="row clearfix" style="width: 600px;height: 70px;box-shadow: 2px 2px 5px #000000;margin-bottom: 20px">
        <div style="width: 50px;height: 50px;float: left">
            <img src="png/logo.png" style="width: 43px;height: 20px;margin-top: 22px" align="right">
        </div>
        <div align="left" style="font-size: 25px;width: 100px;float: left;margin-top: 15px;"><%=newBook.getAlCode()%></div>
        <div style="width: 150px;height: 70px; float: left;margin-top: 22px;" align="center"><%=newBook.ymdhmDateFormat(newBook.getFightDate())%></div>
        <%--<div style="width: 120px;float: left">--%>
        <%--<div style="font-size: 20px;text-align: center;margin-top: 7px" align="right"><%=newBook.get%>111</div>--%>
        <%--</div>--%>
        <%--<div style="float: left;width: 50px;margin-top: 20px">---------</div>--%>
        <%--<div style="width: 120px;float: left">--%>
        <%--<div style="font-size: 20px;text-align: center;margin-top: 7px" align="right">xianmen</div>--%>
        <%--</div>--%>
        <%--<div style="float: left;width: 120px;margin-top: 20px" align="center">--%>
        <%--boyin--%>
        <%--</div>--%>
    </div>
</div>

<div class="container" align="center">
    <div class="row clearfix" style="width: 600px">
        <form class="form-horizontal" role="form" style="border:1px solid #000000;" id="form">
            <div id="formPane" style="border-bottom:1px solid gray;">
                <%
                    for(int i = 0; i <newBook.getBookBills().size(); i ++){
                        BookBill bookBill = newBook.getBookBills().get(i);
                %>
                <div style="width: 600px;height: 30px;float: left;margin-top: 15px;">
                    <div style="float: left;width: 200px;vertical-align: center" align="center";><%=bookBill.getPassenger().getPassName()%></div>
                    <div style="float: left;width: 200px;" align="center"><%=bookBill.getPassenger().getPassID()%></div>
                    <div style="float: left;width: 200px;" align="center"><%=bookBill.getPassenger().getPassPhone()%></div>
                </div>
                <div class="form-group" style="margin-top: 10px">
                    <label for="pt<%=i%>" class="col-sm-3 control-label">保险选择</label>
                    <div id="pt<%=i%>" class="col-sm-9" style="display: flex; flex-direction: row; margin-top: 7px">
                        <%
                            for (int j = 0;j < insurancesList.size(); j++){
                                Insurance insurance = insurancesList.get(j);
                        %>
                        <input type="radio" name="ins0" value="<%=j+1%>" style="margin-right: 40px"><label><%=insurance.getInsuranceName()%>（￥<%=insurance.getInsurancePrice()%>/人）</label>
                        <%}%>
                    </div>
                </div>
                <input type="hidden" name="bookCode" value="<%=bookBill.getBookCode()%>"/></br>
                <input type="hidden" name="bbCode" value="<%=bookBill.getBbCode()%>"/></br>
                <%}%>
            </div>
        </form>
        <button id="submit"  class="btn btn-default" onclick="submitPassengerList();">提交订单</button>
    </div>
</div>

</body>
</html>
