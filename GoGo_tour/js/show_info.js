window.onload = function () {
    var content_title_text = document.getElementById("content_title").innerHTML;
    var x, y;
    var content, title;
    switch (content_title_text) {
        case "青城山":
            x = 103.578829;
            y = 30.903727;
            content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                        '<img src="/img/青城山.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                        '地址：四川省成都市都江堰市青城山路<br/>电话：(028)87288159<br/>简介：青城山下白素贞，洞中千年修此身。' +
                      '</div>';
            title = "青城山";
            break;
        case "九寨沟":
            x = 103.919275;
            y = 33.148667;
            content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                        '<img src="/img/jiuzhaigou.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                        '地址：四川省阿坝藏族羌族自治州九寨沟县漳扎镇九寨沟<br/>电话：(0837)7739753<br/>简介：传说中的童话天堂，你还在犹豫么' +
                      '</div>';
            title = "九寨沟";
            break;
        case "欢乐谷":
            x = 104.040108;
            y = 30.729181;
            content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                        '<img src="/img/欢乐谷.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                        '地址：四川省成都市金牛区西华大道16号（近北三环交大立交)<br/>电话：028-61898999<br/>简介：时尚、动感、欢乐、梦幻。' +
                      '</div>';
            title = "欢乐谷";
            break;
        case "峨眉山":
            x = 103.447858;
            y = 29.584531;
            content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                        '<img src="/img/emeishan.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                        '地址：四川省峨眉山市名山西路46号<br/>电话：0833-5533355<br/>简介：云上金顶，天下峨眉。' +
                      '</div>';
            title = "峨眉山";
            break;
        case "四姑娘山":
            x = 102.836032;
            y = 31.127546;
            content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                        '<img src="/img/siguniangshan.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                        '地址：阿坝藏族羌族自治州小金县四姑娘山镇<br/>电话：(0837)2791867<br/>简介：四姑娘山有风景，有四娘。' +
                      '</div>';
            title = "四姑娘山";
            break;

    }
   
    // 百度地图API功能
    var map = new BMap.Map('allmap');
    var poi = new BMap.Point(x, y);
    map.centerAndZoom(poi, 16);
    map.enableScrollWheelZoom();

    //创建检索信息窗口对象
    var searchInfoWindow = null;
    searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
        title: title,      //标题
        width: 290,             //宽度
        height: 105,              //高度
        panel: "panel",         //检索结果面板
        enableAutoPan: true,     //自动平移
        searchTypes: [
            BMAPLIB_TAB_SEARCH,   //周边检索
            BMAPLIB_TAB_TO_HERE,  //到这里去
            BMAPLIB_TAB_FROM_HERE //从这里出发
        ]
    });
    var marker = new BMap.Marker(poi); //创建marker对象
    marker.enableDragging(); //marker可拖拽
    marker.addEventListener("click", function (e) {
        searchInfoWindow.open(marker);
    })
    map.addOverlay(marker); //在地图中添加marker

}