$(function () {
    //获取相对路径
    var pathName=window.document.location.pathname;
    //截取，得到项目名称
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    //计时跳转
    setInterval(function () {
        $("#time").text($("#time").text()-1)
        if($("#time").text()==0){
            $(location).attr("href",projectName+"/login.jsp");
        }
    },1000)
})