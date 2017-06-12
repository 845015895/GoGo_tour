<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GoGo_tour.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<link href="css/drag.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/drag.js" type="text/javascript"></script>
<script type="text/javascript" defer src="js/login.js"></script>
<script type="text/javascript" defer src="js/mAjax.js"></script>
<body>
    <form id="form1" runat="server">
        <div id="title">

            <a href="index.aspx">
                <img src="img/logoko.png" /></a>

        </div>

        <div id="main">
            <div id="ad"></div>
            <div id="login">
                <div id="login_title">
                    <ul>
                        <li id="li_login" class="active">登录</li>
                        <li id="li_regist">注册</li>
                    </ul>
                </div>

                <div id="login_content">
                    <label class="lb col1 row1">用户名：</label>
                    <input type="text" class=" ipt col2 row1" placeholder="请输入手机号或邮箱号" id="userId" onkeypress="BindEnter();">

                    <label class="lb col1 row2">密&nbsp&nbsp&nbsp码：</label>
                    <input type="password" class=" ipt col2 row2" placeholder="请输入密码" id="pwdId" onkeypress="BindEnter();">
                    <div id="drag" class="lb col1 row3"></div>
                    <script type="text/javascript">
                        $('#drag').drag();
                    </script>
                    <%--				<label class="lb col1 row3">验证码：</label>
				<input type="text" class=" ipt_check col2 row3" placeholder="验证码" id="yanzhengId" onkeypress="BindEnter();">
				<input type="button" value="验证码" class="ipt_check col4 row3">--%>

                    <input type="checkbox" class=" ip_check col2 row4">



                    <label class="lb_remember col3 row4">记住密码</label>
                    <a href="#" class="a_forget col4 row4">忘记密码？</a>

                    <label id="LoginTip"></label>

                    <input type="button" id="ip_btn_login" class="ip_btn_login col2 row5" value="登录" onclick="LoginTip()" />
                </div>
                <div id="regist_content">
                    <label class="lb col1 reg_row1">用户名：</label>
                    <input type="text" class=" ipt col2 reg_row1" placeholder="请输入手机号或邮箱号" id="reg_userId" runat="server">
                    <label class="lb col1 reg_row2">显示名：</label>
                    <input type="text" class=" ipt col2 reg_row2" placeholder="请输入显示名" id="reg_viewName" runat="server">
                    <label class="lb col1 reg_row3">密&nbsp&nbsp&nbsp码：</label>
                    <input type="password" class=" ipt col2 reg_row3" placeholder="密码长度为15位以内" id="reg_pwdId" runat="server">
                    <label class="lb col1 reg_row4">确认密码：</label>
                    <input type="password" class=" ipt col2 reg_row4" placeholder="请确认密码" id="confirm_pwdId" runat="server">
                    <label class="lb col1 reg_row5">验证码：</label>
                    <input type="text" class=" ipt_check col2 reg_row5 input"" placeholder="验证码" id="reg_yanzhengId" >
                    <span id="code" class="nocode ipt_check col4 reg_row5">验证码</span>
                    <label id="RegTip" runat="server"></label>
                    <asp:Button ID="reg_button"  CssClass="ip_btn_login col2 reg_row6" runat="server"  OnClick="reg_button_Click" Text="注册" disabled="true"/>
                    <%--<input type="button" class="ip_btn_login col2 reg_row6" value="注册"   onclick="" runat="server">--%>
                </div>
            </div>

        </div>

    </form>
</body>
</html>

