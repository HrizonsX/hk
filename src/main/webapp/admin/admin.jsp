<%@ page import="java.util.List" %>
<%@ page import="com.hk.pojo.Fights" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hk.pojo.Fight" %>
<%@ page import="com.hk.pojo.Aircraft" %>
<%@ page import="com.hk.pojo.AirLine" %><%--
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
    <script type="text/javascript" language="JavaScript">
        function ajaxValidate1() {
            var fightParams = {};
            fightParams.alCode = $("#aalCode").val();
            // alert(fightParams.alCode);
            fightParams.fightDate = $("#afightDate").val();
            // alert(fightParams.fightDate);
            $.ajax({
                type: "POST",
                url: "./checkAlCode.do",//提交地址
                contentType: 'text/plain;charset=utf-8', //设置请求头信息
                data: JSON.stringify(fightParams),    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
                dataType: "text",//返回text内容
                // async: false,
                success: function (data) {
                    if ("no" == data) {
                        //后端传来的msg的值是no,不能注册。反之。
                        $("#remin").html("<font color='red'>该躺航班已存在</font>");
                        $("#submit1").attr("disabled", true);
                    }
                    if ("yes" == data) {
                        //如果没有被注册，将提示语清空。
                        $("#remin").html("航班信息可添加");
                        $("#submit1").attr("disabled", false);
                    }
                },
                error: function (data) {
                    // alert("发生了一个错误");
                }
            });
        }
    </script>
</head>
<body>

