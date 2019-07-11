<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/10
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="//g.alicdn.com/sd/smartCaptcha/0.0.4/index.js"></script>
    <script src="//g.alicdn.com/sd/quizCaptcha/0.0.1/index.js"></script>

    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
    <script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>预定</title>
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/button.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="JavaScript">
        function submitPassengerList() {
            // alert("ok");
            var bookParams = {};
            var customerArray = new Array();
            var p = $("#bookNumber").val();
            // alert(p);
            for (var i = 0; i < p; i++) {
                var ptCode;
                var obj = document.getElementsByName("ptCode"+i);
                for (var j = 0; j < obj.length; j++) { //遍历Radio
                    if (obj[j].checked) {
                        ptCode = obj[j].value;
                    }
                }
                var passName = document.getElementsByName("passName")[i].value;
                var passID = document.getElementsByName("passID")[i].value;
                var passPhone = document.getElementsByName("passPhone")[i].value;
                // alert(passPhone);
                var passPrice = $("#passPrice"+i).text();
                // alert(i+passPrice);
                customerArray.push({ptCode: ptCode, passName: passName, passID: passID, passPhone: passPhone, passPrice: passPrice});
            }
            bookParams.alCode = $("input[name='alCode']").val();
            bookParams.fightDate = $("input[name='fightDate']").val();
            bookParams.ssCode = $("input[name='ssCode']").val();
            // bookParams.couponCode = $("input[name='couponCode']").val();
            bookParams.bpCode = $("input[name='bpCode']").val();
            bookParams.bookNumber = $("input[name='bookNumber']").val();
            bookParams.bookTotal = $("input[name='bookTotal']").val();
            // alert(bookParams.alCode);
            bookParams.passengerParams = customerArray;
            // alert(bookParams.passengerParams);
            $.ajax({
                url: "./passengerTicket/bookTicket2.do",
                type: "POST",
                contentType : 'application/json;charset=utf-8', //设置请求头信息
                async: false,
                data: JSON.stringify(bookParams),    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
                // data: $.toJSON(bookParams),    //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
                dataType: "text",//返回text内容
                success: function (data) {
                    window.location.href = "./Insurance2.jsp";
                },
                error: function () {
                    alert("发生了一个错误");
                }
            });
        }
    </script>
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
                        $("#submit1").attr("disabled", true);
                    }
                    if ("yes" == data) {
                        //如果没有被注册，将提示语清空。
                        $("#remind").html("用户名可用");
                        $("#submit1").attr("disabled", false);
                    }
                },
                error: function (data) {
                    alert("发生了一个错误");
                }
            });
        }
    </script>
    <script type="text/javascript">
        var i = 1;
        var j = 1;
        var k = 1;
        $(function () {
            $("#add").click(function () {
                $("#formPane1").toggle();
                var btn = document.getElementById("add");
                var price1 = document.getElementById("passPrice0");
                var price2 = document.getElementById("passPrice1")
                if(i%2!=0){
                    add.innerHTML = "删除乘客";
                    i = i - 1;
                    $("#bookNumber").val("2");
                }else{
                    add.innerHTML = "添加乘客";
                    i = i + 1;
                    $("#bookNumber").val("1");
                }
                if( add.innerHTML == '删除乘客'){
                    var s2 = parseInt(price2.innerText) + parseInt(price1.innerText);
                    $("#price").html(s2);
                }else{
                    var s2 = parseInt(price1.innerText);
                    $("#price").html(s2);
                }
            })
            //根据乘客类型改变价格
            $('input[type=radio][name=ptCode0]').change(function () {
                var price1 = document.getElementById("passPrice0");
                var price2 = document.getElementById("passPrice1")
                if(this.value == '2'){
                    var s = parseInt(price1.innerText) / 2;
                    $("#passPrice0").html(s);

                    if( add.innerHTML == '删除乘客'){
                        var s2 = parseInt(price2.innerText) + parseInt(price1.innerText);
                        $("#price").html(s2);
                    }else{
                        var s2 = parseInt(price1.innerText);
                        $("#price").html(s2);
                    }
                    j++;
                }else{
                    if(j!=1){
                        var s = parseInt(price1.innerText) * 2;
                        $("#passPrice0").html(s);
                        if( add.innerHTML == '删除乘客'){
                            var s2 = parseInt(price2.innerText) + parseInt(price1.innerText);
                            $("#price").html(s2);
                        }else{
                            var s2 = parseInt(price1.innerText);
                            $("#price").html(s2);
                        }
                        j--;
                    }
                    else{
                        var s2 = parseInt(price2.innerText)
                    }
                }
                $("#bookTotal").val(s2);
                // alert($("#bookTotal").val());
            })
            $('input[type=radio][name=ptCode1]').change(function () {
                var price1 = document.getElementById("passPrice0");
                var price2 = document.getElementById("passPrice1");
                if(this.value == '2'){
                    var s = parseInt(price2.innerText) / 2;
                    $("#passPrice1").html(s);

                    if( add.innerHTML == '删除乘客'){
                        var s2 = parseInt(price2.innerText) + parseInt(price1.innerText);
                        $("#price").html(s2);
                    }else{
                        var s2 = parseInt(price1.innerText);
                        $("#price").html(s2);
                    }
                    k++;
                }else{
                    if(k!=1){
                        var s = parseInt(price2.innerText) * 2;
                        $("#passPrice1").html(s);

                        if( add.innerHTML == '删除乘客'){
                            var s2 = parseInt(price2.innerText) + parseInt(price1.innerText);
                            $("#price").html(s2);
                        }else{
                            var s2 = parseInt(price1.innerText);
                            $("#price").html(s2);
                        }
                        k--;
                    }
                }
                $("#bookTotal").val(s2);
            })
        })
    </script>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <%--申请获取登录状态--%>
    <%
        String bpCode = (String)session.getAttribute("bpCode");
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd ");
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
                                              action="/hk_war_exploded/passengerTicket/loginUser.do" id="signIn"
                                              name="signIn">
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
                                            <button class="button button-pill button-primary" type="submit" id="submit1"
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

