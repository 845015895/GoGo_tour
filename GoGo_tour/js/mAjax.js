//使用说明:
//var m=new mAjax;先new一个对象
//可以设置对象的属性
//调用m.callback(func);可选属性为回调函数
//可以通过function func(e){alert(e);};可以设置参数获取callback返回值

function mAjax(text) {
    if (text!==null) { this.text = text } else { this.text = ''; }
    this.sendType = 'post';
    this.url = window.location.href;
    this.result = null;
    this.callback = function (func) { if (typeof func!=='function') { func = null; } _sendMessage(this.sendType, this.url, this.text, func); };
    
}
function _sendMessage(sendType, url, text,cb) {
    //创建XMLHttpRequest对象
    var XMLHttp = null;
    if (window.ActiveXObject) {//ie浏览器
        XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest) {//其他浏览器
        XMLHttp = new XMLHttpRequest();
    }
    //配置XMLHttpRequest对象
    XMLHttp.open(sendType, url + "?rand=" + Math.random(), true);

    

    //设置参数
    var params = "call=getMess&text=" + text;

    //设置头部
    XMLHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    XMLHttp.setRequestHeader("Content-length", params.length);

    //发送请求 
    XMLHttp.send(params);
    
    //设置回调函数
    XMLHttp.onreadystatechange = function () {
        if (XMLHttp.readyState === 4 && XMLHttp.status === 200) {//收到完整的HTTP响应并且HTTP状态代码为200
            if(cb!==null) cb(XMLHttp.responseText);
        }
    };
}