<div class="container" align="center">
    <div>
        <%
            List<Fight> fightList = (List<Fight>) request.getAttribute("fights");
            List<Aircraft> aircraftList = (List<Aircraft>) request.getAttribute("aircrafts");
            List<AirLine> airLineList = (List<AirLine>) request.getAttribute("airLines");
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
                        Fight fight = fightList.get(i);
                %>
                <tbody style="height: 60px">
                <tr>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.getAlCode()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.ymdhmsDateFormat(fight.getFightDate())%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.getAircraftCode()%></td>
                    <%--<td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getDcityName()%></td>--%>
                    <%--<td align="center" style="vertical-align: middle;font-size: 12px;"><%=fights.getTcityName()%></td>--%>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.ymdhmsDateFormat(fight.getETD())%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.ymdhmsDateFormat(fight.getETA())%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.ymdhmsDateFormat(fight.getATD())%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.ymdhmsDateFormat(fight.getATA())%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;"><%=fight.getFightState()%></td>
                    <td align="center" style="vertical-align: middle;font-size: 12px;">
                        <a style="vertical-align: middle;font-size:12px" data-toggle="modal" data-target="#changeLab<%=i%>">修改</a>
                        <div class="modal fade" id="changeLab<%=i%>"  tabindex="-1" role="dialog" aria-labelledby="changeLabLabel" aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog">
                                <div class="modal-content modalWidth" style="width: 600px;">
                                    <div class="modal-header modalHeader">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">><</button>
                                        修改
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" method="post" action="#" id="changeForm" name="changeForm">
                                            <div class="form-group">
                                                <label for="alCode<%=i%>" class="col-sm-3 control-label">航线编号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="alCode<%=i%>" name="alCode" class="form-control" value="<%=fight.getAlCode()%>" disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fightDate<%=i%>" class="col-sm-3 control-label">航班日期</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="fightDate<%=i%>" name="fightDate" class="form-control" value="<%=fight.ymdhmsDateFormat(fight.getFightDate())%>" disabled="disabled">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="aircraftCode<%=i%>" class="col-sm-3 control-label">飞机型号</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="aircraftCode<%=i%>" name="aircraftCode" class="form-control" value="<%=fight.getAircraftCode()%>">
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
                                                    <input type="text" id="ETD<%=i%>" name="ETD" class="form-control" value="<%=fight.ymdhmsDateFormat(fight.getETD())%>">
                                                    <script>
                                                        laydate.render({
                                                            elem: '#ETD<%=i%>' //指定元素
                                                            ,type:'datetime'
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ATD<%=i%>" class="col-sm-3 control-label">实际出发时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ATD<%=i%>" name="ATD" class="form-control" value="<%=fight.ymdhmsDateFormat(fight.getATD())%>">
                                                    <script>
                                                        laydate.render({
                                                            elem: '#ATD<%=i%>' //指定元素
                                                            ,type:'datetime'
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ETA<%=i%>" class="col-sm-3 control-label">预计到达时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ETA<%=i%>" name="ETA" class="form-control" value="<%=fight.ymdhmsDateFormat(fight.getETA())%>">
                                                    <script>
                                                        laydate.render({
                                                            elem: 'ETA<%=i%>' //指定元素
                                                            ,type:'datetime'
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ATA<%=i%>" class="col-sm-3 control-label">实际到达时间</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="ATA<%=i%>" name="ATA" class="form-control" value="<%=fight.ymdhmsDateFormat(fight.getATA())%>">
                                                    <script>
                                                        laydate.render({
                                                            elem: '#ATA<%=i%>' //指定元素
                                                            ,type:'datetime'
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="fightState<%=i%>" class="col-sm-3 control-label">航班状态</label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="fightState<%=i%>" name="fightState" class="form-control" value="<%=fight.getFightState()%>">
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
                </tbody>
                <%}%>
            </table>
            <div>
                <button class="button button-pill button-primary" data-toggle="modal" data-target="#addFight">添加航班</button>
                <div class="modal fade" id="addFight"  tabindex="-1" role="dialog" aria-labelledby="changeLabLabel" aria-hidden="true" data-backdrop="false">
                    <div class="modal-dialog">
                        <div class="modal-content modalWidth" style="width: 600px;">
                            <div class="modal-header modalHeader">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                增加
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form" method="post" action="./addFight.do" id="addForm" name="changeForm">
                                    <div class="form-group">
                                        <label for="aalCode" class="col-sm-3 control-label">航线编号</label>
                                        <div class="col-sm-9">
                                            <input type="text" list="alCodeList" id="aalCode" name="alCode" class="form-control">
                                            <datalist id="alCodeList">
                                                <%
                                                    for(int i = 0; i < airLineList.size(); i++){
                                                        AirLine airLine = airLineList.get(i);
                                                %>
                                                <option value="<%=airLine.getAlCode()%>"><%=airLine.getAlCode()%></option>
                                                <%}%>
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="afightDate" class="col-sm-3 control-label">航班日期</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="afightDate" name="fightDate" class="form-control" onblur="ajaxValidate1()"/>
                                            <div id="remin" style="margin-right: 345px;font-size: 10px;" color="red"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="aaircraftCode" class="col-sm-3 control-label">飞机型号</label>
                                        <div class="col-sm-9">
                                            <input type="text" list="aircraftCodeList" id="aaircraftCode" name="aircraftCode" class="form-control">
                                            <datalist  id="aircraftCodeList">
                                                <%
                                                    for(int i = 0; i < aircraftList.size(); i++){
                                                        Aircraft aircraft = aircraftList.get(i);
                                                %>
                                                <option value="<%=aircraft.getAircraftCode()%>"><%=aircraft.getAircraftCode()%></option>
                                                <%}%>
                                            </datalist>
                                        </div>
                                    </div>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="adeityName" class="col-sm-3 control-label">出发城市</label>--%>
<%--                                        <div class="col-sm-9">--%>
<%--                                            <input type="text" id="adeityName" name="deityName" class="form-control">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="atcityName" class="col-sm-3 control-label">到达城市</label>--%>
<%--                                        <div class="col-sm-9">--%>
<%--                                            <input type="text" id="atcityName" name="tcityName" class="form-control">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="form-group">
                                        <label for="aETD" class="col-sm-3 control-label">预计出发时间</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="aETD" name="ETD" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="aATD" class="col-sm-3 control-label">实际出发时间</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="aATD" name="ATD" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="aETA" class="col-sm-3 control-label">预计到达时间</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="aETA" name="ETA" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="aATA" class="col-sm-3 control-label">实际到达时间</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="aATA" name="ATA" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="afightState" class="col-sm-3 control-label">航班状态</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="afightState" name="fightState" class="form-control">
                                        </div>
                                    </div>
                                    <button class="button button-pill button-primary" type="submit" id="submit1" disabled="disabled">增加</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="http://localhost:8080/webroot/decision/view/report?viewlet=WorkBook8.cpt">航空报表</a>
            </div>
        </div>
    </div>
</div>
<script>
    laydate.render({
        elem: '#aETD' //指定元素
        ,type:'datetime'
    });

    laydate.render({
        elem: '#afightDate' //指定元素
        ,type:'datetime'
    });

    laydate.render({
        elem: '#aATD' //指定元素
        ,type:'datetime'
    });

    laydate.render({
        elem: '#aETA' //指定元素
        ,type:'datetime'
    });

    laydate.render({
        elem: '#aATA' //指定元素
        ,type:'datetime'
    });
</script>
</body>
</html>
