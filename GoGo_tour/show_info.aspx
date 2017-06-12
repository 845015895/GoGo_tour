<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_info.aspx.cs" Inherits="GoGo_tour.show_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>信息</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KpNp9UibD0ZpPl9C4VYih0yebzBFbhy5"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
    <script type="text/javascript" src="js/show_info.js"></script>
    <link rel="stylesheet" type="text/css" href="css/show_info.css" />
</head>
<body>
    <div id="nav_bar">
        <div id="nav_bar_sec">
            <div id="logo_img"></div>
            <ul>
                <li><a href="index.aspx">首页</a></li>
                <li><a>景点</a></li>
                <li><a>门票</a></li>
                <li><a>酒店</a></li>
                <li><a>出行</a></li>
                <li><a>海外</a></li>
                <li><a>团购</a></li>

                <li><a>度假</a></li>
            </ul>
        </div>

    </div>
    <div id="show_main">
        <img id="show_img" src="" runat="server"/>
        <div id="show_content">
            <p id="content_title" runat="server"></p>
            <p id="content_msg" runat="server"></p>
            <p id="cotent_add" runat="server"><b id="now_addr" runat="server"></b></p>
            <p id="conten_rank" >评&nbsp;&nbsp;&nbsp;分：<strong id="now_rank" runat="server"></strong>/5分</p>
            <div id="content_price">
                <span id="now_price">￥<b id="now_price_text" runat="server"></b></span>起<s id="old_price" runat="server"></s>元<input id="order_btn" type="button" value="立刻预订"/>
            </div>
        </div>

    </div>
    <div id="show_info">
        <div id="show_info_title">&nbsp;&nbsp;&nbsp;&nbsp;景点简介</div>
        <p id="show_info_msg" runat="server"></p>


    </div>
    <div id="allmap">   
    </div>
</body>
</html>
