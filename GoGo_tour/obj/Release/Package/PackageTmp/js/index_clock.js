var WINDOW_WIDTH =290;//画布宽
var WINDOW_HEIGHT = 140;//画布高
var RADIUS = 1.25;//圆半径
var MARGIN_TOP = Math.round(WINDOW_HEIGHT/5);
var MARGIN_LEFT = Math.round(WINDOW_WIDTH/10);;
var curTime = new Date();//获取时间

var balls = [];
const colors = ["#33B5E5","#0099CC","#AA66CC","#9933CC","#99CC00","#669900","#FFBB33","#FF8800","#FF4444","#CC0000"];

// var curShowTimeSeconds = 0;

window.onload = function(){
    var canvas =document.getElementById("canvas");
    var context = canvas.getContext("2d");

    canvas.width = WINDOW_WIDTH;
    canvas.height = WINDOW_HEIGHT;
    //canvas.drawColor(Color.yellow);

//     render(context);
// }

    // curShowTimeSeconds = getCurrentShowTimeSeconds();

    setInterval(function(){
        render(context);
        upadate();
    },50)
    

}
// function getCurrentShowTimeSeconds(){
//     var curTime = new Date();
//     var ret = endTime.getTime()-curTime.getTime();
//     ret = Math.round(ret/1000);

//     return ret >= 0 ? ret : 0;

// }

function upadate(){
    var nextTime = new Date();
    var nextHours = nextTime.getHours(); 
    var nextMinutes = nextTime.getMinutes(); 
    var nextSeconds = nextTime.getSeconds(); 

    var curHours = curTime.getHours(); 
    var curMinutes = curTime.getMinutes(); 
    var curSeconds = curTime.getSeconds(); 

    if( nextSeconds != curSeconds ){
         if( parseInt(curHours/10) != parseInt(nextHours/10) ){
            addBalls( MARGIN_LEFT + 0 , MARGIN_TOP , parseInt(curHours/10) );
        }
        if( parseInt(curHours%10) != parseInt(nextHours%10) ){
            addBalls( MARGIN_LEFT + 15*(RADIUS+1) , MARGIN_TOP , parseInt(curHours/10) );
        }

        if( parseInt(curMinutes/10) != parseInt(nextMinutes/10) ){
            addBalls( MARGIN_LEFT + 39*(RADIUS+1) , MARGIN_TOP , parseInt(curMinutes/10) );
        }
        if( parseInt(curMinutes%10) != parseInt(nextMinutes%10) ){
            addBalls( MARGIN_LEFT + 54*(RADIUS+1) , MARGIN_TOP , parseInt(curMinutes%10) );
        }

        if( parseInt(curSeconds/10) != parseInt(nextSeconds/10) ){
            addBalls( MARGIN_LEFT + 78*(RADIUS+1) , MARGIN_TOP , parseInt(curSeconds/10) );
        }
        if( parseInt(curSeconds%10) != parseInt(nextSeconds%10) ){
            addBalls( MARGIN_LEFT + 93*(RADIUS+1) , MARGIN_TOP , parseInt(nextSeconds%10) );
        }

        curTime = nextTime;
    }
    updateBalls();

}


function updateBalls(){

    for( var i = 0 ; i < balls.length ; i ++ ){

        balls[i].x += balls[i].vx;
        balls[i].y += balls[i].vy;
        balls[i].vy += balls[i].g;

        if( balls[i].y >= WINDOW_HEIGHT-RADIUS ){
            balls[i].y = WINDOW_HEIGHT-RADIUS;
            balls[i].vy = - balls[i].vy*0.6;
        }
    }
    //优化
    var cnt = 0;
    for(var i=0 ; i<balls.length ; i++){
        if(balls[i].x + RADIUS > 0&&balls[i].x - RADIUS < WINDOW_WIDTH ){
            balls[cnt++] = balls[i];
        }
    }

    while(balls.length > cnt){
        balls.pop();
    }
}

function addBalls( x , y , num ){

    for( var i = 0  ; i < digit[num].length ; i ++ )
        for( var j = 0  ; j < digit[num][i].length ; j ++ )
            if( digit[num][i][j] == 1 ){
                var aBall = {
                    x:x+j*2*(RADIUS+1)+(RADIUS+1),
                    y:y+i*2*(RADIUS+1)+(RADIUS+1),
                    g:1.5+Math.random(),
                    vx:Math.pow( -1 , Math.ceil( Math.random()*1000 ) ) * 4,
                    vy:-5,
                    color: colors[ Math.floor( Math.random()*colors.length ) ]
                }

                balls.push( aBall )
            }
}

function render(context) { 
    context.clearRect(0,0,WINDOW_WIDTH,WINDOW_HEIGHT);
    

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


    for( var i = 0 ; i < balls.length ; i ++ ){
        context.fillStyle=balls[i].color;

        context.beginPath();
        context.arc( balls[i].x , balls[i].y , RADIUS , 0 , 2*Math.PI , true );
        context.closePath();

        context.fill();
    }
}


function renderDigit(x,y,num,cxt){
    cxt.fillStyle = "rgb(0,102,153)";

    for(var i = 0;i < digit[num].length ; i++){
        for(var j = 0;j < digit[num][i].length ; j++){
        if(digit[num][i][j] == 1){
            cxt.beginPath();
            cxt.arc(x+j*2*(RADIUS+1)+(RADIUS+1),y+i*2*(RADIUS+1)+(RADIUS+1),RADIUS,0,2*Math.PI);
            cxt.closePath();

            cxt.fill();
            }
        }
    }
}
