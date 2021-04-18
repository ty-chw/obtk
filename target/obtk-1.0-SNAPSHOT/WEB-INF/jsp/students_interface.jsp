<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 古月哥欠
  Date: 2020/12/2
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" errorPage="/error.jsp"%>
<html>
<head>
    <title>TOM考试系统学生页面</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/fontawesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/interface.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/students_interface.js"></script>
    <script type="text/javascript">
        $(function () {
            // var a=00
            // a-=1
            // alert(a)
            var Start
            var End
            var Tet
            var Tct
            var Exam
            var StudentID
            var ResultID
            var Pages
            // alert($("#datas").text())
             //用户信息查看及修改
            $("#studentInformation").click(function () {
              $.ajax({
                  url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                  data:{
                      username:"${student.username}"
                  },
                  dataType: "json",
                  success: function (data) {
                      $("input[name='name']").val(data.studentName)
                      $("input[name='studentClass']").val(data.studentClass)
                      $("input[name='password']").val(data.password)
                      $("input[name='passwords']").val(data.password)
                       $("#section").html('<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                           '<tr><th>学生姓名</th><th>班级</th><th>用户名</th><th>密码</th><th>修改用户信息</th></tr>'+
                           '<tr><td>'+data.studentName+'</td><td>'+data.studentClass+'</td><td>'+data.username+'</td><td>******</td><td><i onclick="alterStudentInformation()" class="fa fa-pencil" aria-hidden="true"></i></td></tr>'+
                           '</table>')
                  }
              })
            })
            alterStudentInformation=function(){
                var password=prompt("请输入你的现在的密码：")
                $.ajax({
                    url:"${pageContext.request.contextPath}/students/verifyStudent",
                    data:{
                        username:"${student.username}",
                        password:password
                    },
                    dataType: "json",
                    success: function (data) {
                        if(data==1){
                            $("#alterStudentInformationModal").modal("show")
                        }else {
                            if(password!=null){
                                alert("密码错误")
                            }
                        }
                    }
                })
            }

            //获取符合要求考试题目类型
            selectSubject=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/exam/selectSubject",
                    dataType: "json",
                    async:false,
                    success: function (data) {
                        Tet=data
                    }
                })
            }
            $("#ett").click(function () {
                selectSubject()
                var table='<div style="font-size: 18px;color: #ffffff;width: 868px;height: 35px;margin: 0 auto;">' +
                '<div style="margin-left: 35px;float: left;">选择考试科目：<select name="tet">'
                $(Tet).each(function () {
                   table+='<option value="'+this+'">'+this+'</option>'
                })
                table+='</select></div><div style="float: left;margin-left: 5px;"><input type="button" onclick="examing()" style="color: #0f0f0f;height: 25px" value="开始考试"/></div></div>'
                $("#section").html(table)
            })
            //换题方法
            trHideShow=function(){
                for (var i = 0; i < $("tr").length; i++) {
                    if(Start<=i&&i<=End){
                        $("tr").eq(i).show()
                    }else {
                        $("tr").eq(i).hide()
                    }
                }
            }
            //换页方法
            pagetrHideShow=function(){
                for (var i = 1; i < $("tr").length-1; i++) {
                    if(i<Start||i>End){
                        $("tr").eq(i).hide()
                    }else {
                        $("tr").eq(i).show()
                    }
                }
            }
            //首页
            homePage=function(a){
                Start=1;
                End=a;
                $("select[name='page']").val(1)
                pagetrHideShow()
            }
            //末页
            lastPage=function(a,b){
                Start=$("select[name='page'] option:last-child").val()*a-b
                End=$("select[name='page'] option:last-child").val()*a
                $("select[name='page']").val($("select[name='page'] option:last-child").val())
                pagetrHideShow()
            }
            //上一页
            previousPage=function (a) {
                if(Start>1){
                    Start-=a;
                    End-=a;
                    $("select[name='page']").val($("select[name='page']").val()*1-1)
                    trHideShow()
                }else {
                    alert("已经是第一页了！！！")
                }
            }
            //下一页
            nextPage=function (a) {
                if(($("tr").length-End)>2){
                    Start+=a;
                    End+=a;
                    $("select[name='page']").val($("select[name='page']").val()*1+1)
                    trHideShow()
                }else {
                    alert("已经是最后一页了！！！")
                }
            }
            //切换页面
            switchPage=function (Page,b,c) {
                Start=b*Page-c
                End=b*Page
                trHideShow()
            }
            //上一题
            OnATopic=function () {
            if(Start>=127){
                    Start-=2;
                    End-=2;
                    trHideShow()
                   Tct1(-1)
                }else if(Start>=120){
                    End=Start-1;
                    Start-=5;
                    trHideShow()
                    Tct1(-1)
                }else if(Start>=5){
                    Start-=5;
                    End-=5;
                    trHideShow()
                   Tct1(-1)
                }else {
                    alert("已经是第一题了！！！")
                }
            }
            //下一题
            NextQuestion=function () {
                if(($("tr").length-End)>6){
                    Start+=5;
                    End+=5;
                    trHideShow()
                    Tct1(1)
                }else if(Start>=120&&($("tr").length-End)>1){
                    Start=End+1;
                    End+=2;
                    trHideShow()
                    Tct1(1)
                }else {
                    alert("已经是最后一题了！！！")
                }
            }
            //跳转题目方法
            Jt=function(name){
              if(name<=25){
                  Start=5*(name-1)
                  End=(5*name)-1
                  trHideShow()
                  Tct2(name)
              } else {
                  Start=125+(name-26)*2
                  End=126+(name-26)*2
                  trHideShow()
                  Tct2(name)
              }
            }
            HBA=function(name){
                if(name<=20&&$("input[name='answer"+name+"']:checked").val()!=null){
                    $("#mcsss"+name+"").css("background","#FFCF60")
                }else if(name<=25&&$("input[name='answer"+name+"']:checked").val()!=null){
                    $("#mcqss"+name+"").css("background","#FFCF60")
                }else if(25<name&&$("textarea[name='answer"+name+"']").val()!=""){
                        $("#wpsss"+name+"").css("background","#FFCF60")
                 }else {
                    $("#mcsss"+name+"").css("background","#ffffff")
                    $("#mcqss"+name+"").css("background","#ffffff")
                    $("#wpsss"+name+"").css("background","#ffffff")
                }
            }
            //当前题目变色方法
            Tct1=function(name){
                HBA(Tct)
                Tct+=name
                if(Tct<=20){
                    $("#mcsss"+Tct+"").css("background","#5cb85c")
                }else if(Tct<=25){
                    $("#mcqss"+Tct+"").css("background","#5cb85c")
                }else {
                   $("#wpsss"+Tct+"").css("background","#5cb85c")
                }
            }
            //当前题目变色方法
            Tct2=function(name){
                HBA(Tct)
                Tct=name
                if(Tct<=20){
                    $("#mcsss"+Tct+"").css("background","#5cb85c")
                }else if(Tct<=25){
                    $("#mcqss"+Tct+"").css("background","#5cb85c")
                }else {
                    $("#wpsss"+Tct+"").css("background","#5cb85c")
                }
            }
            //进入考试
            examing=function () {
                //获取题目
               $.ajax({
                   url:"${pageContext.request.contextPath}/exam/examination",
                   dataType: "json",
                   data:{
                       tet:$("select[name='tet']").val()
                   },
                   async:false,
                   success:function (data) {
                       Exam=data
                       var table=''
                      $.each(data,function (index,book) {
                          Start=0
                          End=4
                          Tct=1
                         if((index+1)<=20){
                             table+='<tr><th style="background-color: #ffffff;text-align: left;padding-left: 40px;">'+(index+1)+":"+book.mcsName+'</th></tr><br/>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="radio" name="answer'+(index+1)+'"  value="A"/>'+"A:"+book.options1+'</td></tr>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="radio" name="answer'+(index+1)+'"  value="B"/>'+"B:"+book.options2+'</td></tr>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="radio" name="answer'+(index+1)+'"  value="C"/>'+"C:"+book.options3+'</td></tr>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="radio" name="answer'+(index+1)+'"  value="D"/>'+"D:"+book.options4+'</td></tr>'
                         }else if(20<(index+1)&&(index+1)<=25){
                             table+='<tr><th style="background-color: #ffffff;text-align: left;padding-left: 40px;">'+(index+1)+":"+book.mcqName+'</th></tr><br/>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="checkbox"  name="answer'+(index+1)+'"  value="A"/>'+"A:"+book.options1+'</td></tr>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="checkbox"  name="answer'+(index+1)+'"  value="B"/>'+"B:"+book.options2+'</td></tr>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="checkbox"  name="answer'+(index+1)+'"  value="C"/>'+"C:"+book.options3+'</td></tr>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><input type="checkbox"  name="answer'+(index+1)+'"  value="D"/>'+"D:"+book.options4+'</td></tr>'
                         }else {
                             table+='<tr><th style="background-color: #ffffff;text-align: left;padding-left: 40px;">'+(index+1)+":"+book.wpsName+'</th></tr><br/>' +
                                 '<tr><td style="text-align: left;padding-left: 60px;"><textarea rows="10" cols="100" required name="answer'+(index+1)+'" maxlength="2000"/></textarea></td></tr>'
                         }
                      })
                       $('table').html(table)
                       trHideShow()
                       Tct1(0)
                     $("#bottom").toggle()
                     $("#test").toggle()
                   }
               })
                //获取考生信息
                $.ajax({
                    url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                    data:{
                        username:"${student.username}"
                    },
                    async:false,
                    dataType: "json",
                    success: function (data) {
                        StudentID=data.studentId
                       $("#testStudentID").html('学生&emsp;ID:'+data.studentId+'')
                        $("#testStudentName").html('学生姓名:'+data.studentName+'')
                    }
                })
                for(var i=1;i<=27;i++){
                    HBA(i)
                }
                $('h1').text($("select[name='tet']").val()+'考试界面')
                Jt(1)
                TheCountdown()
            }
            //考试时间倒计时方法
            TheCountdown=function(){
                $("#minutes").text(90)
                 $("#seconds").text("00")
                 tc=setInterval(function () {
                    if($("#seconds").text()>10) {
                        $("#seconds").text($("#seconds").text()-1)
                    }else if($("#seconds").text()>0){
                        var a=$('#seconds').text()-1
                        var b="0"+a
                        $("#seconds").text(b)
                    }else if($("#minutes").text()==0){
                        TheirPapers()
                    }else{
                        $("#seconds").text(59)
                        $("#minutes").text( $("#minutes").text()-1)
                    }
                },1000)
            }
            //交卷方法
            TheirPapers=function () {
               var mcqResult=0
               var mcsResult =0
               $.each(Exam,function (index,book) {
                   if(25<(index+1)){
                     if(index==25){
                         $.ajax({
                             url:"${pageContext.request.contextPath}/result/insertResult",
                             dataType: "json",
                             async:false,
                             data:{
                                 studentId:StudentID,
                                 tet:$("select[name='tet']").val(),
                                 mcs:mcsResult,
                                 mcq:mcqResult,
                                 pwps:2
                             }
                         })
                         $.ajax({
                             url:"${pageContext.request.contextPath}/result/selectResultId",
                             dataType: "json",
                             async:false,
                             success:function (data) {
                                 ResultID=data
                             }
                         })
                     }

                       $.ajax({
                           url:"${pageContext.request.contextPath}/pwps/insertPwps",
                           dataType: "json",
                           data:{
                               resultsId:ResultID,
                               tet:$("select[name='tet']").val(),
                               wpsId:book.wpsId,
                               answers:$("textarea[name='answer"+(index+1)+"']").val(),
                               tf:"false"
                           }
                       })
                   }else if(20<(index+1)){
                        var answer=''
                        $("input[name='answer"+(index+1)+"']:checked").each(function () {
                            answer+=$(this).val()
                        })
                        if(book.answer==answer){
                            mcqResult+=4
                        }
                    }else if((index+1)<=20&&book.answer== $("input[name='answer"+(index+1)+"']:checked").val()){
                         mcsResult+=2
                    }
                })
               alert("已提交试卷")
                clearInterval(tc)
                $('h1').text('OBTK考试系统学生界面')
               $("#test").hide()
               $("#bottom").show()
            }
            //查询学生科目成绩方法
            $("#selectStudentTetResults").click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                    data:{
                        username:"${student.username}"
                    },
                    async:false,
                    dataType: "json",
                    success: function (data) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/result/selectStudentResultsTets",
                            dataType: "json",
                            data:{
                                studentId:data.studentId
                            },
                            async:false,
                            success:function (tet) {
                                $.ajax({
                                    url:"${pageContext.request.contextPath}/result/selectStudentTetResults",
                                    dataType: "json",
                                    data:{
                                        tet:'all',
                                        studentId:data.studentId
                                    },
                                    success:function (TetResults) {
                                        Start=1
                                        End=10
                                        var table='<div style="margin: 0 auto;width: 800px;">' +
                                            '<div style="padding-left: 35px;color: #ffffff;font-size: 18px;height: 30px">' +
                                            '按科目查询：<select onchange="switchTetResults()" name="tet"><option value="all">全部成绩</option>'
                                        $(tet).each(function () {
                                            table+='<option value="'+this+'">'+this+'</option>'
                                        })
                                        table+='</select></div>' +
                                            '<table id="StudentsInformation" width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                                            '<tr><th>单选题成绩</th><th>多选题成绩</th><th>应用题成绩</th><th>总成绩</th><th>交卷时间</th></tr>'
                                        $(TetResults).each(function () {
                                            if(this.pwps==0){
                                            table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                                '<td>'+this.wps+'</td>' +
                                                '<td>'+this.tg+'</td>' +
                                                '<td>'+this.testTime+'</td></tr>'
                                            }else {
                                                table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                                    '<td>待阅卷</td>' +
                                                    '<td>待阅卷</td>' +
                                                    '<td>'+this.testTime+'</td></tr>'
                                            }
                                        })
                                        table+='<tr><td style="text-align: right;" colspan="6">' +
                                            '<a onclick="homePage(10)" href="javascript:void(0)">首页</a>&emsp;' +
                                            '<a onclick="previousPage(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                                            '<a onclick="nextPage(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                                            '<a onclick="lastPage(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                                            '跳转到<select onchange="switchPage(this.value,10,9)" style="background-color: #ffffff" name="page">'
                                        Pages=0;

                                        for(var i=1;i<=TetResults.length/10+(TetResults.length%10==0?0:1);i++){
                                            table+='<option value="'+i+'">'+i+'</option>'
                                            Pages++
                                        }
                                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+TetResults.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                                        $("#section").html(table)
                                        pagetrHideShow()
                                    }
                                })
                            }
                        })
                    }
                })
            })
            //切换科目查询成绩
            switchTetResults=function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                    data:{
                        username:"${student.username}"
                    },
                    async:false,
                    dataType: "json",
                    success: function (data) {
                                $.ajax({
                                    url:"${pageContext.request.contextPath}/result/selectStudentTetResults",
                                    dataType: "json",
                                    data:{
                                        tet:$("select[name='tet']").val(),
                                        studentId:data.studentId
                                    },
                                    success:function (TetResults) {
                                        Start=1
                                        End=10
                                        var table='<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                                            '<tr><th>单选题成绩</th><th>多选题成绩</th><th>应用题成绩</th><th>总成绩</th><th>交卷时间</th></tr>'
                                        $(TetResults).each(function () {
                                            if(this.pwps==0){
                                                table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                                    '<td>'+this.wps+'</td>' +
                                                    '<td>'+this.tg+'</td>' +
                                                    '<td>'+this.testTime+'</td></tr>'
                                            }else {
                                                table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                                    '<td>待阅卷</td>' +
                                                    '<td>待阅卷</td>' +
                                                    '<td>'+this.testTime+'</td></tr>'
                                            }
                                        })
                                        table+='<tr><td style="text-align: right;" colspan="6">' +
                                            '<a onclick="homePage(10)" href="javascript:void(0)">首页</a>&emsp;' +
                                            '<a onclick="previousPage(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                                            '<a onclick="nextPage(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                                            '<a onclick="lastPage(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                                            '跳转到<select onchange="switchPage(this.value,10,9)" style="background-color: #ffffff" name="page">'
                                        Pages=0;

                                        for(var i=1;i<=TetResults.length/10+(TetResults.length%10==0?0:1);i++){
                                            table+='<option value="'+i+'">'+i+'</option>'
                                            Pages++
                                        }
                                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+TetResults.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                                        $("table").html(table)
                                        pagetrHideShow()
                                    }
                                })
                    }
                })
            }
            //注销账号
            $('#deleteUser').click(function () {
                var password=prompt("请输入学生密码验证身份：")
                if(password=='${student.password}'){
                    var r = confirm("是否注销该账号");
                    if (r == true) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                            data:{
                                username:"${student.username}"
                            },
                            dataType: "json",
                            success: function (student) {
                                $(student.results).each(function () {
                                    $.ajax({
                                        url:"${pageContext.request.contextPath}/result/deleteStudentResult",
                                        dataType: "json",
                                        async:false,
                                        data:{
                                            resultId:this.resultId
                                        }
                                    })
                                })
                                        $.ajax({
                                            url:"${pageContext.request.contextPath}/students/deleteStudent",
                                            data:{
                                                studentId:student.studentId
                                            },
                                            dataType: "json",
                                            success: function (data) {
                                                if(data!=0){
                                                    alert("注销成功")
                                                    $(location).attr('href', '${pageContext.request.contextPath}/login.jsp');
                                                }else {
                                                    alert("注销失败")
                                                }
                                            }
                                        })
                                    }
                                })
                            }
                }else {
                    alert('密码错误')
                }
            })
  })
    </script>
