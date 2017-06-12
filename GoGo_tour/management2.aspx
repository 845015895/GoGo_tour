<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management2.aspx.cs" Inherits="GoGo_tour.management2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理</title>
     <link rel="stylesheet" type="text/css" href="css/management.css" />
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
    </style>
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
                <li><a href="management1.aspx">查看用户</a></li>
                <li class="active"><a href="management2.aspx">修改用户</a></li>
                <li><a href="management3.aspx">查看景点</a></li>
                 <li><a href="management4.aspx">修改景点</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
            </ul>
        </nav>
        <div id="ifram">
            <h2>修改用户</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting" Width="100%" DataKeyNames="userName" DataSourceID="SqlDataSource1" AllowPaging="True" OnRowEditing="GridView1_RowEditing" PageSize="6">
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="用户名" ReadOnly="True" SortExpression="userName" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="viewName" HeaderText="显示名" SortExpression="viewName" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userName], [password], [viewName] FROM [tour_user]" DeleteCommand="DELETE FROM [tour_user] WHERE [userName] = @userName" InsertCommand="INSERT INTO [tour_user] ([userName], [password], [viewName]) VALUES (@userName, @password, @viewName)" UpdateCommand="UPDATE [tour_user] SET [password] = @password, [viewName] = @viewName WHERE [userName] = @userName">
                    <DeleteParameters>
                        <asp:Parameter Name="userName" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="userName" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="viewName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="viewName" Type="String" />
                        <asp:Parameter Name="userName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
             
            <div class="add_div">
                <h4>添加用户</h4>
                  <table class="add_tb">
           
                      <tr>
                        <td>用户名：</td>
                        <td>
                            <asp:TextBox ID="add_username_tb" runat="server"></asp:TextBox>
                        </td>
                    </tr>
    
                    <tr>
                        <td>密 码：</td>
                        <td>
                            <asp:TextBox ID="add_pwd_tb" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>显示名：</td>
                        <td>
                            <asp:TextBox ID="add_viewname_tb" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="add_msg" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="添加用户" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
           
        </div>
    </main>
    <footer>@版权所属 易子程</footer>
    
    </form>
    
</body>
</html>
