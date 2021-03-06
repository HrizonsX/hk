<%@ page import="com.hk.pojo.Fights" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hk.pojo.FightShipping" %><%--
  Created by IntelliJ IDEA.
  User: whiteman
  Date: 2019-07-26

  Time: 08:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>航空</title>
    <script language="JavaScript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cityselect.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pikaday.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ticket.css"/>
    <!-- <link rel="stylesheet" href="css/site.css"> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pikaday.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/cityselect.js"></script>
    <script type="text/javascript" language="JavaScript">
        $(document).ready(function () {
            $('.dpp').click(function () {
                $(".dpp").css("display", "none");
                $(".hid").css("display", "block");
            });
        });
        $(document).ready(function () {
            $('.dbt').click(function () {
                $(".dpp").css("display", "block");
                $(".hid").css("display", "none");
            });
        });
        $(document).ready(function () {
            $('.change').click(function () {
                var value = $(".tcityName").val();
                $(".tcityName").val($(".dcityName").val());
                $(".dcityName").val(value);
            });
        });
    </script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico"/>
</head>
<body>
<%
    String jsonFights = (String) request.getAttribute("jsonFights");
    List<Fights> fights = JSON.parseArray(jsonFights, Fights.class);
%>
<div>
    <div class="head">
        <div class="logo"></div>
        <div class="line">
            <div class="lineItem target">
                白鹭会员
                <div class="userView">
                    <div class="box">
                        <div class="bLeft">
                            <div class="heel">
                                经常出差？
                            </div>
                            <div class="heel2">
                                成为白鹭会员，让您的飞行更有意义!
                            </div>
                            <div class="heaa">
                                <div class="re">注册</div>
                                <div class="log">登陆</div>
                            </div>
                            <div class="heel2" style="font-size: 11px; margin-top: 20px;">使用手机快速购买机票?</div>
                            <div class="log" style="margin-top: 9px; width: 115px;">非会员快速购票</div>
                        </div>
                        <div class="bRight">
                            <div class="tt">
                                <div class="tth">白鹭俱乐部</div>
                                <div class="ttb">管理您的账户，查看最新会员咨询</div>
                            </div>
                            <div class="tt">
                                <div class="tth">我的账户</div>
                                <div class="ttb">查看积分余额、乘机明细及账户设置</div>
                            </div>
                            <div class="tt">
                                <div class="tth">我的订单</div>
                                <div class="ttb">在线管理厦航订单、可在网上进行更改和取消</div>
                            </div>
                            <div class="tt">
                                <div class="tth">积分积累</div>
                                <p class="ttb">乘坐厦航航班、天合联盟成员航空公司航班、合作商家处消费即可累积</p>
                            </div>
                            <div class="tt">
                                <div class="tth">积分兑换</div>
                                <div class="ttb">兑换奖励机票及积分商城特色商品</div>
                            </div>
                            <div class="tt">
                                <div class="tth">优惠专区</div>
                                <div class="ttb">白鹭会员专属折扣产品、额外奖励产品及专项优惠特约商家</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="lineItem">预定管理</div>
            <div class="lineItem">互动专区</div>
            <div class="lineItem">出行帮助</div>
        </div>
        <div class="nation"></div>
        <a href="#" class="login">登陆</a>
        <div class="sep"></div>
        <a href="#" class="register">注册</a>
    </div>
    <div class="order">
        <div class="lline">
            <div class="llline"> 1.选择航班</div>
            <div class="llline2"> 2.填写订单</div>
            <div class="llline2"> 3.增值服务</div>
            <div class="llline2"> 4.确认并支付</div>
            <div class="llline2"> 5.出票完成</div>
        </div>
    </div>
    <div class="searchBox">
        <div class="type">
            <div class="single">单程</div>
            <div class="double">往返</div>
        </div>
        <div class="sline">
            <div class="slineL">
                <div class="from" style="float: left;">
                    <input type="text" class="dcityName" id="citySelect" placeholder="出发城市"/>
                </div>
                <script type="text/javascript">
                    var test1 = new Vcity.CitySelector({
                        input: 'citySelect'
                    });
                </script>
                <button class="change"></button>
                <div class="to" style="float: left;">
                    <input type="text" class="tcityName" id="citySelect2" placeholder="到达城市"/>
                </div>
                <script type="text/javascript">
                    var test2 = new Vcity.CitySelector({
                        input: 'citySelect2'
                    });
                </script>
                <div class="data" style="float: left;">
                    <input type="text" class="fightDate" placeholder="出发时间" id="datepicker"/>
                </div>
                <script>
                    var picker = new Pikaday({
                        field: document.getElementById('datepicker'),
                        firstDay: 1,
                        minDate: new Date('2018-01-01'),
                        maxDate: new Date('2020-12-31'),
                        yearRange: [2018, 2020]
                    });
                </script>
            </div>
            <div class="slineR">查询</div>
        </div>
    </div>
    <div class="lr">
        <div style="float: right; width: 220px; margin-bottom: 30px;">
            <div class="lrr">
                <div class="icon5"></div>
                <div style="color: rgb(169,131,91); font-size: 12px;">所有航班起抵时间均为当地时间（24</div>
                <div style="color: rgb(169,131,91); font-size: 12px; margin-top: 3px;">4小时制），请注意安排行程。</div>
            </div>
            <div class="lrr2">
                <div style="color: rgb(162,122,83); font-size: 16px; margin-top: 9px;">温馨提示：</div>
                <div style="color: rgb(162,122,83); font-size: 12px; margin-top: 11px;">厦航官网暂不接受重要旅客（VIP)、</div>
                <div style="color: rgb(162,122,83); font-size: 12px; margin-top: 3px;">孕妇、病残旅客等特殊旅客购票。如</div>
                <div style="color: rgb(162,122,83); font-size: 12px; margin-top: 3px;">您有需要，请到厦航自营售票处咨</div>
                <div style="color: rgb(162,122,83); font-size: 12px; margin-top: 3px;">询。</div>
            </div>

        </div>
        <div style="float: left; width: 770px; margin-bottom: 35px;">
            <div class="dh1">
                <span class="dhs1">单程：厦门 - 北京</span>
                <span>2019-07-11</span>
            </div>
            <div class="dm">
                <div class="ms">
                    更多排序&筛选
                </div>
                <div class="ts">
                    <div class="tsi"></div>
                    出发时刻从早到晚
                </div>
                <div class="ps">
                    <div class="psi"></div>
                    价格从高到低
                </div>
            </div>
            <%
                for (int from = 0; from < fights.size(); from++) {
                    Fights fight = fights.get(from);
                    long siz = fight.getETA().getTime() - fight.getETD().getTime();
                    long min = siz / (1000 * 60);
                    long hou = min / 60;
                    min = min - hou * 60;
            %>
            <div class="d1">
                <div class="d2">
                    <img src="${pageContext.request.contextPath}/img/logoOG.png" class="i"/>
                    <span class="s1"><%=fight.getAlCode()%></span>
                    <span class="s2"><%=fight.getAircraftType()%></span>
                    <span class="s3"><img src="${pageContext.request.contextPath}/img/wifi.png" class="i2"></img></span>
                    <span class="s4">晚餐</span>
                    <div class="d5"></div>
                </div>
                <div class="d3">
                    <div class="d6">
                        <div class="d61"></div>
                        <div class="d64">
                            <div class="d62"><%=fight.hmDateFormat(fight.getETD())%>
                            </div>
                            <div class="d63"><%=fight.getDairportName()%>
                            </div>
                        </div>
                    </div>
                    <div class="d7">
                        <div class="dp1">
                            <span class="sp1">直飞</span>
                        </div>
                    </div>
                    <div class="d8">
                        <div class="d81"></div>
                        <div class="d64">
                            <div class="d62"><%=fight.hmDateFormat(fight.getETA())%>
                            </div>
                            <div class="d63"><%=fight.getTairportName()%>
                            </div>
                        </div>
                    </div>
                    <div class="d9"><%=hou%>小时<%=min%>分钟
                    </div>
                    <div class="dp">
                        <span style="color: orange; font-size: 23px;">¥</span>
                        <span style="color: orange; font-size: 36px ;">1590</span>
                        <span style="color: orange; font-size: 13px ;">起</span>
                    </div>
                </div>
                <div class="d4">
                    <%
                        for (int i = 0; i < fight.getFightShippings().size(); i++) {
                            FightShipping fightShipping = fight.getFightShippings().get(i);
                            int ticketNum = 0;
                    %>
                    <div class="dp4">
                        <div class="dp41">
                            <%
                                if (fightShipping.getSsName().compareTo("ec") == 0) {
                                    ticketNum = fightShipping.getEcsqNumber();
                            %>
                            快乐常飞（K）
                            <%
                            } else if (fightShipping.getSsName().compareTo("bc") == 0) {
                                ticketNum = fightShipping.getBcsqNumber();
                            %>
                            商务舱（I）
                            <%
                            } else {
                                ticketNum = fightShipping.getFcsqNumber();
                            %>
                            商务舱（J）
                            <%
                                }
                            %>
                        </div>
                        <div class="dp42">
                            行李|退改规则
                            <div class="q">
                                <div class="alert" style="width:400px;">
                                    <div>
                                        <div style="color: rgb(89, 151, 204);">行李限额</div>
                                        <table class="t1">
                                            <tr>
                                                <td style="color: rgb(133, 137, 145);" class="td1">厦门-北京</td>
                                                <td class="td1">
                                                    <p style="margin: 0px; height: 20px; color: white; margin-top: 5px;">免费托运行李额20公斤</p>
                                                    <p style="margin: 0px; height: 23px; color: white;">
                                                        注：仅供参考，以实际情况为准。超额行李可通过购买预付费行李。</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div>
                                        <div style="color: rgb(89, 151, 204);">退改规则</div>
                                    </div>
                                    <div>
                                        <table class="t2">
                                            <tr>
                                                <th class="tb2"><strong style="font-size: 11px; color: white; line-height: 30px;"> 退改时间点 </strong></th>
                                                <th class="tb2"><strong style="font-size: 11px; color: white; "> 自愿退票手续费率&nbsp;&nbsp;&nbsp;&nbsp;</strong></th>
                                                <th class="tb2"><strong style="font-size: 11px; color: white;"> 自愿变更手续费率 </strong></th>
                                            </tr>
                                            <tr>
                                                <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前7天（含）前</td>
                                                <td class="tb2 tbc" style="font-size: 11px; color: white;">15%</td>
                                                <td class="tb2 tbc" style="font-size: 11px; color: white;">10%</td>
                                            </tr>
                                            <tr>
                                                <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前7天（不含）至48小时（含）之间</td>
                                                <td class="tb2 tbc" style="font-size: 11px; color: white;">40%</td>
                                                <td class="tb2 tbc" style="font-size: 11px; color: white;">30%</td>
                                            </tr>
                                            <tr>
                                                <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前48小时（不含）至4小时（含）之间</td>
                                                <td class="tb2 tbc" style="font-size: 11px; color: white;">70%</td>
                                                <td class="tb2 tbc" style="font-size: 11px; color: white;">50%</td>
                                            </tr>
                                            <tr>
                                                <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前4小时（含）后</td>
                                                <td class="tbc" style="font-size: 11px; color: white;">90%</td>
                                                <td class="tbc" style="font-size: 11px; color: white;">70%</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="font-size: 11px;">
                                        <p style="margin: 0px; height: 20px;">
                                            注：以上为自愿退票、变更费用标准，仅供参考，以实际情况为准；退票、变更费</p>
                                        <p style="margin: 0px; height: 20px;">用比例以实际票面价为基数；改期需补齐票面差价。</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dp43">
                            <span class="m">¥</span>
                            <strong style="color: rgb(240, 136, 56); font-size: 17px;">
                                <%=fightShipping.getSsPrice().intValue()%>
                            </strong>
                        </div>
                        <div class="dp44">累计3412厦航积分</div>
                        <a href="#">
                            <div class="dp45">预定</div>
                        </a>
                        <div class="dp46">
                            <span>仅剩<%=ticketNum%>张</span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="dpb">
								<span class="dpp">
									更多舱位及价格
									<div class="icon2"></div>
								</span>
                        <div class="hid">
                            <div class="dp4">
                                <div class="dp41">
                                    商务舱（C）
                                </div>
                                <div class="dp42">
                                    行李|退改规则
                                    <div class="q">
                                        <div class="alert" style="width:400px;">
                                            <div>
                                                <div style="color: rgb(89, 151, 204);">行李限额</div>
                                                <table class="t1">
                                                    <tr>
                                                        <td style="color: rgb(133, 137, 145);" class="td1">厦门-北京</td>
                                                        <td class="td1">
                                                            <p style="margin: 0px; height: 20px; color: white; margin-top: 5px;">免费托运行李额20公斤</p>
                                                            <p style="margin: 0px; height: 23px; color: white;">
                                                                注：仅供参考，以实际情况为准。超额行李可通过购买预付费行李。</p>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div>
                                                <div style="color: rgb(89, 151, 204);">退改规则</div>
                                            </div>
                                            <div>
                                                <table class="t2">
                                                    <tr>
                                                        <th class="tb2"><strong style="font-size: 11px; color: white; line-height: 30px;"> 退改时间点 </strong></th>
                                                        <th class="tb2"><strong style="font-size: 11px; color: white; "> 自愿退票手续费率&nbsp;&nbsp;&nbsp;&nbsp;</strong></th>
                                                        <th class="tb2"><strong style="font-size: 11px; color: white;"> 自愿变更手续费率 </strong></th>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前7天（含）前</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">15%</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">10%</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前7天（不含）至48小时（含）之间</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">40%</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">30%</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前48小时（不含）至4小时（含）之间</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">70%</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">50%</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前4小时（含）后</td>
                                                        <td class="tbc" style="font-size: 11px; color: white;">90%</td>
                                                        <td class="tbc" style="font-size: 11px; color: white;">70%</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="font-size: 11px;">
                                                <p style="margin: 0px; height: 20px;">
                                                    注：以上为自愿退票、变更费用标准，仅供参考，以实际情况为准；退票、变更费</p>
                                                <p style="margin: 0px; height: 20px;">用比例以实际票面价为基数；改期需补齐票面差价。</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dp43">
                                    <span class="m">¥</span>
                                    <strong style="color: rgb(240, 136, 56); font-size: 17px;">5120</strong>
                                </div>
                                <div class="dp44">累计6872厦航积分</div>
                                <a href="#">
                                    <div class="dp45">预定</div>
                                </a>
                                <div class="dp46">
                                    <span>仅剩8张</span>
                                </div>
                            </div>
                            <div class="dp4">
                                <div class="dp41">
                                    商务舱（J）
                                </div>
                                <div class="dp42">
                                    行李|退改规则
                                    <div class="q">
                                        <div class="alert" style="width:400px;">
                                            <div>
                                                <div style="color: rgb(89, 151, 204);">行李限额</div>
                                                <table class="t1">
                                                    <tr>
                                                        <td style="color: rgb(133, 137, 145);" class="td1">厦门-北京</td>
                                                        <td class="td1">
                                                            <p style="margin: 0px; height: 20px; color: white; margin-top: 5px;">免费托运行李额20公斤</p>
                                                            <p style="margin: 0px; height: 23px; color: white;">
                                                                注：仅供参考，以实际情况为准。超额行李可通过购买预付费行李。</p>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div>
                                                <div style="color: rgb(89, 151, 204);">退改规则</div>
                                            </div>
                                            <div>
                                                <table class="t2">
                                                    <tr>
                                                        <th class="tb2"><strong style="font-size: 11px; color: white; line-height: 30px;"> 退改时间点 </strong></th>
                                                        <th class="tb2"><strong style="font-size: 11px; color: white; "> 自愿退票手续费率&nbsp;&nbsp;&nbsp;&nbsp;</strong></th>
                                                        <th class="tb2"><strong style="font-size: 11px; color: white;"> 自愿变更手续费率 </strong></th>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前7天（含）前</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">15%</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">10%</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前7天（不含）至48小时（含）之间</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">40%</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">30%</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前48小时（不含）至4小时（含）之间</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">70%</td>
                                                        <td class="tb2 tbc" style="font-size: 11px; color: white;">50%</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tb2" style="font-size: 11px; color: white; line-height: 30px;">起飞前4小时（含）后</td>
                                                        <td class="tbc" style="font-size: 11px; color: white;">90%</td>
                                                        <td class="tbc" style="font-size: 11px; color: white;">70%</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="font-size: 11px;">
                                                <p style="margin: 0px; height: 20px;">
                                                    注：以上为自愿退票、变更费用标准，仅供参考，以实际情况为准；退票、变更费</p>
                                                <p style="margin: 0px; height: 20px;">用比例以实际票面价为基数；改期需补齐票面差价。</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dp43">
                                    <span class="m">¥</span>
                                    <strong style="color: rgb(240, 136, 56); font-size: 17px;">7400</strong>
                                </div>
                                <div class="dp44">累计6360厦航积分</div>
                                <a href="#">
                                    <div class="dp45">预定</div>
                                </a>
                                <div class="dp46">
                                    <span>余票充足</span>
                                </div>
                            </div>
                            <div class="dbt">
                                更多舱位及价格
                                <div class="icon3"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%
                }
                if(fights.size() == 0){
            %>
            <div class="noFight">
                <div class="icon4"></div>
                <div class="words">
                    <div style="color: rgb(45,65,104); font-size: 19px;">非常抱歉，没有您所需的航班！</div>
                    <div style="color: rgb(82,105,148); font-size: 12px; margin-top: 10px;">
                        您所选择的日期当天暂时没有航班，您可以选择相邻的日期或航线重新查询，谢谢。
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>

    </div>
    <div class="show1">
        <div class="aboutUs">
            <div class="fucku">
                <div class="title">关于厦航</div>
                <div class="blists">
                    <div class="itt">厦航简介</div>
                    <div class="itt">企业理想和社会责任</div>
                    <div class="itt">信息公开</div>
                    <div class="itt">天合联盟</div>
                    <div class="itt">加入我们</div>
                    <div class="itt">网站地图</div>
                    <div class="itt">企业商旅</div>
                    <div class="itt">新闻公告</div>
                    <div class="itt">业务公告</div>
                    <div class="itt">采购公告</div>
                    <div class="itt">责任声明</div>
                    <div class="itt">隐私通知</div>
                    <div class="itt">最帅鹏鹏</div>
                </div>
                <div class="title">货运服务</div>
                <div class="blists" style="height: 28px;">
                    <div class="itt">货单查询</div>
                    <div class="itt">服务介绍</div>
                    <div class="itt">运价查询</div>
                    <div class="itt">货运代理</div>
                    <div class="itt">货运电话</div>
                    <div class="itt">服务条款条规</div>
                    <div class="itt">鹏鹏最帅</div>
                </div>
                <div class="title">友情链接</div>
                <div class="blists" style="height: 28px;">
                    <div class="itt">大中华携手飞</div>
                    <div class="itt">厦航酒店</div>
                    <div class="itt">厦航国际旅行社</div>
                    <div class="itt">代理天地</div>
                    <div class="itt">友情链接</div>
                    <div class="itt">添加联盟官网</div>
                    <div class="icon6"></div>
                </div>
                <div class="title">度假灵感</div>
                <div class="blists">
                    <div class="itt">从国内出发</div>
                    <div class="itt">飞往美国</div>
                    <div class="itt">飞往泰国</div>
                    <div class="itt">飞往韩国</div>
                    <div class="itt">飞往澳大利亚</div>
                    <div class="itt">飞往亚特兰蒂斯</div>
                    <div class="itt">鹏鹏牛皮</div>
                </div>
            </div>
        </div>
    </div>
    <div class="conUs">
        <div style="margin: 0 auto; width: 1000px; height: 58px;">
            <div class="phone1">
                95557
                <div style="font-size: 11px; text-align: center; margin-top: 5px;  color: rgb(125,136,156);">服务热线</div>
            </div>
            <div class="phone1">
                86-592-2226666
                <div style="font-size: 11px; text-align: center; margin-top: 5px;  color: rgb(125,136,156);">境外请拨</div>
            </div>
            <div class="email1">
                2206797141@QQ.COM
                <div style="font-size: 11px; text-align: center; margin-top: 5px;  color: rgb(125,136,156);">E-mail
                </div>
            </div>
        </div>
    </div>
    <div class="bott">
        Copyright © 2019 厦门航空有限公司版权所有2008-2019
        <span style="margin-left: 20px;">中国厦门市埭辽路22号</span>
        <div style="float: right;">
            <span style="margin-right: 15px;">闽ICP备：06000856号</span>
            <span style="float: right; color: rgb(124,128,138);">闽公网安备 35020602000793号</span>
            <div class="icon7"></div>
        </div>
    </div>
</div>
</body>
</html>

