<%@ page import="java.util.List" %>
<%@ page import="com.hk.pojo.Fights" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>

<%
    String jsonFights = (String)request.getAttribute("jsonFights");
    List<Fights> fights = JSON.parseArray(jsonFights, Fights.class);
%>
<%
    for(int from = 0; from < fights.size(); from++) {
%>
    <input type="text" value="<%=fights.get(from).toString()%>"/>
<%
    }
%>

</body>
</html>