<div class="container" align="center">
    <div class="row clearfix" style="width: 600px;height: 70px;box-shadow: 2px 2px 5px #000000;margin-bottom: 20px">
        <div style="width: 50px;height: 50px;float: left">
            <img src="${pageContext.request.contextPath}/png/logo.png" style="width: 43px;height: 20px;margin-top: 22px" align="right">
        </div>
        <div align="left" style="font-size: 25px;width: 100px;float: left;margin-top: 15px;"><%=request.getParameter("alCode")%></div><%--航班编号--%>
        <div style="width: 40px;height: 70px; float: left"></div>
        <div style="width: 120px;float: left">
            <div style="font-size: 20px;text-align: center;margin-top: 7px" align="right"><%=request.getParameter("dcityName")%></div><%--出发城市--%>
            <div style="font-size: 13px;text-align: center" align="right"><%=request.getParameter("ETD")%></div><%--出发时间--%>
        </div>
        <div style="float: left;width: 50px;margin-top: 20px">---------</div>
        <div style="width: 120px;float: left">
            <div style="font-size: 20px;text-align: center;margin-top: 7px" align="right"><%=request.getParameter("tcityName")%></div><%--终点城市--%>
            <div style="font-size: 13px;text-align: center" align="right"><%=request.getParameter("ETA")%></div><%--到达时间--%>
        </div>
<%--        <div style="float: left;width: 120px;margin-top: 20px" align="center">&lt;%&ndash;飞机名&ndash;%&gt;--%>
<%--            boyin--%>
<%--        </div>--%>
    </div>
</div>