</head>
<body>
<div class="modal fade" id="alterStudentInformationModal"> <!-- modal使模态框隐藏-->
    <div class="modal-dialog"><!-- modal-dialog改变模态框的样式大小-->
        <div class="modal-content"><!-- modal-content改变模态框的透明度-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel">学生用户信息修改页面</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group has-error">
                        <label class="control-label">
                            真实姓名:
                        </label>
                        <div>
                            <input type="text" name="name" autocomplete="off" class="form-control">
                        </div>
                        <span id="name"></span>
                    </div>
                    <div id="userClass" class="form-group has-error">
                        <label class="control-label">
                            班级:
                        </label>
                        <div>
                            <input type="text" name="studentClass" autocomplete="off" class="form-control">
                        </div>
                        <span id="studentClass"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            登录名:
                        </label>
                        <div>
                            <input type="text" name="username" value="${student.username}" autocomplete="off" disabled="disabled" class="form-control">
                        </div>
                        <span id="username"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            密码:
                        </label>
                        <div class="Eye">
                            <input type="password" name="password" class="form-control">
                            <i class="fa fa-eye-slash" id="passwordEye" style="position: absolute;right: 10px;bottom:10px"></i>
                        </div>
                        <span id="password"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            确认密码:
                        </label>
                        <div class="Eye">
                            <input type="password" name="passwords" class="form-control">
                            <i class="fa fa-eye-slash" id="passwordsEye" style="position: absolute;right: 10px;bottom:10px"></i>
                        </div>
                        <span id="passwords"></span>
                    </div>
                    <div id="div4">
                        <button type="reset" class="btn">清空信息</button>&emsp;&emsp;&emsp;&emsp;
                        <button id="submitAlterStudentInformation" type="button" class="btn">提交信息</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="div1">
