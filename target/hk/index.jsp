<%--
  Created by IntelliJ IDEA.
  User: whiteman
  Date: 2019-06-24
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<form method="post" action="./passengerTicket/bookTicket.do">
    <input type="radio" name="passengers[0].ptCode" value="1" checked="checked"/>成人
    <input type="radio" name="passengers[0].ptCode" value="2"/>小孩
    <input type="text" name="passengers[0].passName"/></br>
    <input type="text" name="passengers[0].passID"/></br>
    <input type="text" name="passengers[0].passPhone"/></br>
    <input type="text" name="passengers[0].passPrice"/></br>
    <input type="radio" name="passengers[1].ptCode" value="1" checked="checked"/>成人
    <input type="radio" name="passengers[1].ptCode" value="2"/>小孩
    <input type="text" name="passengers[1].passName"/></br>
    <input type="text" name="passengers[1].passID"/></br>
    <input type="text" name="passengers[1].passPhone"/></br>
    <input type="text" name="passengers[1].passPrice"/></br>
    <input type="hidden" name="alCode" value="mh666"/>
    <input type="hidden" name="fightDate" value="2019-1-2 10:00:00"/>
    <input type="hidden" name="ssCode" value="1"/>

    <input type="hidden" name="bpCode" value="1"/>
<%--    <input type="hidden" name="couponCode" value="1"/>--%>

    <input type="hidden" name="bookNumber" value="2"/>
    <input type="hidden" name="bookTotal" value="6700.00"/>
    <input type="submit" value="提交"/>
</form>


</body>
</html>
