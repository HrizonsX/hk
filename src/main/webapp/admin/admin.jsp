<%@ page import="java.util.List" %>
<%@ page import="com.hk.pojo.Fights" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hk.pojo.Fight" %><%--
  Created by IntelliJ IDEA.
  User: admin

  Date: 2019/7/11
  Time: 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="//g.alicdn.com/sd/smartCaptcha/0.0.4/index.js"></script>
    <script src="//g.alicdn.com/sd/quizCaptcha/0.0.1/index.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/laydate/laydate.js" type="text/javascript"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>管理</title>
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/button.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<div class="container" align="center">
    <div>
        <%
            List<Fight> fightList = (List<Fight>) request.getAttribute("fights");
        %>
    </div>
    <div class="row clearfix" style="width: 1000px">
        <div class="table-responsive">
            <table class="table table-striped" style="width: 100%; table-layout: fixed;margin-top: 30px">
                <caption>全部航班</caption>
                <thread>
                    <tr style="height: 40px;">
                        <th style="text-align: center;font-size: 12px">航线编号</th>
                        <th style="text-align: center;font-size: 12px">航班日期</th>
                        <th style="text-align: center;font-size: 12px">飞机型号</th>
                        <%--<th style="text-align: center;font-size: 12px">出发城市</th>--%>
                        <%--<th style="text-align: center;font-size: 12px">到达城市</th>--%>
                        <th style="text-align: center;font-size: 12px">预计出发时间</th>
                        <th style="text-align: center;font-size: 12px">实际出发时间</th>
                        <th style="text-align: center;font-size: 12px">预计到达时间</th>
                        <th style="text-align: center;font-size: 12px">实际到达时间</th>
                        <th style="text-align: center;font-size: 12px">航班状态</th>
                        <th style="text-align: center;font-size: 12px">修改</th>
                    </tr>
                </thread>
                <%
                    for(int i = 0; i < fightList.size(); i++){
                        Fight fights = fightList.get(i);
                %>
                <tbody style="height: 60px">
                <tr>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getAlCode()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getFightDate()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getAircraftCode()%></td>
                    <%--<td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getDcityName()%></td>--%>
                    <%--<td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getTcityName()%></td>--%>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getETD()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getETA()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getATD()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getATA()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getFightState()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;">
                        <a style="vertical-align: middle;font-size:12px" data-toggle="modal" data-target="#changeLab<%=i%>">修改</a>
                        <div class="modal fade" id="changeLab<%=i%>"  tabindex="-1" role="dialog" aria-labelledby="changeLabLabel" aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog">
                                <div class="modal-content modalWidth" style="width: 600px;">
                                    <div class="modal-header modalHeader">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                        修改
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" method="post" action="./modifyFight.do" id="changeForm" name="changeForm">
                                            <div class="form-group">
                                                <label for="alCode<%=i%>" class="col-sm-3 control-label">航线编号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="alCode<%=i%>" name="alCode" class="form-control" value="<%=fights.getAlCode()%>" readonly="readonly">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fightDate<%=i%>" class="col-sm-3 control-label">航班日期</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="fightDate<%=i%>" name="fightDate" class="form-control" value="<%=fights.getFightDate()%>" readonly="readonly">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="aircraftType<%=i%>" class="col-sm-3 control-label">飞机型号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="aircraftType<%=i%>" name="aircraftCode" class="form-control" value="<%=fights.getAircraftCode()%>">
                                                </div>
                                            </div>
                                            <%--<div class="form-group">--%>
                                            <%--<label for="deityName<%=i%>" class="col-sm-3 control-label">出发城市</label>--%>
                                            <%--<div class="col-sm-9">--%>
                                            <%--<input type="text" id="deityName<%=i%>" name="alCode" class="form-control" value="<%=fights.getDcityName()%>">--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label for="tcityName<%=i%>" class="col-sm-3 control-label">到达城市</label>--%>
                                            <%--<div class="col-sm-9">--%>
                                            <%--<input type="text" id="tcityName<%=i%>" name="alCode" class="form-control" value="<%=fights.getTcityName()%>">--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <div class="form-group">
                                                <label for="ETD<%=i%>" class="col-sm-3 control-label">预计出发时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ETD<%=i%>" name="ETD" class="form-control" value="<%=fights.getETD()%>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ATD<%=i%>" class="col-sm-3 control-label">实际出发时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ATD<%=i%>" name="ATD" class="form-control" value="<%=fights.getETA()%>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ETA<%=i%>" class="col-sm-3 control-label">预计到达时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ETA<%=i%>" name="ETA" class="form-control" value="<%=fights.getATD()%>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ATA<%=i%>" class="col-sm-3 control-label">实际到达时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ATA<%=i%>" name="ATA" class="form-control" value="<%=fights.getATA()%>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fightState<%=i%>" class="col-sm-3 control-label">航班状态</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="fightState<%=i%>" name="fightState" class="form-control" value="<%=fights.getFightState()%>">
                                                </div>
                                            </div>
                                            <button class="button button-pill button-primary" type="submit">修改</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <div>
                <button class="button button-pill button-primary">添加航班</button>
                <a href="http://localhost:8080/webroot/decision/view/report?viewlet=WorkBook8.cpt">航空报表</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