<div class="container" align="center">
    <%int j = 500;%>
    <div class="row clearfix" style="width: 600px">
        <form class="form-horizontal" role="form" style="border:1px solid #000000;" id="form" method="post">
            <div id="formPane">
                <div class="form-group" style="margin-top: 10px">
                    <label for="pt" class="col-sm-3 control-label">乘客类型</label>
                    <div id="pt" class="col-sm-9" style="display: flex; flex-direction: row; margin-top: 7px">
                        <input id="radio11" onchange="ready" type="radio" name="ptCode0" value="1" align="center">成人
                        <input id="radio12" type="radio" name="ptCode0" value="2" align="center" style="margin-left: 50px;">儿童
                    </div>
                </div>
                <div class="form-group">
                    <label for="passName" class="col-sm-3 control-label">姓名</label>
                    <div class="col-sm-9">
                        <input type="text" id="passName" name="passName" class="form-control"
                               style="width: 350px;float: left;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passID" class="col-sm-3 control-label">身份证</label>
                    <div class="col-sm-9">
                        <input type="text" id="passID" name="passID" class="form-control"
                               style="width: 350px;float: left;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passPhone" class="col-sm-3 control-label">手机号码</label>
                    <div class="col-sm-9">
                        <input type="text" id="passPhone" name="passPhone" class="form-control"
                               style="width: 350px; float: left;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passPrice0" class="col-sm-3 control-label">基础价格</label>
                    <div>
                        <div name="passPrice" id="passPrice0" style="width: 350px;height: 30px;float: left"><%=request.getParameter("ssPrice")%></div>
                    </div>
                </div>

                <%--隐藏表单信息--%>
                <input type="hidden" name="alCode" value="<%=request.getParameter("alCode")%>">
                <input type="hidden" name="fightDate" value="<%=request.getParameter("fightDate")%>">
                <input type="hidden" name="ssCode" value="<%=request.getParameter("ssCode")%>">
                <input type="hidden" name="bpCode" value="<%=bpCode%>">
                <input type="hidden" id="bookNumber" name="bookNumber" value="1">
                <input type="hidden" id="bookTotal" name="bookTotal" value="">
            </div>
            <div id="formPane1" style="display: none;border-top: 1px solid #000000">
                <div class="form-group" style="margin-top: 10px">
                    <label for="pt1" class="col-sm-3 control-label">乘客类型</label>
                    <div id="pt1" class="col-sm-9" style="display: flex; flex-direction: row; margin-top: 7px">
                        <input type="radio" name="ptCode1" value="1" align="center">成人
                        <input type="radio" name="ptCode1" value="2" align="center" style="margin-left: 50px;">儿童
                    </div>
                </div>
                <div class="form-group">
                    <label for="passName1" class="col-sm-3 control-label">姓名</label>
                    <div class="col-sm-9">
                        <input type="text" id="passName1" name="passName" class="form-control"
                               style="width: 350px;float: left;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passID1" class="col-sm-3 control-label">身份证</label>
                    <div class="col-sm-9">
                        <input type="text" id="passID1" name="passID" class="form-control"
                               style="width: 350px;float: left;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passPhone1" class="col-sm-3 control-label">手机号码</label>
                    <div class="col-sm-9">
                        <input type="text" id="passPhone1" name="passPhone" class="form-control"
                               style="width: 350px; float: left;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passPrice1" class="col-sm-3 control-label">基础价格</label>
                    <div>
                        <div name="passPrice" id="passPrice1" style="width: 350px;height: 30px;float: left"><%=request.getParameter("ssPrice")%></div>
                    </div>
                </div>
            </div>
        </form>

        <div style="margin-bottom: 5px;">总价</div>
        <div style="margin-bottom: 20px" id="price"><%=request.getParameter("ssPrice")%></div>

        <button id="add" onclick="add()" class="btn btn-default">添加乘客</button>
        <button id="submit"  class="btn btn-default" onclick="submitPassengerList()">下一步</button>
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
