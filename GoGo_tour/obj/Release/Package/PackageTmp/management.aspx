<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management.aspx.cs" Inherits="GoGo_tour.management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理</title>
     <link rel="stylesheet" type="text/css" href="css/management.css" />
</head>
<body>
    <header>
        <span id="logo"><img src="img/logoko1.png"/></span>
        <h1>勾勾网后台管理系统</h1>
        <span id="head_right" runat="server"></span>
    </header>
    <main>
        <nav>
            <div id="nav_title">导航菜单</div>
            <ul>
                <li class="active"><a href="management.aspx" >首页</a></li>
                <li><a href="management1.aspx">查看用户</a></li>
                <li><a href="management2.aspx">修改用户</a></li>
                <li><a href="management3.aspx">查看景点</a></li>
                <li><a href="management4.aspx">修改景点</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
            </ul>
        </nav>
        <div id="ifram">
            <div id="main_show">
                <div id="welcome_logo">HELLO</div>
                <span id="welcome_slogen">欢迎使用勾勾网后台管理系统！</span>
            </div>
        </div>
    </main>
    <footer>@版权所属 易子程</footer>
</body>
</html>
