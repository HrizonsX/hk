<%--
  Created by IntelliJ IDEA.
  User: whiteman
  Date: 2019-07-11
  Time: 02:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单测试</title>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" language="JavaScript">
        function ajaxValidate1() {
            var fightParams = {};
            fightParams.alCode = $("input[name='alCode']").val();
            // alert(fightParams.alCode);
            fightParams.fightDate = $("input[name='fightDate']").val();
            // alert(fightParams.fightDate);
            $.ajax({
                type: "POST",
                url: "./admin/checkAlCode.do",//提交地址
                contentType: 'text/plain;charset=utf-8', //设置请求头信息
                data: JSON.stringify(fightParams),    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
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
    <form action="#" method="post">
        <input name="alCode" type="text"/>
        <span id="remind" color="red"></span></br>
        <input name="fightDate" type="text" onblur="ajaxValidate1()">
        <input type="submit" value="提交查订单" id="submit" disabled="disabled"/>
    </form>
</body>
</html>
