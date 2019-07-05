<%--
  Created by IntelliJ IDEA.
  User: whiteman
  Date: 2019-07-02
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
    <script type="text/javascript" language="JavaScript">
        function ajaxValidate() {
            var bpCode = $("#bpCode").val();
            $.ajax({
                type: "POST",
                url: "./passengerTicket/registerUser1.do",//提交地址
                contentType: 'application/json;charset=utf-8', //设置请求头信息
                data: $.toJSON(bpCode),//提交数据
                dataType: "text",//返回text内容
                async: false,
                success: function (data) {
                    if ("no" == data) {
                        //后端传来的msg的值是no,不能注册。反之。
                        $("#remind").html("<font color='red'>抱歉，该用户名已被注册！</font>");
                        $("#submit").attr("disabled",true);
                    }
                    if ("yes" == data) {
                        //如果没有被注册，将提示语清空。
                        $("#remind").html("用户名可用");
                        $("#submit").attr("disabled",false);
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
<form action="./passengerTicket/registerUser.do" method="post">
    <label>用户名：</label>
    <input type="text" name="bpCode" id="bpCode"
           onblur="ajaxValidate()"/>
    <span id="remind" color="red"></span></br>
    <label>密码：</label>
    <input type="password" name="bpPassword"/></br>
    <label>姓名：</label>
    <input type="text" name="bpName"/></br>
    <label>联系电话：</label>
    <input type="tel" name="bpPhone"/></br>
    <label>电子邮箱：</label>
    <input type="email" name="bpEmail"/></br>
    <input type="submit" value="提交" id="submit" disabled="disabled"/>
</form>
</body>
</html>
