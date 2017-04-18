
var Sys = {};
var dom='<div id="warning_info" style="position: absolute;top: 0px;left: 0;right: 0; z-index: 99999;" class="alert alert-warning alert-dismissible fade in">'+
    '<button data-dismiss="alert" class="close" type="button">×</button>'+
'<strong>您正在使用低版本浏览器，</strong> 在本页面的显示效果可能有差异。建议您升级到'+
'<a href="http://www.google.cn/intl/zh-CN/chrome/" target="_blank">Chrome</a> 或以下浏览器：'+
'<a href="www.mozilla.org/en-US/firefox/‎" target="_blank">Firefox</a> /'+
'<a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> /'+
'<a href="http://www.opera.com/" target="_blank">Opera</a> /'+
'<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie" target="_blank">Internet Explorer 10</a>'+
'</div>';
var ua = navigator.userAgent.toLowerCase();
if (window.ActiveXObject)
    Sys.ie = ua.match(/msie ([\d.]+)/)[1]
else if (document.getBoxObjectFor)
    Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1]
else if (window.MessageEvent && !document.getBoxObjectFor)
    Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1]
else if (window.opera)
    Sys.opera = ua.match(/opera.([\d.]+)/)[1]
else if (window.openDatabase)
    Sys.safari = ua.match(/version\/([\d.]+)/)[1];
//以下进行测试
if(Sys.ie){
    if(Sys.ie <= 9.0){
        $("body").append(dom);
    }
}
//if(Sys.firefox) document.write('Firefox: '+Sys.firefox);
//if(Sys.chrome) document.write('Chrome: '+Sys.chrome);
//if(Sys.opera) document.write('Opera: '+Sys.opera);
//if(Sys.safari) document.write('Safari: '+Sys.safari);