<div id="header" class="align-self-center mx-auto" style="background-image: url(${pageContext.request.contextPath}/static/img/examtop.jpg)">
    <div style="padding-top: 10px"><h1 >OBTK考试系统学生界面</h1></div>
</div>
    <div id="bottom">
    <div id="nav">
     <div class="nav" id="li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
         <i class="fa fa-angle-double-right" id="i1" aria-hidden="true"></i> 用户管理
     </div >
        <div id="studentInformation" class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            用户信息
        </div>
        <div id="deleteUser" class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            注销账号
        </div>
        <div class="nav" id="li2" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <i class="fa fa-angle-double-right" id="i2" aria-hidden="true"></i> 考试系统
        </div>
        <div id="ett" class="nav li2" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            进入考试
        </div>
        <div class="nav" id="li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <i class="fa fa-angle-double-right" id="i3" aria-hidden="true"></i> 成绩查询
        </div>
        <div id="selectStudentTetResults" class="nav li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            查询所有成绩
        </div>
        <div class="nav" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <a style="color:#2e6da4" href="${pageContext.request.contextPath}/login.jsp">登出</a>
        </div>
</div>
    <div id="section" style="background-image: url(${pageContext.request.contextPath}/static/img/section.jpg)">
    </div>
</div>
    <div id="test">
     <div id="nav1">
     -------------考试时间-------------------------
     <div style="height:55px;text-align: left;padding-left:30px;padding-top: 10px">
         <i  class="fa fa-clock-o fa-2x" aria-hidden="true"> <b id="minutes">90</b>:<b id="seconds">00</b> </i>
     </div>
    -------------考生信息-------------------------
      <div  style="text-align: left;padding-left:30px;height:88px;padding-top: 10px">
          <p id="testStudentID">学生&emsp;ID:1</p>
          <p id="testStudentName">学生姓名:猕猴桃</p>
      </div>
         --------------答题卡-------------------------
         <div  style="height: 330px;text-align: left;padding-left:20px;height:88px;padding-top: 10px">
             <div id="mcsssli"><i class="fa fa-angle-double-right" id="mcsssi" aria-hidden="true"></i> 单选题</div>
             <div id="mcsss">
                 <c:forEach var="i" begin="1" end="20" varStatus="status">
                   <input type="button" style="background-color:#ffffff;height: 30px;width:30px" onclick="Jt(${i})" value="${i}"  id="mcsss${i}" >
                     <c:if test="${status.index%5 eq 0}">
                         <br/>
                     </c:if>
                 </c:forEach>
             </div>
             <div id="mcqssli"><i class="fa fa-angle-double-right" id="mcqssi"  aria-hidden="true"></i> 多选题</div>
             <div id="mcqss">
                 <c:forEach var="i" begin="1" end="5" varStatus="status">
                     <input type="button" style="background-color:#ffffff;height: 30px;width:30px" value="2${i}" onclick="Jt(2${i})" id="mcqss2${i}" >
                 </c:forEach>
             </div>
             <div id="wpsssli"><i class="fa fa-angle-double-right" id="wpsssi" aria-hidden="true"></i> 应用题</div>
             <div id="wpsss">
             <input type="button" style="background-color:#ffffff;height: 30px;width:30px" value="26" onclick="Jt(26)" id="wpsss26" >
             <input type="button" style="background-color:#ffffff;height: 30px;width:30px" value="27" onclick="Jt(27)" id="wpsss27" >
             </div>
         </div>
         <div style="height: 30px;line-height: 30px;padding-top:220px">
             当前:<input type="button" style="background-color:#5cb85c;height: 15px;width:15px">&emsp;
             作答:<input type="button" style="background-color:#FFCF60;height: 15px;width:15px">&emsp;
             未答:<input type="button" style="background-color:#ffffff;height: 15px;width:15px">&emsp;
         </div>
     </div>
    <div id="section1" >
        <div style="height:500px ">
         <table style="width:960px;height: 350px;">
         </table>
        </div>
     <div style="background-color:#faf2cc;height: 60px;">
         <div style="float:left;text-align: left;width:800px;height: 60px;padding-left: 55px;padding-top: 10px">
             <input  class="btn btn-success" type="button" onclick="OnATopic()" value="上一题">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
             <input  class="btn btn-success" type="button" onclick="NextQuestion()" value="下一题"></div>
         <div style="float: left;width:160px;text-align: right;height: 60px;padding-right: 55px;padding-top: 10px">
             <input type="button" class="btn btn-danger" onclick="TheirPapers()" value="交卷"></div>
     </div>
    </div>
    </div>
</div>
</body>
</html>
