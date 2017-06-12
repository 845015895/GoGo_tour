window.onload = function(){
	var oLi_login = document.getElementById('li_login');
	var oLi_regist = document.getElementById('li_regist');
	var oDiv_login = document.getElementById('login_content');
	var oDiv_regist = document.getElementById('regist_content');
	var oDiv_ad = document.getElementById('ad');

	var type = GetQueryString("type");
	if (type === "login") {
	    oDiv_login.style.display = 'block';
	    oLi_login.className = 'active';
	    oDiv_regist.style.display = 'none';
	    oLi_regist.className = '';
	    oDiv_ad.style.backgroundImage = "url('img/timg.gif') ";
	} else if (type === "regist") {
	    oDiv_regist.style.display = 'block';
	    oLi_regist.className = 'active';
	    oDiv_login.style.display = 'none';
	    oLi_login.className = '';
	    oDiv_ad.style.backgroundImage = "url('img/timg1.gif')";
	}

	oLi_login.onclick = function(){
		oDiv_login.style.display = 'block';
		oLi_login.className = 'active';
		oDiv_regist.style.display = 'none';
		oLi_regist.className = '';
		oDiv_ad.style.backgroundImage="url('img/timg.gif') " ;
	
	}
	oLi_regist.onclick = function(){
		oDiv_regist.style.display = 'block';
		oLi_regist.className = 'active';
		oDiv_login.style.display = 'none';
		oLi_login.className = '';
		oDiv_ad.style.backgroundImage="url('img/timg1.gif')";

	}

	RegTip();

}
function LoginTip() {
    var tip = document.getElementById("LoginTip").innerText;
    var cbFlag = "";
    var username = document.getElementById("userId").value;
    var password = document.getElementById("pwdId").value;
    var drag_text = document.getElementById("drag_text").innerHTML;
    if (username === "") {
        tip = "请输入用户名！";
    } else if (password === "") {
        tip = "请输入密码！";
    } else if (drag_text !== "验证通过") {
        tip = "请通过验证拖动！"
    } else {
        tip = "登录中...";
        cbFlag = "LCB|" + username + "|" + password;
    }
    document.getElementById("LoginTip").innerText = tip;

    if (cbFlag !== "") {
        var cb = new mAjax(cbFlag);
        cb.callback(function (e) {
            var tip = '';
           
                if (e === "LOK") {
                    tip = '登陆成功，跳转中...';
                    if (username === "admin") {
                        window.top.location.href = 'management.aspx';
                    } else {

                        window.top.location.href = 'index.aspx';
                    }
                }
                else if (e === "NoUser") {
                    tip = '用户名不存在';
                }
                else if (e === "PWDError") {
                    tip = '密码错误';
                }
                else {
                    tip = e;
                }
                document.getElementById("LoginTip").innerText = tip;
            
        });
    }
    return;

}
function RegTip() {
    var ip_username = document.getElementById("reg_userId");
    var ip_viewname = document.getElementById("reg_viewName");
    var ip_pwd = document.getElementById("reg_pwdId");
    var ip_confirm_pwd = document.getElementById("confirm_pwdId");
    var ip_yanzheng = document.getElementById("reg_yanzhengId");
    var RegTip = document.getElementById("RegTip");
    var reg_btn = document.getElementById("reg_button");
    var re1 = /^1\d{10}$/;//判断手机号
    var re2 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;//判断邮箱


    ip_username.onblur = function () {
        //用户名合法性
        if (this.value === "admin") {
            RegTip.innerText = "管理员注册";
        }else if (ip_viewname.value === "") {
            RegTip.innerText = "请输入显示名";
        } else if (!(re1.test(this.value) || re2.test(this.value))) {
            RegTip.innerText = "用户名不合法";
        } else {
            RegTip.innerText = "";
        }
    }

    ip_viewname.onblur = function () {
        //显示名合法性
        if (ip_viewname.value === "") {
            RegTip.innerText = "请输入显示名";
        } else {
            RegTip.innerText = "";
        }
    }    

    ip_pwd.onblur = function () {
        //密码合法性
        pwd_length = getLength(ip_pwd.value);
        if (ip_pwd.value === "") {
            RegTip.innerText = "请输入密码";
        } else if (pwd_length < 5) {
            RegTip.innerText = "密码长度小于5";
        } else if (pwd_length > 15) {
            RegTip.innerText = "密码长度大于15";
        } else {
            RegTip.innerText = "";
        }

    }
    //确认密码
    ip_confirm_pwd.onblur = function () {
        //用户名合法性
        if (ip_confirm_pwd.value === "") {
            RegTip.innerText = "请确认密码";
        } else if (ip_confirm_pwd.value !== ip_pwd.value) {
            RegTip.innerText = "两次密码输入不匹配";
        } else {
            RegTip.innerText = "";
        }
    }
    var code = 9999;

    function codes() {

        var ranColor = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); //随机生成颜色
        // alert(ranColor)
        var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6);
        var num1 = Math.floor(Math.random() * 100);
        var num2 = Math.floor(Math.random() * 100);
        code = num1 + num2;

        var code_show = document.getElementById("code");
        code_show.innerHTML = num1 + "+" + num2 + "=?";
        if (code_show.className === "nocode") {
            code_show.className === "code";
        }
        code_show.style.backgroundColor = ranColor;
        code_show.style.color = ranColor2;

        //$("#code").html(num1 + "+" + num2 + "=?");  
        //if ($("#code").hasClass("nocode")) {  
        //    $("#code").removeClass("nocode");  
        //    $("#code").addClass("code"); 

        //}  
        //$("#code").css('background',ranColor);
        //$("#code").css('color',ranColor2);

    }
    codes();
    
    $("#code").on('click', codes)

    ip_yanzheng.onblur = function () {
        if (ip_yanzheng.value == code && code != 9999) {
            RegTip.innerText = "验证成功"
            reg_btn.disabled = false;
        } else {
            RegTip.innerText = "验证有误"
        }

    }

    //$("#reg_yanzhengId").onblur(function () {
    //    if ($(".input").val() == code && code != 9999) {
    //        $("#RegTip").html = "";
    //    } else {
    //        $("#RegTip").html = "输入有误!";

    //    }
    //});

  
    function getLength(str) {
        return str.replace(/[^\x00-xff]/g, "xx").length;
    }

    

}

