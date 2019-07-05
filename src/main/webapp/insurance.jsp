<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>购买保险</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js" ></script>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery-json/2.6.0/jquery.json.min.js"></script>
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
                insArray.push({bookCode: bookCode, bbCode: bbCode, insuranceCode: ins});
            }
            bookParams.insuranceOrders = insArray;
            $.ajax({
                url: "./passengerTicket/buyInsurance.do",
                type: "POST",
                contentType : 'application/json;charset=utf-8', //设置请求头信息
                dataType:"text",
                //data: JSON.stringify(customerArray),    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
                data: $.toJSON(bookParams),    //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
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
<form>
    <input type="radio" name="ins0" value="1"/><label>延误险</label>
    <input type="radio" name="ins0" value="2"/><label>人身险</label>
    <input type="hidden" name="bookCode" value="8"/></br>
    <input type="hidden" name="bbCode" value="1"/></br>

    <input type="radio" name="ins1" value="1"/><label>延误险</label>
    <input type="radio" name="ins1" value="2"/><label>人身险</label>
    <input type="hidden" name="bookCode" value="8"/></br>
    <input type="hidden" name="bbCode" value="2"/></br>

    <input type="button" value="提交" onclick="submitPassengerList();"/>
</form>


</body>
</html>
