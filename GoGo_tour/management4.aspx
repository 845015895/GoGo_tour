<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management4.aspx.cs" Inherits="GoGo_tour.management4" %>

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
                <li><a href="management1.aspx">查看用户</a></li>
                <li><a href="management2.aspx">修改用户</a></li>
                <li><a href="management3.aspx">查看景点</a></li>
                <li class="active"><a href="management4.aspx">修改景点</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
                <li><a href="#">空白</a></li>
            </ul>
        </nav>
        <div id="ifram">
           <h2>查看景点</h2>
             <asp:GridView ID="tour_info_grid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="30px" Width="100%" ForeColor="Black" HorizontalAlign="Center" OnRowEditing="tour_info_grid_RowEditing" AllowPaging="True">
               <Columns>
                   <asp:BoundField DataField="id" HeaderText="序号" ReadOnly="True" SortExpression="id" >
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="name" HeaderText="景点名" SortExpression="name" >
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="rank" HeaderText="评分" SortExpression="rank" >
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="newPrice" HeaderText="当前价格" SortExpression="newPrice" >
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="oldPrice" HeaderText="原始价格" SortExpression="oldPrice" >
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="img" HeaderText="图片地址" SortExpression="img">
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:CommandField HeaderText="操作" ShowEditButton="True" ShowDeleteButton="True">
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
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tour_info]" DeleteCommand="DELETE FROM [tour_info] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_info] ([id], [name], [rank], [newPrice], [oldPrice], [img]) VALUES (@id, @name, @rank, @newPrice, @oldPrice, @img)" UpdateCommand="UPDATE [tour_info] SET [name] = @name, [rank] = @rank, [newPrice] = @newPrice, [oldPrice] = @oldPrice, [img] = @img WHERE [id] = @id">
                   <DeleteParameters>
                       <asp:Parameter Name="id" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="id" Type="Int32" />
                       <asp:Parameter Name="name" Type="String" />
                       <asp:Parameter Name="rank" Type="String" />
                       <asp:Parameter Name="newPrice" Type="Int32" />
                       <asp:Parameter Name="oldPrice" Type="Int32" />
                       <asp:Parameter Name="img" Type="String" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="name" Type="String" />
                       <asp:Parameter Name="rank" Type="String" />
                       <asp:Parameter Name="newPrice" Type="Int32" />
                       <asp:Parameter Name="oldPrice" Type="Int32" />
                       <asp:Parameter Name="img" Type="String" />
                       <asp:Parameter Name="id" Type="Int32" />
                   </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </main>
    <footer>@版权所属 易子程</footer>
    </form>
</body>
</html>
