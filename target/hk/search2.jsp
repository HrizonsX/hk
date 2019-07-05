<%--
  Created by IntelliJ IDEA.
  User: whiteman
  Date: 2019-06-28
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search2</title>
</head>
<body>
<form action="./passengerTicket/searchTicket2.do" method="post">
    <input type="text" name="alCode"/>
    <input type="date" name="fightDate" value="2019-01-02"/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>