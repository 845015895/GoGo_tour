window.onload = function () {
    ad_scroll();
    scroll();
    nav();
    tab();
    clock();
    canlendar();

}


    /*无缝滚动*/
    function scroll() {
        var scroll_speed = 2;
        var speed = 30;
        var oDiv = document.getElementById("main_div2");
        var oUl = oDiv.getElementsByTagName("ul")[0];
        var aLi = oUl.getElementsByTagName("li");
        var str = oUl.innerHTML + oUl.innerHTML;
        oUl.innerHTML = str;
        oUl.style.width = aLi[0].offsetWidth * aLi.length + 'px';
        function DoScroll() {
            /*
        当ul距离左边距的值(滚出边界为负数)小于等于ul长度的1/2（加了个符号以便对比）
        即第一整块完全通过马上接入后面，形成无缝滚动
         */
            if (oUl.offsetLeft <= -oUl.offsetWidth / 2) {
                oUl.style.left = '0';
            }

            oUl.style.left = oUl.offsetLeft - scroll_speed + 'px';
        }
        var MyInterval = setInterval(DoScroll, speed);
        oUl.onmouseover = function () {
            clearInterval(MyInterval);
            oUl.style.cursor = 'pointer';
        }
        oUl.onmouseout = function () {
            MyInterval = setInterval(DoScroll, speed);
        }
    }

    /*
    导航栏事件
    */
    function nav() {
        var oDiv1 = document.getElementById("nav_bar"),
            oDiv2 = document.getElementById("nav_bar_sec"),
            oDiv3 = document.getElementById("logo_img"),
            aUl = oDiv2.getElementsByTagName("ul");
        oDiv1.onmouseover = function () {
            oDiv1.className = "nav_bar";
            oDiv3.style.backgroundImage = 'url(../img/logoko1.png)';
            aUl[0].style.color = "#000";
        }
        oDiv1.onmouseout = function () {
            oDiv1.className = "";
            oDiv3.style.backgroundImage = 'url(../img/logoko_white.png)';
            aUl[0].style.color = "#fff";
        }
    }

    /*广告轮播*/
    function ad_scroll() {

       
        var oDiv = document.getElementById("ad_div");
        var aBtn = oDiv.getElementsByTagName("ol")[0].getElementsByTagName("li");
        var oUl = oDiv.getElementsByTagName("ul")[0];
        var arrow_left = document.getElementById('arrow_left');
        var arrow_right = document.getElementById('arrow_right');


        var now = 0;
        var speed_fir = -700;

        arrow_left.onclick = function () {
            now--;
            if (now < 0) {
                now = aBtn.length - 1;
            }
            tab();
        };
        arrow_right.onclick = function () {
            now++;
            if (now == aBtn.length) {
                now = 0;
            }
            tab();
        };

        for (var i = 0; i < aBtn.length; i++) {
            aBtn[i].index = i;
            aBtn[i].onclick = function () {
                now = this.index;

                tab();
            };
        }

        function tab() {
            for (var i = 0; i < aBtn.length; i++) {
                aBtn[i].className = '';
            }
            aBtn[now].className = 'active';
            oUl.style.left = speed_fir * now + 'px';
        }

        function next() {
            now++;
            if (now == aBtn.length) {
                now = 0;
            }

            tab();
        }

        var timer = setInterval(next, 3000);

        oDiv.onmouseover = function () {
            clearInterval(timer);
        };

        oDiv.onmouseout = function () {
            timer = setInterval(next, 3000);
        };
        arrow_left.onmouseover = function () {
            arrow_left.style.opacity = 0.5;
        };
     
        arrow_left.onmouseout = function () {
            arrow_left.style.opacity = 0;
        };

        arrow_right.onmouseover = function () {
            arrow_right.style.opacity = 0.5;
        };

        arrow_right.onmouseout = function () {
            arrow_right.style.opacity = 0;
        };


    }

    /*选项卡*/
    function tab() {
        var arr = [
		'去旅游找“勾勾网”',
		'在 “勾勾网”有旅游大神向你推荐最有用的旅游计划',
		'想要找到省钱的旅游攻略吗，来“勾勾网”吧',
		'在这里欢迎咨询',
		'大大的折扣尽在“勾勾网”'
        ];
        var oDiv = document.getElementById('tab');
        var aLi = oDiv.getElementsByTagName('li');
        var oText = oDiv.getElementsByTagName('div')[0];
        var index = 0;

        for (var i = 0; i < aLi.length; i++) {
            aLi[i].index = i;
            aLi[i].onmouseover = function () {
                for (var i = 0; i < aLi.length; i++) {
                    aLi[i].className = "";
                }
                this.className = "active";
                oText.innerHTML = '<p>' + arr[this.index] + '</p>';


            }
        }

        function tab_scroll() {
            for (var i = 0; i < aLi.length; i++) {
                aLi[i].className = "";
            }
            aLi[index].className = "active";
            oText.innerHTML = '<p>' + arr[index] + '</p>';
        }
        function tab_next() {
            index++;
            if (index == aLi.length) {
                index = 0;
            }

            tab_scroll();
        }

        var timer_interval = setInterval(tab_next, 4000);

        oDiv.onmouseover = function () {
            clearInterval(timer_interval);
        };

        oDiv.onmouseout = function () {
            timer_interval = setInterval(tab_next, 4000);
        };

    }

    //时钟
    function clock() {
        var WINDOW_WIDTH =290;//画布宽
        var WINDOW_HEIGHT = 140;//画布高
        var RADIUS = 1.25;//圆半径
        var MARGIN_TOP = Math.round(WINDOW_HEIGHT/5);
        var MARGIN_LEFT = Math.round(WINDOW_WIDTH/10);;
        var curTime = new Date();//获取时间

        var balls = [];
        const colors = ["#33B5E5","#0099CC","#AA66CC","#9933CC","#99CC00","#669900","#FFBB33","#FF8800","#FF4444","#CC0000"];


        var canvas = document.getElementById("canvas");
        var context = canvas.getContext("2d");

        canvas.width = WINDOW_WIDTH;
        canvas.height = WINDOW_HEIGHT;
        //canvas.drawColor(Color.yellow);

        //     render(context);
        // }

        // curShowTimeSeconds = getCurrentShowTimeSeconds();

        setInterval(function () {
            render(context);
            upadate();
        }, 50);


    }
    // function getCurrentShowTimeSeconds(){
    //     var curTime = new Date();
    //     var ret = endTime.getTime()-curTime.getTime();
    //     ret = Math.round(ret/1000);

    //     return ret >= 0 ? ret : 0;

    // }

    function upadate() {
        var nextTime = new Date();
        var nextHours = nextTime.getHours();
        var nextMinutes = nextTime.getMinutes();
        var nextSeconds = nextTime.getSeconds();

        var curHours = curTime.getHours();
        var curMinutes = curTime.getMinutes();
        var curSeconds = curTime.getSeconds();

        if (nextSeconds != curSeconds) {
            if (parseInt(curHours / 10) != parseInt(nextHours / 10)) {
                addBalls(MARGIN_LEFT + 0, MARGIN_TOP, parseInt(curHours / 10));
            }
            if (parseInt(curHours % 10) != parseInt(nextHours % 10)) {
                addBalls(MARGIN_LEFT + 15 * (RADIUS + 1), MARGIN_TOP, parseInt(curHours / 10));
            }

            if (parseInt(curMinutes / 10) != parseInt(nextMinutes / 10)) {
                addBalls(MARGIN_LEFT + 39 * (RADIUS + 1), MARGIN_TOP, parseInt(curMinutes / 10));
            }
            if (parseInt(curMinutes % 10) != parseInt(nextMinutes % 10)) {
                addBalls(MARGIN_LEFT + 54 * (RADIUS + 1), MARGIN_TOP, parseInt(curMinutes % 10));
            }

            if (parseInt(curSeconds / 10) != parseInt(nextSeconds / 10)) {
                addBalls(MARGIN_LEFT + 78 * (RADIUS + 1), MARGIN_TOP, parseInt(curSeconds / 10));
            }
            if (parseInt(curSeconds % 10) != parseInt(nextSeconds % 10)) {
                addBalls(MARGIN_LEFT + 93 * (RADIUS + 1), MARGIN_TOP, parseInt(nextSeconds % 10));
            }

            curTime = nextTime;
        }
        updateBalls();

    }


    function updateBalls() {

        for (var i = 0 ; i < balls.length ; i++) {

            balls[i].x += balls[i].vx;
            balls[i].y += balls[i].vy;
            balls[i].vy += balls[i].g;

            if (balls[i].y >= WINDOW_HEIGHT - RADIUS) {
                balls[i].y = WINDOW_HEIGHT - RADIUS;
                balls[i].vy = -balls[i].vy * 0.6;
            }
        }
        //优化
        var cnt = 0;
        for (var i = 0 ; i < balls.length ; i++) {
            if (balls[i].x + RADIUS > 0 && balls[i].x - RADIUS < WINDOW_WIDTH) {
                balls[cnt++] = balls[i];
            }
        }

        while (balls.length > cnt) {
            balls.pop();
        }
    }

    function addBalls(x, y, num) {

        for (var i = 0  ; i < digit[num].length ; i++)
            for (var j = 0  ; j < digit[num][i].length ; j++)
                if (digit[num][i][j] == 1) {
                    var aBall = {
                        x: x + j * 2 * (RADIUS + 1) + (RADIUS + 1),
                        y: y + i * 2 * (RADIUS + 1) + (RADIUS + 1),
                        g: 1.5 + Math.random(),
                        vx: Math.pow(-1, Math.ceil(Math.random() * 1000)) * 4,
                        vy: -5,
                        color: colors[Math.floor(Math.random() * colors.length)]
                    }

                    balls.push(aBall)
                }
    }

    function render(context) {
        context.clearRect(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);


        // var hours = parseInt(curShowTimeSeconds/3600); 
        // var minutes = parseInt(curShowTimeSeconds-hours*3600)/60; 
        // var seconds = parseInt(curShowTimeSeconds%60); 

        var hours = curTime.getHours();
        var minutes = curTime.getMinutes();
        var seconds = curTime.getSeconds();
        var number = [hours / 10, hours % 10, minutes / 10, minutes % 10, seconds / 10, seconds % 10];
        var colonDis = 0;
        for (var i = 0; i < number.length; i++) {
            renderDigit(MARGIN_LEFT + i * (15 * (RADIUS + 1)) + colonDis, MARGIN_TOP, parseInt(number[i]), context);
            if (i != number.length - 1 && i % 2 != 0) {
                renderDigit(MARGIN_LEFT + (i + 1) * (15 * (RADIUS + 1)) + colonDis, MARGIN_TOP, 10, context); colonDis += (9 * (RADIUS + 1));
            }
        }


        for (var i = 0 ; i < balls.length ; i++) {
            context.fillStyle = balls[i].color;

            context.beginPath();
            context.arc(balls[i].x, balls[i].y, RADIUS, 0, 2 * Math.PI, true);
            context.closePath();

            context.fill();
        }
    }


    function renderDigit(x, y, num, cxt) {

        cxt.fillStyle = "rgb(0,102,153)";

        for (var i = 0; i < digit[num].length ; i++) {
            for (var j = 0; j < digit[num][i].length ; j++) {
                if (digit[num][i][j] == 1) {
                    cxt.beginPath();
                    cxt.arc(x + j * 2 * (RADIUS + 1) + (RADIUS + 1), y + i * 2 * (RADIUS + 1) + (RADIUS + 1), RADIUS, 0, 2 * Math.PI);
                    cxt.closePath();

                    cxt.fill();
                }
            }
        }
    }

    function　canlendar(){
        var arr=[
			'九寨沟旅游打折啦',
			'都江堰旅游打折啦',
			'青城山旅游打折啦',
			'峨眉山旅游打折啦',
            '乐山大佛旅游打折啦',
            '稻城亚丁旅游打折啦',
			'黄龙旅游打折啦',
			'本月暂无折扣',
			'本月暂无折扣',
            '本月暂无折扣',
            '本月暂无折扣',
            '本月暂无折扣'
        ];
        var oDiv = document.getElementById('calendar');
        var aLi = oDiv.getElementsByTagName('li');
        var oText = oDiv.getElementsByTagName('div')[0];

        for(var i =0;i<aLi.length;i++){
            aLi[i].index=i;
            aLi[i].onmouseover=function(){
                for(var i =0;i<aLi.length;i++){
                    aLi[i].className='';

                }
                this.className='active';
                oText.innerHTML='<h2>'+(this.index+1)+'月活动</h2><p>'+arr[this.index]+'</p>'
            }
        }
    }

    function clearSession(){
        Session["ViewName"] = null;
      
    }
