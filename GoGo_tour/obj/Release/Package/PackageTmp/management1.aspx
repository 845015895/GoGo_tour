<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management1.aspx.cs" Inherits="GoGo_tour.management1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理</title>
     <link rel="stylesheet" type="text/css" href="css/management.css" />
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <span id="logo"><img src="img/logoko1.png"/></span>
        <h1>勾勾网后台管理系统</h1>
        <span id="head_right" runat="server"></span>
    </header>
    <main>
        <nav>
            <div id="nav_title">导航菜单</div>
            <ul>
                <li><a href="management.aspx" >首页</a></li>
                <li class="active"><a href="management1.aspx">查看用户</a></li>
                <li><a href="management2.aspx">修改用户</a></li>
                <li><a href="management3.aspx">查看景点</a></li>
                <li><a href="management4.aspx">修改景点</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
            </ul>
        </nav>
        <div id="ifram">
            <h2>查看用户
            </h2>
            <div><asp:Label ID="find_lb" runat="server" Text="请输入要查找的用户名"></asp:Label>
            <asp:TextBox ID="find_tb" runat="server"></asp:TextBox>
            <asp:Button ID="find_btn" runat="server" Text="查找" OnClick="find_btn_Click" /></div>
            
            <asp:GridView CssClass="user_grid" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="16px" Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="用户名" SortExpression="userName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="viewName" HeaderText="显示名" SortExpression="viewName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userName], [password], [viewName] FROM [tour_user]"></asp:SqlDataSource>
        </div>
    </main>
    <footer>@版权所属 易子程</footer>
    
    </form>
    
</body>
</html>