function BindEnter() {
    if (event.keyCode == 13) {
        document.getElementById("ip_btn_login").click();
    }
}


/*取地址栏参数*/
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}


/*注册验证码*/

//function check_codes() {  
//    var code = 9999; 
//    function codes(){
    	
//        var ranColor = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); //随机生成颜色
//        // alert(ranColor)
//        var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); 
//        var num1 = Math.floor(Math.random() * 100);  
//        var num2 = Math.floor(Math.random() * 100);  
//        code = num1 + num2;  
       
//        var code_show = document.getElementById("code");
//        code_show.innerHTML = num1 + "+" + num2 + "=?";
//        if (code_show.className === "nocode") {
//            code_show.className === "code";
//        }
//        code_show.style.backgroundColor = ranColor;
//        code_show.style.color = ranColor2;

//        //$("#code").html(num1 + "+" + num2 + "=?");  
//        //if ($("#code").hasClass("nocode")) {  
//        //    $("#code").removeClass("nocode");  
//        //    $("#code").addClass("code"); 
           
//        //}  
//        //$("#code").css('background',ranColor);
//        //$("#code").css('color',ranColor2);

//    }
//    codes();
    
//    $("#code").on('click',codes)
      
//    $("#reg_yanzhengId").onblur(function () {
//        if ($(".input").val() == code && code != 9999) {  
//            $("#RegTip").html = "";
//        } else {
//            $("#RegTip").html = "输入有误!";
 
//        }  
//    });  
//}

