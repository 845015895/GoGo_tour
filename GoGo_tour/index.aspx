<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GoGo_tour.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>勾勾网--gogo!</title>
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    
    <script src="js/index_digit.js"></script>
    <script src="js/index_clock.js"></script>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.min.js"></script>


</head>
<body>
    <form id="form1" runat="server">
    <div class="head_div">
        <!-- 在此处写一个登录注册跳转链接-->
      <%--  <%if (Session["ViewName"] == null)
          { %>
        <span id="head_left" >欢迎来到勾勾旅游网，请 <a href="login.aspx">登录</a> | <a href="#">注册</a> 吧！</span>
        <% }
          else 
          {%>
        <span id="head_left">欢迎来到勾勾旅游网，<%=Session["ViewName"] %>   <a href="index.aspx" onclick="<%Session["ViewName"] = null;%>">退出</a></span>
        <% }%>--%>

          <span id="head_left" runat="server"></span>
        <span id="head_right"><a href="#">我的订单</a> | <a href="#">我的收藏</a> | <a href="#">个人中心</a> | <a href="#">客服中心</a></span>
        

    </div>
    <!--包含logo的板块-->
    <div id="ad_tip">
        <marquee>  重磅消息:本月旅游门票大折扣，买到就是赚到，心动不如行动!</marquee>
    </div>
    <div class="logo_div">
        <div id="nav_bar">

            <div id="nav_bar_sec">
                <div id="logo_img"></div>
                <ul>
                    <li><a>首页</a></li>
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

        <div id="logo_right">
            <div id="search_bar">
                <p id="search_tip">Don't fear the unknown</p>
                <input type="text" id="search_input" placeholder="我想找..." runat="server"/>
                <ul id="city_tip">
                    <li><a>成都</a></li>
                    <li><a>重庆</a></li>
                    <li><a>北京</a></li>
                    <li><a>上海</a></li>
                </ul>
                <asp:Button ID="search_img" runat="server" onclick="search_img_Click" />

            </div>
        </div>

    </div>
    <!--包含广告的板块-->
    <div id="ad">
        <div id="ad_left">
            <div id="menu">
                <div id="menu_top">当前时间</div>
              <canvas id="canvas" >
               当浏览器不支持canvas时，请更换浏览器重试
              </canvas>
            </div>
            <div id="tab">
                <ul>
                    <li class="active">旅游</li>
                    <li>推荐</li>
                    <li>攻略</li>
                    <li>咨询</li>
                    <li>折扣</li>
                </ul>
                <div id="text">
                    <p>去旅游找“勾勾网</p>
                </div>
            </div>
        </div>
        <div class="ad_div" id="ad_div">
            <!--广告板块中的广告-->
            <span id="arrow_left"><</span>
            <span id="arrow_right">></span>
            <ol>
                <li class="active">1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>

            </ol>
            <ul>
                <li><a href="#" title="">
                    <img src="img/广告一.jpg" alt="广告一"/></a></li>
                <li><a href="#" title="">
                    <img src="img/广告二.jpg" alt="广告二"/></a></li>
                <li><a href="#" title="">
                    <img src="img/广告三.jpg" alt="广告三"/></a></li>
                <li><a href="#" title="">
                    <img src="img/广告四.jpg" alt="广告四"/></a></li>
                <li><a href="#" title="">
                    <img src="img/广告五.jpg" alt="广告五"/></a></li>
            </ul>
        </div>
    </div>
    <div class="main_div3_title">
        <h3>周边旅游</h3>
    </div>
    <div class="main_div3">
       <div id="calendar" class="calendar">
		<ul>
			<li class="active">
				<h2>1</h2>
				<p>JAN</p>
			</li>
			<li>
				<h2>2</h2>
				<p>FER</p>
			</li>
			<li>
				<h2>3</h2>
				<p>MAR</p>
			</li>
			<li>
				<h2>4</h2>
				<p>APR</p>
			</li>
			<li>
				<h2>5</h2>
				<p>MAY</p>
			</li>
			<li>
				<h2>6</h2>
				<p>JUN</p>
			</li>
			<li>
				<h2>7</h2>
				<p>JUL</p>
			</li>
			<li>
				<h2>8</h2>
				<p>AUG</p>
			</li>
			<li>
				<h2>9</h2>
				<p>SEP</p>
			</li>
			<li>
				<h2>10</h2>
				<p>OCT</p>
			</li>
			<li>
				<h2>11</h2>
				<p>NOV</p>
			</li>
			<li>
				<h2>12</h2>
				<p>DEC</p>
			</li>

		</ul>
		<div class="text">
		  <h2>1月活动</h2>
		  <p>九寨沟旅游打折啦</p>
		</div>
	</div>
    <div id="main_div3_right">

        <div id="main_div3_right_top">
            <div id="main_div3_right_ad1" class="main_div3_right_ad">
                <div class="container">
                <img  class="ad1_img" src="img/jiuzhaigou.jpg" id="img_1" runat="server"/>
                <div class="overlay">
                   <div class="add_text" id="add_text1" runat="server">Hello World</div>
                </div>
                    </div>
                <a class="ad_title" href="show_info.aspx?id=1" target="_blank"><h3 id="title_1" runat="server"></h3></a>
                <a class="id_price_new" id="newPrice_1" runat="server"></a><a class="id_price_old" id="oldPrice_1" runat="server"></a>
            </div>
            <div id="main_div3_right_ad2" class="main_div3_right_ad">
                <div class="container">
                <img  class="ad1_img" src="img/emeishan.jpg" id="img_2" runat="server"/>
                <div class="overlay">
                   <div class="add_text" id="add_text2" runat="server">Hello World</div>
                </div>
                    </div>
                <a class="ad_title" href="show_info.aspx?id=2" target="_blank"><h3 id="title_2" runat="server">></h3></a>
                <a class="id_price_new" id="newPrice_2" runat="server"></a><a class="id_price_old" id="oldPrice_2" runat="server"></a>
            </div>
     
        </div>
        <div id="main_div3_right_buttom" class="main_div3_right_ad">
            <div id="main_div3_right_ad3">
                <div class="container">
                <img  class="ad1_img_small" src="img/欢乐谷.jpg" id="img_3" runat="server"/>
                <div class="overlay">
                   <div class="add_text" id="add_text3" runat="server">Hello World</div>
                </div>
                    </div>
                <a class="ad_title" href="show_info.aspx?id=3" target="_blank"><h4 id="title_3" runat="server"></h4></a>
                <a class="id_price_new" id="newPrice_3" runat="server"></a><a class="id_price_old" id="oldPrice_3" runat="server"></a>
            </div>
            <div id="main_div3_right_ad4" class="main_div3_right_ad">
                <div class="container">
                <img  class="ad1_img_small" src="img/青城山.jpg" id="img_4" runat="server"/>
                <div class="overlay">
                   <div class="add_text" id="add_text4" runat="server">青城山下白素贞，洞中千年先学习</div>
                </div>
                    </div>
                <a class="ad_title" href="show_info.aspx?id=4" target="_blank"><h4 id="title_4" runat="server"></h4></a>
                <a class="id_price_new" id="newPrice_4" runat="server"></a><a class="id_price_old" id="oldPrice_4" runat="server"></a>
            </div>
            <div id="main_div3_right_ad5" class="main_div3_right_ad">
                <div class="container">
                <img  class="ad1_img_small" src="img/siguniangshan.jpg" id="img_5" runat="server"/>
                <div class="overlay">
                   <div class="add_text" id="add_text5" runat="server">Hello World</div>
                </div>
                    </div>
                 <a class="ad_title" href="show_info.aspx?id=5" target="_blank"><h4 id="title_5" runat="server"></h4></a>
                <a class="id_price_new" id="newPrice_5" runat="server"></a><a class="id_price_old" id="oldPrice_5" runat="server"></a>
            </div>
        </div>

    </div>
   </div>
   <div class="main_div1_title">
     <h3>出国旅游</h3>
    </div>
    <div class="main_div1">

        <div class="show_div">
            <div class="show_div_img1">
                <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img2">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img3">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img4">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img5">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img6">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img7">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
        <div class="show_div">
            <div class="show_div_img8">  <span class="img_span"><a><泰国曼谷-大城-芭提雅机票+当地5晚6日游></a></span>
            </div>
            <div class="info">
                <span class="price_info"><h3 style="color: red; text-align: left;">￥2028</h3>
						<h5 style="text-align: left; text-decoration: line-through;color:#808080;margin-left:10px;">￥2500</h5></span>
                <span class="opinion_info">
                    满意率:90%
                </span>
            </div>
        </div>
    </div>
   <div id="main_div2">

        <ul>
            <li>
                <img src="img/view1_small.jpg" title="来自世界各地的风景" /></li>
            <li>
                <img src="img/view2_small.jpg" title="来自世界各地的风景" /></li>
            <li>
                <img src="img/view3_small.jpg" title="来自世界各地的风景" /></li>
            <li>
                <img src="img/view4_small.jpg" title="来自世界各地的风景" /></li>
            <li>
                <img src="img/view5_small.jpg" title="来自世界各地的风景" /></li>
        </ul>
   </div>
    <div class="tool-bar">
        <a href="javascript:;" class="tool-bar-item item1"></a>
        <a href="javascript:;" class="tool-bar-item item2"></a>
        <a href="javascript:;" class="tool-bar-item item3"></a>
        <a href="#top" class="tool-bar-item item4"></a>

    </div>

    <div class="foot_div">
        <h4>友情推荐：<a href="https://www.qunar.com/" target="_blank">去哪儿网</a>&nbsp;&nbsp;&nbsp;
            <a href="https://http://www.ctrip.com//" target="_blank">携程网</a>&nbsp;&nbsp;&nbsp;
             <a href="http://www.tuniu.com//" target="_blank">途牛网</a>&nbsp;&nbsp;&nbsp;
            <a href="http://www.mafengwo.cn//" target="_blank">蚂蚁窝</a>&nbsp;&nbsp;&nbsp;
        </h4>
        <h4>@版权所属 易子程</h4>
        <a href =" login.aspx" target ="_blank">后台管理系统</a>
    </div>

    </form>

</body>

</html>
