<%--
  Created by IntelliJ IDEA.
  User: whiteman
  Date: 2019-07-02
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
    <script type="text/javascript" language="JavaScript">
        //页面初加载时，这个js脚本自动运行
        $(function () {
            $.ajax({
                type: "POST",
                url: "./passengerTicket/getCities.do",//提交地址
                contentType: 'application/json;charset=utf-8', //设置请求头信息
                dataType: "json",//返回json内容
                async: false,
                success: function (data) {
                    for (var city in data){
                        //循环遍历城市列表
                        alert(data[city].cityName);
                    }
                },
                error: function (data) {
                    alert("发生了一个错误");
                }
            });
        });
    </script>
</head>
<body>
<a href="http://localhost:8080/webroot/decision/view/report?viewlet=WorkBook8.cpt">航空报表，点这里看</a>
</body>
</html>
