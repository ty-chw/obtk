<%--
  Created by IntelliJ IDEA.
  User: 古月哥欠
  Date: 2020/12/2
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>TOM考试系统教师页面</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/fontawesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/interface.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/teachers_interface.js"></script>
    <script type="text/javascript">
        $(function () {
            var Class
            var Tet
            var Start
            var End
            var Pages
            var TetResultsStart
            var TetResultsEnd
            var TetResultsPages
            var StudentResultId
            var StudentsId
            display=function(){
                if($(".li1").css("display")=="none"){
                    $("#i1").removeClass("fa-angle-double-right")
                    $("#i1").addClass("fa-angle-double-down")
                }else {
                    $("#i1").removeClass("fa-angle-double-down")
                    $("#i1").addClass("fa-angle-double-right")
                }
                $(".li1").toggle()
            }
            //判断是否是管理员登录
            if(${teacher.username=="admin"}){
                $("#nav").html('<div class="nav" onclick="display()" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">\n' +
                    '    <i class="fa fa-angle-double-right" id="i1" aria-hidden="true"></i> 用户管理\n' +
                    '</div >\n' +
                    '<div onclick="teacherInformation()"  class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">\n' +
                    '    管理员账号信息\n' +
                    '</div>' +
                    '<div onclick="selectTeacherInformation()" class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">\n' +
                    '    查看所有教师信息\n' +
                    '</div>' +
                    ' <div  onclick="teachersUsername()" class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">\n' +
                    '            查看教师个人信息\n' +
                    '        </div>' +
                    '<div class="nav" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">\n' +
                    '            <a style="color:#2e6da4" href="${pageContext.request.contextPath}/login.jsp">登出</a>\n' +
                    '        </div>')
            }
            //教师用户名查询信息
            teachersUsername=function(){
                var table='<div style="margin: 0 auto;width: 800px;">' +
                    '<div style="padding-left: 35px;padding-bottom: 5px;color: #ffffff;font-size: 18px;height: 35px">' +
                    '<div style="float: left">教师用户名:<input style="color: #0f0f0f;height: 25px" id="studentUsername" type="text"></div>' +
                    '<div style="margin-left: 5px; float: left"><button onclick="selectTeacherUsernameInformation()" style="color: #0f0f0f;height: 25px">提交</button></div></div>' +
                    '<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">' +
                    '<tr><th>教师姓名</th><th>用户名</th><th>用户密码</th><th>修改教师账号</th><th>注销账号</th></tr>' +
                    '<tr><td>***</td><td>***</td><td>***</td><td><i class="fa fa-pencil" aria-hidden="true"></i></td>' +
                    '<td><i onclick="" class="fa fa-trash" aria-hidden="true"></i></td></tr>' +
                    '</table></div>'
                $("#section").html(table)
            }
            //教师用户名查询教师信息方法
            selectTeacherUsernameInformation=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/teachers/selectTeacherInformation",
                    data:{
                        username:$("#studentUsername").val()
                    },
                    dataType: "json",
                    success: function (teacher) {
                        $("td").eq(0).text(teacher.teacherName)
                        $("td").eq(1).text(teacher.username)
                        $("td").eq(3).html('<i onclick="alterTeachersInformation(\''+teacher.teacherName+'\',\''+teacher.username+'\',\''+teacher.password+'\')" class="fa fa-pencil" aria-hidden="true"></i>')
                        $("td").eq(4).html('<i onclick="deleteTeacher2(\''+teacher.teacherId+'\')" class="fa fa-trash" aria-hidden="true"></i>')
                    },
                    error:function () {
                        alert("用户不存在！！！")
                    }
                })
            }
            //查看所有教师方法
            selectTeacherInformation=function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/teachers/selectTeachersInformation",
                    dataType: "json",
                    success: function (teachers) {
                        Start=1
                        End=10
                        var table='<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                            '<tr><th>教师姓名</th><th>用户名</th><th>用户密码</th><th>修改教师账号</th><th>注销账号</th></tr>'
                        $(teachers).each(function () {
                            table+='<tr><td>'+this.teacherName+'</td>' +
                                '<td>'+this.username+'</td><td>******</td>' +
                                '<td><i onclick="alterTeachersInformation(\''+this.teacherName+'\',\''+this.username+'\',\''+this.password+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                '<td><i onclick="deleteTeacher(\''+this.teacherId+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                        })
                        table+='<tr><td style=";text-align: right;" colspan="6">' +
                            '<a onclick="homePage(10)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select style="background-color: #ffffff" onchange="switchPage(this.value,10,9)" name="page">'
                        Pages=0;

                        for(var i=1;i<=(teachers.length%10==0?0:1)+teachers.length/10;i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+teachers.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                        $("#section").html(table)
                        trHideShow()
                    }
                })
            }
            //切换密码可不可见
            function eye(ID,Eye){
                if (ID.attr("type")=="password") {
                    ID.attr("type","text")
                    Eye.removeClass("fa-eye-slash")
                    Eye.addClass("fa-eye")
                }else {
                    ID.attr("type","password")
                    Eye.removeClass("fa-eye")
                    Eye.addClass("fa-eye-slash")
                }
            }
            $("#passwordEye").click(function(){
                eye($("input[name='password']"),$(this))
            })
            $("#passwordsEye").click(function(){
                eye($("input[name='passwords']"),$(this))
            })
            function onfocusBlur() {
                $("input[name='studentClass']").focus()
                $("input[name='studentClass']").blur()
                $("input[name='name']").focus()
                $("input[name='name']").blur()
                $("input[name='password']").focus()
                $("input[name='password']").blur()
                $("input[name='passwords']").focus()
                $("input[name='passwords']").blur()
            }
            function spans() {
                if($("#name").text()!=""||$("#password").text()!=""||$("#passwords").text()!=""){
                    return false
                }
                return true
            }
            function onfocusError(ID,Error){
                if(Error.text()!=""){
                    ID.val("")
                }else {
                    ID.val(ID.val().replace(/\s/g,""))
                }
                Error.text("")
            }
            function onblurError(ID,Reg,ErrorID,Text,ErrorIdText){
                var name=ID.value;
                name=name.replace(/\s/g,"")
                if(name.length>13||name.length<2){
                    ErrorID.text(ErrorIdText)
                }else if (!Reg.test(name)){
                    ErrorID.text(Text)
                }
            }

            //姓名的输入规范
            $("input[name='name']").blur(function(){
                // 要求输入内容规范
                var Reg = /^[a-zA-Z\u4e00-\u9fa5]+$/g;
                var Text="真实姓名只能由汉字和字母组成"
                var ErrorIdText="真实姓名长度为2-12"
                onblurError(this,Reg,$("#name"),Text,ErrorIdText)
            })
            $("input[name='name']").focus(function(){
                onfocusError($(this),$("#name"))
            })
            //班级的输入规范
            $("input[name='studentClass']").blur(function(){
                //要求输入内容规范
                var Reg = /^[0-9a-zA-Z]*$/g;
                var Text="班级名只能由数字和字母组成"
                var ErrorIdText="班级名长度为2-12"
                onblurError(this,Reg,$("#studentClass"),Text,ErrorIdText)
            })

            $("input[name='studentClass']").focus(function(){
                onfocusError($(this),$("#studentClass"))
            })
            //密码的输入规范
            $("input[name='password']").blur(function(){
                //要求输入内容规范
                var Reg = /^[0-9a-zA-Z]*$/g;
                var Text="密码只能由数字和字母组成"
                var ErrorIdText="密码长度为2-12"
                onblurError(this,Reg,$("#password"),Text,ErrorIdText)
            })
            $("input[name='password']").focus(function(){
                onfocusError($(this),$("#password"))
            })

            //确认密码的输入规范
            $("input[name='passwords']").blur(function(){
                //要求输入内容规范
                if($(this).val()!=$("input[name='password']").val()){
                    $("#passwords").text("两次密码不一致")
                }
            })
            $("input[name='passwords']").focus(function(){
                onfocusError($(this),$("#passwords"))
            })
            //单选题应用题成绩修改输入规范方法
            alterMcsWpsResultsEye=function(name,nameEye){
                if(isNaN(name.val())||name.val().length>2||name.val().length<1||name.val()<0||name.val()>40){
                    nameEye.text('只能输入0-40之间的数字')
                }
            }
            //单选题
            $("input[name='mcsResult']").blur(function(){
                alterMcsWpsResultsEye($(this),$("#mcsResult"))
            })
            $("input[name='mcsResult']").focus(function(){
                onfocusError($(this),$("#mcsResult"))
            })
            //应用题
            $("input[name='wpsResult']").blur(function(){
                alterMcsWpsResultsEye($(this),$("#wpsResult"))
            })
            $("input[name='wpsResult']").focus(function(){
                onfocusError($(this),$("#wpsResult"))
            })
            //多选题
            $("input[name='mcqResult']").blur(function(){
                if(isNaN($(this).val())||$(this).val().length>2||$(this).val().length<1||$(this).val()<0||$(this).val()>20){
                    $("#mcqResult").text('只能输入0-20之间的数字')
                }
            })
            $("input[name='mcqResult']").focus(function(){
                onfocusError($(this),$("#mcqResult"))
            })
            function onfocusBlur2() {
                $("input[name='mcsResult']").focus()
                $("input[name='mcsResult']").blur()
                $("input[name='wpsResult']").focus()
                $("input[name='wpsResult']").blur()
                $("input[name='mcqResult']").focus()
                $("input[name='mcqResult']").blur()
            }
            function spans2() {
                if($("#mcsResult").text()!=""||$("#wpsResult").text()!=""||$("#mcqResult").text()!=""){
                    return false
                }
                return true
            }
            //点击修改信息
            $("#submitAlterInformation").click(function () {
                onfocusBlur()
                if (spans()) {
                    if($("#myModalLabel").text()=="老师用户信息修改页面"){
                     $.ajax({
                        url:"${pageContext.request.contextPath}/teachers/alterTeacherInformation",
                        data: {
                            teacherName: $("input[name='name']").val(),
                            username:$("input[name='username']").val(),
                            password: $("input[name='password']").val()
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data == 0) {
                                alert("修改失败")
                            } else {
                                alert("修改成功")
                                var page=$("select[name='page']").val()

                                $("#alterInformationModal").modal("hide")
                                if($("select[name='page'] option:last-child").val()<page){
                                    switchPage($("select[name='page'] option:last-child").val(),10,9)
                                    $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                }else {
                                    switchPage(page,10,9)
                                    $("select[name='page']").val(page)
                                }
                            }
                        }
                    })
                    }else if($("#myModalLabel").text()=="学生用户信息修改页面"){
                        if($("#studentClass").text()==""){
                            $.ajax({
                                url:"${pageContext.request.contextPath}/students/alterStudentInformation",
                                data: {
                                    studentName: $("input[name='name']").val(),
                                    studentClass:$("input[name='studentClass']").val(),
                                    username:$("input[name='username']").val(),
                                    password: $("input[name='password']").val()
                                },
                                dataType: "json",
                                success: function (data) {
                                    if (data == 0) {
                                        alert("修改失败")
                                    } else {
                                        alert("修改成功")
                                        var page=$("select[name='page']").val()
                                          selectStudentClass();
                                        var Classes=$("select[name='classes']").val()
                                        var  Select='<option value="all">全部班级</option>'
                                        $(Class).each(function () {
                                            Select+='<option value="'+this+'">'+this+'</option>'
                                        })
                                        $("select[name='classes']").html(Select)
                                        $("select[name='classes']").val(Classes)
                                        if($("select[name='classes']").val()!=null){
                                          switchClass1($("select[name='classes']").val())
                                        }else {
                                            $("select[name='classes']").val('all')
                                            switchClass1($("select[name='classes']").val())
                                        }
                                        $("#alterInformationModal").modal("hide")
                                        if($("select[name='page'] option:last-child").val()<page){
                                            switchPage($("select[name='page'] option:last-child").val(),10,9)
                                            $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                        }else {
                                            switchPage(page,10,9)
                                            $("select[name='page']").val(page)
                                        }
                                    }
                                }
                            })
                        }
                    }
                }
            })
            //用户信息查看及修改
            teacherInformation=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/teachers/selectTeacherInformation",
                    data:{
                        username:"${teacher.username}"
                    },
                    dataType: "json",
                    success: function (data) {
                        $("input[name='name']").val(data.teacherName)
                        $("input[name='username']").val(data.username)
                        $("input[name='password']").val(data.password)
                        $("input[name='passwords']").val(data.password)
                        $("#section").html('<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                            '<tr><th>老师姓名</th><th>用户名</th><th>密码</th><th>修改用户信息</th></tr>'+
                            '<tr><td>'+data.teacherName+'</td><td>'+data.username+'</td><td>******</td><td><i onclick="alterTeacherInformation()" class="fa fa-pencil" aria-hidden="true"></i></td></tr>'+
                            '</table>')
                    }
                })
            }
            //修改用户信息方法
            alterTeacherInformation=function(){
                var password=prompt("请输入你的现在的密码：")
                $.ajax({
                    url:"${pageContext.request.contextPath}/teachers/verifyTeacher",
                    data:{
                        username:"${teacher.username}",
                        password:password
                    },
                    dataType: "json",
                    success: function (data) {
                        if(data==1){
                            $("#myModalLabel").text("老师用户信息修改页面")
                            $("#userClass").hide()
                            $("#alterInformationModal").modal("show")
                        }else {
                            if(password!=null){
                                alert("密码错误")
                            }
                        }
                    }
                })
            }
            //修改教师方法
            alterTeachersInformation=function(teacherName,teacherUsername,teacherPassword){
                     $("input[name='name']").val(teacherName)
                     $("input[name='username']").val(teacherUsername)
                     $("input[name='password']").val(teacherPassword)
                     $("input[name='passwords']").val(teacherPassword)
                     $("#myModalLabel").text("老师用户信息修改页面")
                     $("#userClass").hide()
                     $("#alterInformationModal").modal("show")
            }
            //获取所有班级
            selectStudentClass=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/students/selectStudentClass",
                    dataType: "json",
                    success: function (data) {
                        Class=data
                    },
                    async:false
                })
            }
            //获取所有考试题目类0型
            selectTet=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/mcs/selectMcsTet",
                    dataType: "json",
                    async:false,
                    success: function (data) {
                        Tet=data
                    }
                })
            }
            //查询所有学生信息
            $("#selectStudentsInformation").click(function () {
                selectStudentClass();
              $.ajax({
                  url:"${pageContext.request.contextPath}/students/selectStudentsInformation",
                  dataType: "json",
                  success: function (students) {
                      Start=1
                      End=10
                      var table='<div style="margin: 0 auto;width: 800px;">' +
                          '<div style="padding-left: 35px;color: #ffffff;font-size: 18px;height: 30px">' +
                          '按班级查询：<select onchange="switchClass1(this.value)" name="classes"><option value="all">全部班级</option>'
                           $(Class).each(function () {
                            table+='<option value="'+this+'">'+this+'</option>'
                           })
                           table+='</select></div>' +
                          '<table id="StudentsInformation" width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                          '<tr><th>学生姓名</th><th>学生班级</th><th>用户名</th><th>用户密码</th><th>查看成绩</th><th>修改学生账号</th><th>注销账号</th></tr>'
                          $(students).each(function () {
                           table+='<tr><td>'+this.studentName+'</td><td>'+this.studentClass+'</td>' +
                               '<td>'+this.username+'</td><td>******</td>' +
                               '<td><i onclick="selectStudentResult(\''+this.studentId+'\',\''+this.studentName+'\')" class="fa fa-search-plus" aria-hidden="true"></i></td>' +
                               '<td><i onclick="alterStudentInformation(\''+this.studentName+'\',\''+this.studentClass+'\',\''+this.username+'\',\''+this.password+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                               '<td><i onclick="deleteStudent(\''+this.username+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                          })
                      table+='<tr><td style="text-align: right;" colspan="7">' +
                          '<a onclick="homePage(10)" href="javascript:void(0)">首页</a>&emsp;' +
                          '<a onclick="previousPage(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                          '<a onclick="nextPage(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                          '<a onclick="lastPage(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                          '跳转到<select onchange="switchPage(this.value,10,9)" style="background-color: #ffffff" name="page">'
                           Pages=0;

                          for(var i=1;i<=students.length/10+(students.length%10==0?0:1);i++){
                              table+='<option value="'+i+'">'+i+'</option>'
                              Pages++
                          }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+students.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                      $("#section").html(table)
                       trHideShow()
                  }
            })
        })
            //查询学生成绩
            selectStudentResult=function(studentId,studentName){
                StudentsId=studentId
                $.ajax({
                    url:"${pageContext.request.contextPath}/result/selectStudentResultsTets",
                    dataType: "json",
                    data:{
                        studentId:studentId
                    },
                    async:false,
                    success:function (tet) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/result/selectStudentTetResults",
                            dataType: "json",
                            data:{
                                tet:'all',
                                studentId:studentId
                            },
                            success:function (TetResults) {
                                 TetResultsStart=1
                                 TetResultsEnd=10
                                var table='<div style="margin: 0 auto;width: 800px;">' +
                                    '<div style="padding-left: 35px;font-size: 18px;height: 30px">' +
                                    '按科目查询：<select onchange="switchTetResults(\''+studentId+'\')" name="tet"><option value="all">全部成绩</option>'
                                $(tet).each(function () {
                                    table+='<option value="'+this+'">'+this+'</option>'
                                })
                                table+='</select></div>' +
                                    '<table id="studentResults" width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                                    '<tr><th>单选题成绩</th><th>多选题成绩</th><th>应用题成绩</th><th>总成绩</th><th>交卷时间</th><th>修改成绩</th><th>删除题目</th></tr>'
                                $(TetResults).each(function () {
                                    if(this.pwps==0){
                                        table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                            '<td>'+this.wps+'</td>' +
                                            '<td>'+this.tg+'</td>' +
                                            '<td>'+this.testTime+'</td>' +
                                            '<td><i onclick="alterStudentResultModes(\''+this.resultId+'\',\''+this.mcs+'\',\''+this.mcq+'\',\''+this.wps+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                            '<td><i onclick="deleteStudentResult()" class="fa fa-trash" aria-hidden="true"></i></td>' +
                                            '</tr>'
                                    }else {
                                        table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                            '<td>待阅卷</td>' +
                                            '<td>待阅卷</td>' +
                                            '<td>'+this.testTime+'</td>' +
                                            '<td><i onclick="alterStudentResultModes(\''+this.resultId+'\',\''+this.mcs+'\',\''+this.mcq+'\',\''+this.wps+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                            '<td><i onclick="deleteStudentResult()" class="fa fa-trash" aria-hidden="true"></i></td>' +
                                            '</tr>'
                                    }
                                })
                                table+='<tr><td style="text-align: right;" colspan="8">' +
                                    '<a onclick="homePage2(10)" href="javascript:void(0)">首页</a>&emsp;' +
                                    '<a onclick="previousPage2(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                                    '<a onclick="nextPage2(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                                    '<a onclick="lastPage2(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                                    '跳转到<select onchange="switchPage(this.value,10,9)" style="background-color: #ffffff" name="TetResultsPage">'
                                TetResultsPages=0;

                                for(var i=1;i<=TetResults.length/10+(TetResults.length%10==0?0:1);i++){
                                    table+='<option value="'+i+'">'+i+'</option>'
                                    TetResultsPages++
                                }
                                table+='</select>页&emsp;共'+TetResultsPages+'页&emsp;'+TetResults.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                                $("#myStudentsResultsModel").html(studentName+"同学成绩页面")
                                $("#myStudentsResultsBody").html(table)
                                trHideShow2()
                                $("#selectStudentsResultsModel").modal("show")
                            }
                        })
            }
            })
            }
            //切换科目查询成绩
            switchTetResults=function (studentId) {
                         StudentsId=studentId
                        $.ajax({
                            url:"${pageContext.request.contextPath}/result/selectStudentTetResults",
                            dataType: "json",
                            data:{
                                tet:$("select[name='tet']").val(),
                                studentId:studentId
                            },
                            success:function (TetResults) {
                                Start=1
                                End=10
                                var table='<table width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                                    '<tr><th>单选题成绩</th><th>多选题成绩</th><th>应用题成绩</th><th>总成绩</th><th>交卷时间</th><th>修改成绩</th><th>删除成绩</th></tr>'
                                $(TetResults).each(function () {
                                    if(this.pwps==0){
                                        table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                            '<td>'+this.wps+'</td>' +
                                            '<td>'+this.tg+'</td>' +
                                            '<td>'+this.testTime+'</td>'+
                                            '<td><i onclick="alterStudentResultModes(\''+this.resultId+'\',\''+this.mcs+'\',\''+this.mcq+'\',\''+this.wps+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                            '<td><i onclick="deleteStudentResult()" class="fa fa-trash" aria-hidden="true"></i></td>' +
                                            '</tr>'
                                    }else {
                                        table+='<tr><td>'+this.mcs+'</td><td>'+this.mcq+'</td>' +
                                            '<td>待阅卷</td>' +
                                            '<td>待阅卷</td>' +
                                            '<td>'+this.testTime+'</td>'+
                                            '<td><i onclick="alterStudentResultModes(\''+this.resultId+'\',\''+this.mcs+'\',\''+this.mcq+'\',\''+this.wps+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                            '<td><i onclick="deleteStudentResult()" class="fa fa-trash" aria-hidden="true"></i></td>' +
                                            '</tr>'
                                    }
                                })
                                table+='<tr><td style="text-align: right;" colspan="8">' +
                                    '<a onclick="homePage2(10)" href="javascript:void(0)">首页</a>&emsp;' +
                                    '<a onclick="previousPage2(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                                    '<a onclick="nextPage2(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                                    '<a onclick="lastPage2(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                                    '跳转到<select onchange="switchPage2(this.value,10,9)" style="background-color: #ffffff" name="TetResultsPage">'
                                TetResultsPages=0;

                                for(var i=1;i<=TetResults.length/10+(TetResults.length%10==0?0:1);i++){
                                    table+='<option value="'+i+'">'+i+'</option>'
                                    TetResultsPages++
                                }
                                table+='</select>页&emsp;共'+TetResultsPages+'页&emsp;'+TetResults.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                                $("#studentResults").html(table)
                                trHideShow2()
                            }
                        })
                    }
            //弹出修改成绩模态框方法
            alterStudentResultModes=function(resultId,mcsResult,mcqResult,wpsResult){
                StudentResultId=resultId
                $("input[name='mcsResult']").val(mcsResult)
                $("#mcsResult").text('')
                $("input[name='mcqResult']").val(mcqResult)
                $("#mcqResult").text('')
                $("input[name='wpsResult']").val(wpsResult)
                $("#wpsResult").text('')
                $("#alterStudentResult").modal('show')
            }
            //提交修改学生成绩
            $('#submitAlterStudentResult').click(function () {
                onfocusBlur2()
                if(spans2()){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/result/alterStudentResult",
                        dataType: "json",
                        data:{
                            resultId:StudentResultId,
                            mcs:$("input[name='mcsResult']").val(),
                            mcq:$("input[name='mcqResult']").val(),
                            wps:$("input[name='wpsResult']").val()
                        },
                        success:function (data) {
                            if(data!=0){
                                var TetResultsPages=$("select[name='TetResultsPages']").val()
                                switchTetResults(StudentsId)
                                if($("select[name='TetResultsPages'] option:last-child").val()<TetResultsPages){
                                    switchPage2($("select[name='TetResultsPages'] option:last-child").val(),10,9)
                                    $("select[name='TetResultsPages']").val($("select[name='TetResultsPages'] option:last-child").val())
                                }else {
                                    switchPage2(TetResultsPages,10,9)
                                    $("select[name='TetResultsPages']").val(TetResultsPages)
                                }
                                alert('修改成功')
                                $("#alterStudentResult").modal('hide')
                            }
                        }
                    })
                }
            })
            //学生用户名查询学生信息
            $("#studentsUsername").click(function () {
                var table='<div style="margin: 0 auto;width: 800px;">' +
                    '<div style="padding-left: 35px;padding-bottom: 5px;color: #ffffff;font-size: 18px;height: 35px">' +
                    '<div style="float: left">学生用户名:<input style="color: #0f0f0f;height: 25px" id="studentUsername" type="text"></div>' +
                    '<div style="margin-left: 5px; float: left"><button onclick="selectStudentInformation()" style="color: #0f0f0f;height: 25px">提交</button></div></div>' +
                    '<table id="StudentsInformation" width="800" border="1" align="center" cellpadding="0" cellspacing="0">' +
                    '<tr><th>学生姓名</th><th>学生班级</th><th>用户名</th><th>用户密码</th><th>修改学生账号</th><th>注销账号</th></tr>' +
                    '<tr><td>***</td><td>***</td><td>***</td><td>***</td><td><i class="fa fa-pencil" aria-hidden="true"></i></td>' +
                    '<td><i class="fa fa-trash" aria-hidden="true"></i></td></tr>' +
                    '</table></div>'
              $("#section").html(table)
            })
            //学生用户名查询学生信息方法
            selectStudentInformation=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                    data:{
                        username:$("#studentUsername").val()
                    },
                    dataType: "json",
                    success: function (student) {
                         $("td").eq(0).text(student.studentName)
                        $("td").eq(1).text(student.studentClass)
                        $("td").eq(2).text(student.username)
                        $("td").eq(4).html('<i onclick="alterStudentInformation(\''+student.studentName+'\',\''+student.studentClass+'\',\''+student.username+'\',\''+student.password+'\')" class="fa fa-pencil" aria-hidden="true"></i>')
                        $("td").eq(5).html('<i onclick="deleteStudent2(\''+student.username+'\')" class="fa fa-trash" aria-hidden="true"></i>')
                    },
                    error:function () {
                        alert("用户不存在！！！")
                    }
                })
            }
            //换页方法
            trHideShow=function(){
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
                    trHideShow()
            }
            //末页
            lastPage=function(a,b){
                Start=$("select[name='page'] option:last-child").val()*a-b
                End=$("select[name='page'] option:last-child").val()*a
                $("select[name='page']").val($("select[name='page'] option:last-child").val())
                trHideShow()
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

            //成绩换页方法
            trHideShow2=function(){
                for (var i = 1; i < $("tr").length-1; i++) {
                    if(i<TetResultsStart||i>TetResultsEnd){
                        $('studentResults tr').eq(i).hide()
                    }else {
                        $('studentResults tr').eq(i).show()
                    }
                }
            }
            //成绩首页
            homePage2=function(a){
                TetResultsStart=1;
                TetResultsEnd=a;
                $("select[name='TetResultsPage']").val(1)
                trHideShow2()
            }
            //成绩末页
            lastPage2=function(a,b){
                TetResultsStart=$("select[name='TetResultsPage'] option:last-child").val()*a-b
                TetResultsEnd=$("select[name='TetResultsPage'] option:last-child").val()*a
                $("select[name='TetResultsPage']").val($("select[name='TetResultsPage'] option:last-child").val())
                trHideShow2()
            }
            //成绩上一页
            previousPage2=function (a) {
                if(TetResultsStart>1){
                    TetResultsStart-=a;
                    TetResultsEnd-=a;
                    $("select[name='TetResultsPage']").val($("select[name='TetResultsPage']").val()*1-1)
                    trHideShow2()
                }else {
                    alert("已经是第一页了！！！")
                }
            }
            //成绩下一页
            nextPage2=function (a) {
                if(($('studentResults tr').length-TetResultsEnd)>2){
                    TetResultsStart+=a;
                    TetResultsEnd+=a;
                    $("select[name='TetResultsPage']").val($("select[name='TetResultsPage']").val()*1+1)
                    trHideShow2()
                }else {
                    alert("已经是最后一页了！！！")
                }
            }
            //成绩切换页面
            switchPage2=function (Page,b,c) {
                TetResultsStart=b*Page-c
                TetResultsEnd=b*Page
                trHideShow2()
            }
             //切换班级
            switchClass1=function (name) {
             $.ajax({
                 url:"${pageContext.request.contextPath}/students/selectClassStudentsInformation",
                 data:{
                     studentClass:name
                 },
                 dataType: "json",
                 success: function (classstudents) {
                     var table='<tr><th>学生姓名</th><th>学生班级</th><th>用户名</th><th>用户密码</th>><th>查看成绩</th><th>修改学生账号</th><th>注销账号</th></tr>'
                     $(classstudents).each(function () {
                         table+='<tr><td>'+this.studentName+'</td><td>'+this.studentClass+'</td>' +
                             '<td>'+this.username+'</td><td>******</td>' +
                             '<td><i onclick="selectStudentResult(\''+this.studentId+'\',\''+this.studentName+'\')" class="fa fa-search-plus" aria-hidden="true"></i></td>' +
                             '<td><i onclick="alterStudentInformation(\''+this.studentName+'\',\''+this.studentClass+'\',\''+this.username+'\',\''+this.password+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                             '<td><i onclick="deleteStudent(\''+this.studentId+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                     })
                     table+='<tr><td style=";text-align: right;" colspan="7">' +
                         '<a onclick="homePage(10)" href="javascript:void(0)">首页</a>&emsp;' +
                         '<a onclick="previousPage(10)" href="javascript:void(0)">上一页</a>&emsp;' +
                         '<a onclick="nextPage(10)" href="javascript:void(0)">下一页</a>&emsp;' +
                         '<a onclick="lastPage(10,9)" href="javascript:void(0)">末页</a>&emsp;' +
                         '跳转到<select onchange="switchPage(this,10,9)" style="background-color: #ffffff"  name="page">'
                     Pages=0;
                     Start=1
                     End=10
                     for(var i=1;i<=(classstudents.length%10==0?0:1)+classstudents.length/10;i++){
                         table+='<option value="'+i+'">'+i+'</option>'
                         Pages++
                     }
                     table+='</select>页&emsp;共'+Pages+'页&emsp;'+classstudents.length+'条数据&emsp;&emsp;</td></tr>'
                     $("table").html(table)
                     trHideShow()
                 }
             })
            }
            //修改学生信息方法
            alterStudentInformation=function(studentName,studentClass,username,password) {
                $("#myModalLabel").text("学生用户信息修改页面")
                $("input[name='name']").val(studentName)
                $("input[name='studentClass']").val(studentClass)
                $("input[name='username']").val(username)
                $("input[name='password']").val(password)
                $("input[name='passwords']").val(password)
                $("#userClass").show()
                $("#alterInformationModal").modal("show")
           }
            //添加题目类型
            addTet=function(){
                if($("#addTetBtn").val()=="添加科目"){
                $("#Tet").html('<input id="tet" style="color: #0f0f0f;height: 25px"/>')
                    $("#addTetBtn").val("选择已有科目")
                }else {
                    selectTet();
                    var select='<select id="tet">'
                    $(Tet).each(function () {
                        select+='<option value="'+this+'">'+this+'</option>'
                    })
                    select+='</select>'
                    $("#Tet").html(select)
                    $("#addTetBtn").val("添加科目")
                }
            }
            //添加单选题
            $("#addmcs").click(function () {
                selectTet();
                var table='<div style="font-size: 18px;color: #ffffff;width: 868px;height: 35px;margin: 0 auto;">' +
                '<div style="margin-left: 35px;float: left">科目：<span id="Tet"><select id="tet">'
                $(Tet).each(function () {
                   table+='<option value="'+this+'">'+this+'</option>'
                })
                table+='</select></span></div><div style="margin-left: 5px; float: left"><input type="button" id="addTetBtn" onclick="addTet()" style="color: #0f0f0f;height: 25px" value="添加科目"/></div></div>'+
                    '<form><table width="868" border="1" align="center" cellpadding="0" cellspacing="0">'+
                '<tr><th>题目</th><td><textarea rows="6" cols="100" required name="mcsName" maxlength="2000"/></textarea></td></tr>'+
                '<tr><th>选项A</th><td><textarea rows="3" cols="100" required name="options1" maxlength="1000"/></textarea></td></tr>'+
                '<tr><th>选项B</th><td><textarea rows="3" cols="100" required name="options2" maxlength="1000"/></textarea></td></tr>'+
                '<tr><th>选项C</th><td><textarea rows="3" cols="100" required name="options3" maxlength="1000"/></textarea></td></tr>'+
                '<tr><th>选项D</th><td><textarea rows="3" cols="100" required name="options4" maxlength="1000"/></textarea></td></tr>'+
                '<tr><th>答案</th><td>A:<input type="radio" name="answer"  value="A"/>&nbsp;&nbsp;&nbsp;&nbsp;B:<input type="radio" name="answer" value="B"/>&nbsp;&nbsp;&nbsp;&nbsp;C:<input type="radio" name="answer" value="C"/>&nbsp;&nbsp;&nbsp;&nbsp;D:<input type="radio" name="answer" value="D"/> </td></tr>'+
                '<tr><td colspan="2"><input name="reset" style="width: 100px" type="reset" value="重置"/>&emsp;&emsp;&emsp;&emsp;&emsp;<input style="width: 100px" type="button" onclick="AddMcs()" value="提交"/></td>'+
                '</table></form>'
             $("#section").html(table)
            })
            //提交添加单选题
            AddMcs=function () {
                if($("#tet").val()==""){
                    alert("题目类型不允许为空！！！")
                }else if($("textarea[name='mcsName']").val()==""){
                    alert("题目不允许为空！！！")
                }else if($("textarea[name='options1']").val()==""||$("textarea[name='options2']").val()==""||$("textarea[name='options3']").val()==""||$("textarea[name='options4']").val()==""){
                    alert("选项不允许为空！！！")
                }else if($("input[name='answer']:checked").val()==""){
                    alert("答案不允许为空！！！")
                }else {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/mcs/addMcs",
                        data:{
                            tet: $("#tet").val(),
                            mcsName:$("textarea[name='mcsName']").val(),
                            options1:$("textarea[name='options1']").val(),
                            options2:$("textarea[name='options2']").val(),
                            options3:$("textarea[name='options3']").val(),
                            options4:$("textarea[name='options4']").val(),
                            answer:$("input[name='answer']:checked").val()
                        },
                        dataType: "json",
                        success: function (mcs) {
                            if(mcs!=0){
                                alert("添加成功")
                                $("input[name='reset']").click()
                            }else {
                                alert("添加失败，题目已存在")
                            }
                        }
                    })
                }
            }
            //添加应用题
            $("#addwps").click(function () {
                selectTet();
                var table='<div style="font-size: 18px;color: #ffffff;width: 868px;height: 35px;margin: 0 auto;">' +
                    '<div style="margin-left: 35px;float: left">科目：<select name="tet">'
                $(Tet).each(function () {
                    table+='<option value="'+this+'">'+this+'</option>'
                })
                table+='</select></div></div><form>' +
                    '<table width="868" border="1" align="center" cellpadding="0" cellspacing="0">'+
                    '<tr><th>应用题目</th><td><textarea rows="6" cols="100"  name="wpsName" required maxlength="2000"/></textarea></td></tr>'+
                    '<tr><th>答案</th><td><textarea rows="6" cols="100"  name="answer" required maxlength="2000"/></textarea></td></tr>'+
                    '<tr><td colspan="2"><input name="reset" style="width: 100px" type="reset" value="重置"/>' +
                    '&emsp;&emsp;&emsp;&emsp;&emsp;<input style="width: 100px" type="button" onclick="AddWps()" value="提交"/></td>'+
                    '</table></form>'
                $("#section").html(table)
            })
            //提交添加的应用题
            AddWps=function () {
                if($("textarea[name='wpsName']").val()==""){
                    alert("题目不允许为空！！！")
                }else if($("textarea[name='answer']").val()==""){
                    alert("答案不允许为空！！！")
                }else {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/wps/addWps",
                        data:{
                            tet: $("select[name='tet']").val(),
                            wpsName:$("textarea[name='wpsName']").val(),
                            answer: $("textarea[name='answer']").val()
                        },
                        dataType: "json",
                        success: function (wps) {
                            if(wps!=0){
                                alert("添加成功")
                                $("input[name='reset']").click()
                            }else {
                                alert("添加失败，题目已存在")
                            }
                        }
                    })
                }
            }
            //添加多选题
            $("#addmcq").click(function () {
                selectTet();
                var table='<div style="font-size: 18px;color: #ffffff;width: 868px;height: 35px;margin: 0 auto;">' +
                    '<div style="margin-left: 35px;float: left">科目：<select name="tet">'
                $(Tet).each(function () {
                    table+='<option value="'+this+'">'+this+'</option>'
                })
                table+='</select></div></div><form>' +
                    '<table width="868" border="1" align="center" cellpadding="0" cellspacing="0">'+
                    '<tr><th>题目</th><td><textarea rows="6" cols="100" required name="mcqName" maxlength="2000"/></textarea></td></tr>'+
                    '<tr><th>选项A</th><td><textarea rows="3" cols="100" required name="options1" maxlength="1000"/></textarea></td></tr>'+
                    '<tr><th>选项B</th><td><textarea rows="3" cols="100" required name="options2" maxlength="1000"/></textarea></td></tr>'+
                    '<tr><th>选项C</th><td><textarea rows="3" cols="100" required name="options3" maxlength="1000"/></textarea></td></tr>'+
                    '<tr><th>选项D</th><td><textarea rows="3" cols="100" required name="options4" maxlength="1000"/></textarea></td></tr>'+
                    '<tr><th>答案</th><td>A:<input type="checkbox" name="answer"  value="A"/>&nbsp;&nbsp;&nbsp;&nbsp;B:<input type="checkbox" name="answer" value="B"/>&nbsp;&nbsp;&nbsp;&nbsp;C:<input type="checkbox" name="answer" value="C"/>&nbsp;&nbsp;&nbsp;&nbsp;D:<input type="checkbox" name="answer" value="D"/> </td></tr>'+
                    '<tr><td colspan="2"><input name="reset" style="width: 100px" type="reset" value="重置"/>&emsp;&emsp;&emsp;&emsp;&emsp;<input style="width: 100px" type="button" onclick="AddMcq()" value="提交"/></td>'+
                    '</table></form>'
                $("#section").html(table)
            })
            //提交添加多选题
            AddMcq=function () {
                if($("textarea[name='mcqName']").val()==""){
                    alert("题目不允许为空！！！")
                }else if($("textarea[name='options1']").val()==""||$("textarea[name='options2']").val()==""||$("textarea[name='options3']").val()==""||$("textarea[name='options4']").val()==""){
                    alert("选项不允许为空！！！")
                }else if($("input[name='answer']:checked").length<2){
                    alert("答案不能少于2个！！！")
                }else {
                    var answer=''
                    $("input[name='answer']:checked").each(function () {
                        answer+=$(this).val()
                    })
                    $.ajax({
                        url:"${pageContext.request.contextPath}/mcq/addMcq",
                        data:{
                            tet: $("select[name='tet']").val(),
                            mcqName:$("textarea[name='mcqName']").val(),
                            options1:$("textarea[name='options1']").val(),
                            options2:$("textarea[name='options2']").val(),
                            options3:$("textarea[name='options3']").val(),
                            options4:$("textarea[name='options4']").val(),
                            answer:answer
                        },
                        dataType: "json",
                        success: function (mcs) {
                            if(mcs!=0){
                                alert("添加成功")
                                $("input[name='reset']").click()
                            }else {
                                alert("添加失败，题目已存在")
                            }
                        }
                    })
                }
            }
            //切换题目类型
            switchSubject=function (name) {
                if(name=="mcs"){
                    mcsInformation($("select[name='tet']").val())
                }else if(name=="mcq"){
                    mcqInformation($("select[name='tet']").val())
                }else {
                    wpsInformation($("select[name='tet']").val())
                }
            }
            //切换科目
            switchTet=function(name){
                if($("select[name='classes']").val()=="mcs"){
                    mcsInformation(name.value)
                }else if($("select[name='classes']").val()=="mcq"){
                    mcqInformation(name.value)
                }else {
                    wpsInformation(name.value)
                }
            }
            //单选题科目查询方法
            mcsInformation=function(tet){
                $.ajax({
                    url:"${pageContext.request.contextPath}/mcs/selectTetMcs",
                    dataType: "json",
                    data:{
                        tet:tet
                    },
                    async:false,
                    success: function (mcs) {
                        Start=1
                        End=5
                        var table='<tr><th>单选题题目</th><th>选项A</th><th>选项B</th><th>选项C</th><th>选项D</th><th style="width:50px">答案</th><th>修改题目</th><th>删除题目</th></tr>'
                        $(mcs).each(function () {
                            table+='<tr><td><textarea rows="4" cols="18">'+this.mcsName+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options1+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options2+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options3+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options4+'</textarea></td>' +
                                '<td>'+this.answer+'</td>' +
                                '<td><i onclick="alterSubject(\''+this.mcsId+'\',\''+this.tet+'\',\''+this.mcsName+'\',\''+this.options1+'\',' +
                                '\''+this.options2+'\',\''+this.options3+'\',\''+this.options4+'\',\''+this.answer+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                '<td><i onclick="deleteMcs(\''+this.mcsId+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                        })

                        table+='<tr><td style="text-align: right;" colspan="8">' +
                            '<a onclick="homePage(5)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(5)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(5)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(5,4)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select onchange="switchPage(this.value,5,4)" style="background-color: #ffffff" name="page">'
                        Pages=0;
                        for(var i=1;i<=(mcs.length%5==0?0:1)+mcs.length/5;i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+mcs.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                        $("table").html(table)
                        Start=1;
                        End=5
                        trHideShow()
                    }
                })
            }
            //多选题科目查询方法
            mcqInformation=function(tet){
                $.ajax({
                    url:"${pageContext.request.contextPath}/mcq/selectTetMcq",
                    dataType: "json",
                    data:{
                        tet:tet
                    },
                    async:false,
                    success: function (mcq) {
                        Start=1;
                        End=5
                        var table='<tr><th>多选题题目</th><th>选项A</th><th>选项B</th><th>选项C</th><th>选项D</th><th style="width:50px">答案</th><th>修改题目</th><th>删除题目</th></tr>'
                        $(mcq).each(function () {
                            table+='<tr><td><textarea rows="4" cols="18">'+this.mcqName+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options1+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options2+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options3+'</textarea></td>' +
                                '<td><textarea rows="4" cols="14">'+this.options4+'</textarea></td>' +
                                '<td>'+this.answer+'</td>' +
                                '<td><i onclick="alterSubject(\''+this.mcqId+'\',\''+this.tet+'\',\''+this.mcqName+'\',\''+this.options1+'\',' +
                                '\''+this.options2+'\',\''+this.options3+'\',\''+this.options4+'\',\''+this.answer+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                '<td><i onclick="deleteMcq(\''+this.mcqId+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                        })

                        table+='<tr><td style="text-align: right;" colspan="8">' +
                            '<a onclick="homePage(5)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(5)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(5)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(5,4)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select onchange="switchPage(this.value,5,4)" style="background-color: #ffffff" name="page">'
                        Pages=0;
                        for(var i=1;i<=(mcq.length%5==0?0:1)+mcq.length/5;i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+mcq.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                        $("table").html(table)
                        trHideShow()
                    }
                })
            }
            //应用题科目查询方法
            wpsInformation=function(tet){
                $.ajax({
                    url:"${pageContext.request.contextPath}/wps/selectTetWps",
                    dataType: "json",
                    data:{
                        tet:tet
                    },
                    async:false,
                    success: function (wps) {
                        Start=1
                        End=5
                        var table='<tr><th>应用题题目</th><th>答案</th><th>修改题目</th><th>删除题目</th></tr>'
                        $(wps).each(function () {
                            table+='<tr><td><textarea rows="4" cols="55">'+this.wpsName+'</textarea></td>' +
                                '<td><textarea rows="4" cols="35">'+this.answer+'</textarea></td>' +
                                '<td><i onclick="alterSubject1(\''+this.wpsId+'\',\''+this.tet+'\',\''+this.wpsName+'\',\''+this.answer+'\')" class="fa fa-pencil" aria-hidden="true"></i></td>' +
                                '<td><i onclick="deleteWps(\''+this.wpsId+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                        })

                        table+='<tr><td style="text-align: right;" colspan="8">' +
                            '<a onclick="homePage(5)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(5)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(5)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(5,4)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select onchange="switchPage(this.value,5,4)" style="background-color: #ffffff" name="page">'
                        Pages=0;
                        for(var i=1;i<=(wps.length%5==0?0:1)+wps.length/5;i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+wps.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                        $("table").html(table)
                        trHideShow()
                    }
                })
            }
            //题目模态框关闭
            $('#alterSubjectInformationModal').on('hide.bs.modal', function () {
                // 执行一些动作...
                $('#alterSubjectInformationBody').html('')
            })
            //成绩模态框关闭
            $('#selectStudentsResultsModel').on('hide.bs.modal', function () {
                // 执行一些动作...
                $('#myStudentsResultsBody').html('')
            })
            //查看所有题目
            $("#querySubjects").click(function () {
                var tet
                selectTet()
                var table='<div style="margin: 0 auto;width: 868px;">' +
                '<div style="float:left;padding-left: 35px;color: #ffffff;font-size: 18px;height: 30px">' +
                '题目类型：<select onchange="switchSubject(this.value)" name="classes">' +
                '<option value="mcs">单选题</option>' +
                '<option value="mcq">多选题</option>' +
                '<option value="wps">应用题</option>'+
               '</select>&emsp;科目：<select onchange="switchTet(this)" name="tet">'
                $.each(Tet,function (index,book) {
                    if(index==0){
                        tet=book
                    }
                    table+='<option value="'+book+'">'+book+'</option>'
                })
                table+='</select></div><table width="868" border="1" align="center" cellpadding="0" cellspacing="0">'
                $.ajax({
                    url:"${pageContext.request.contextPath}/mcs/selectTetMcs",
                    dataType: "json",
                    data:{
                        tet:tet
                    },
                    async:false,
                    success: function (mcs) {
                        Start=1
                        End=5
                        table+='<tr><th>单选题题目</th><th>选项A</th><th>选项B</th><th>选项C</th><th>选项D</th><th style="width:50px">答案</th><th>修改题目</th><th>删除题目</th></tr>'
                        $(mcs).each(function () {
                           table+='<tr><td><textarea rows="4" cols="18">'+this.mcsName+'</textarea></td>' +
                            '<td><textarea rows="4" cols="14">'+this.options1+'</textarea></td>' +
                            '<td><textarea rows="4" cols="14">'+this.options2+'</textarea></td>' +
                            '<td><textarea rows="4" cols="14">'+this.options3+'</textarea></td>' +
                            '<td><textarea rows="4" cols="14">'+this.options4+'</textarea></td>' +
                            '<td>'+this.answer+'</td>' +
                            '<td><i onclick="alterSubject(\''+this.mcsId+'\',\''+this.tet+'\',\''+this.mcsName+'\',\''+this.options1+'\',' +
                               '\''+this.options2+'\',\''+this.options3+'\',\''+this.options4+'\',\''+this.answer+'\',)" ' +
                               'class="fa fa-pencil" aria-hidden="true"></i></td>' +
                            '<td><i onclick="deleteMcs(\''+this.mcsId+'\')" class="fa fa-trash" aria-hidden="true"></i></td></tr>'
                        })

                        table+='<tr><td style="text-align: right;" colspan="8">' +
                            '<a onclick="homePage(5)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(5)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(5)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(5,4)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select onchange="switchPage(this.value,5,4)" style="background-color: #ffffff" name="page">'
                        Pages=0;
                        for(var i=1;i<=(mcs.length%5==0?0:1)+mcs.length/5;i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+mcs.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                    }
                })
                $("#section").html(table)
                trHideShow()
            })
            //弹出选择题题目修改模态框
            alterSubject=function (Id,tet,Name,options1,options2,options3,options4,answer) {
                if($("select[name='classes']").val()=="mcs") {
                    $("#mySubjectModalLabel").text("单选题修改页面")
                    selectTet()
                    var table = '<form>' +
                        '<div style="font-size: 18px;width: 500px;height: 35px;margin: 0 auto;">' +
                        '<div style="margin-left: 35px;float: left">科目：<span id="Tet"><select id="tet">'
                    $(Tet).each(function () {
                        table += '<option value="' + this + '">' + this + '</option>'
                    })
                    table += '</select></span></div><div style="margin-left: 5px; float: left"><input type="button" id="addTetBtn" onclick="addTet()" style="color: #0f0f0f;height: 25px" value="添加科目"/></div></div>' +
                        '<table width="500" border="1" align="center" cellpadding="0" cellspacing="0">' +
                        '<tr><th>题目</th><td><textarea rows="6" cols="54" required name="mcsName" maxlength="2000"/></textarea></td></tr>' +
                        '<tr><th>选项A</th><td><textarea rows="3" cols="54" required name="options1" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>选项B</th><td><textarea rows="3" cols="54" required name="options2" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>选项C</th><td><textarea rows="3" cols="54" required name="options3" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>选项D</th><td><textarea rows="3" cols="54" required name="options4" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>答案</th><td>A:<input type="radio" name="answer"  value="A"/>&nbsp;&nbsp;&nbsp;&nbsp;B:<input type="radio" name="answer" value="B"/>&nbsp;&nbsp;&nbsp;&nbsp;C:<input type="radio" name="answer" value="C"/>&nbsp;&nbsp;&nbsp;&nbsp;D:<input type="radio" name="answer" value="D"/> </td></tr>' +
                        '<tr><td colspan="2"><input name="reset" style="width: 100px" type="reset" value="重置"/>&emsp;&emsp;&emsp;&emsp;&emsp;<input style="width: 100px" type="button" onclick="alterMcs(' + Id + ')" value="提交"/></td>' +
                        '</table></form>'
                    $("#alterSubjectInformationBody").html(table)
                    $("#tet").val(tet)
                    $("textarea[name='mcsName']").val(Name)
                    $("textarea[name='options1']").val(options1)
                    $("textarea[name='options2']").val(options2)
                    $("textarea[name='options3']").val(options3)
                    $("textarea[name='options4']").val(options4)
                    $("input:radio[name='answer'][value=" + answer + "]").prop("checked", true);
                    $("#alterSubjectInformationModal").modal("show")
                }else {
                    $("#mySubjectModalLabel").text("多选题修改页面")
                    selectTet()
                    var table = '<form>' +
                        '<div style="font-size: 18px;width: 500px;height: 35px;margin: 0 auto;">' +
                        '<div style="margin-left: 35px;float: left">科目：<select name="tet">'
                    $(Tet).each(function () {
                        table += '<option value="' + this + '">' + this + '</option>'
                    })
                    table += '</select></div></div>' +
                        '<table width="500" border="1" align="center" cellpadding="0" cellspacing="0">' +
                        '<tr><th>题目</th><td><textarea rows="6" cols="54" required name="mcqName" maxlength="2000"/></textarea></td></tr>' +
                        '<tr><th>选项A</th><td><textarea rows="3" cols="54" required name="options1" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>选项B</th><td><textarea rows="3" cols="54" required name="options2" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>选项C</th><td><textarea rows="3" cols="54" required name="options3" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>选项D</th><td><textarea rows="3" cols="54" required name="options4" maxlength="1000"/></textarea></td></tr>' +
                        '<tr><th>答案</th><td>A:<input type="checkbox" name="answer"  value="A"/>&nbsp;&nbsp;&nbsp;&nbsp;B:<input type="checkbox" name="answer" value="B"/>&nbsp;&nbsp;&nbsp;&nbsp;C:<input type="checkbox" name="answer" value="C"/>&nbsp;&nbsp;&nbsp;&nbsp;D:<input type="checkbox" name="answer" value="D"/> </td></tr>' +
                        '<tr><td colspan="2"><input name="reset" style="width: 100px" type="reset" value="重置"/>&emsp;&emsp;&emsp;&emsp;&emsp;<input style="width: 100px" type="button" onclick="alterMcq(' + Id + ')" value="提交"/></td>' +
                        '</table></form>'
                    $("#alterSubjectInformationBody").html(table)
                    $("select[name='tet']").val(tet)
                    $("textarea[name='mcqName']").val(Name)
                    $("textarea[name='options1']").val(options1)
                    $("textarea[name='options2']").val(options2)
                    $("textarea[name='options3']").val(options3)
                    $("textarea[name='options4']").val(options4)
                    for (var i = 0; i < answer.length; i++) {
                        $("input:checkbox[name='answer'][value=" + answer.charAt(i) + "]").prop("checked", true)
                    }
                    $("#alterSubjectInformationModal").modal("show")
                }
            }
            //提交修改单选题题目
            alterMcs=function (mcsId) {
                if($("#tet").val()==""){
                    alert("题目类型不允许为空！！！")
                }else if($("textarea[name='mcsName']").val()==""){
                    alert("题目不允许为空！！！")
                }else if($("textarea[name='options1']").val()==""||$("textarea[name='options2']").val()==""||$("textarea[name='options3']").val()==""||$("textarea[name='options4']").val()==""){
                    alert("选项不允许为空！！！")
                }else if($("input[name='answer']:checked").val()==""){
                    alert("答案不允许为空！！！")
                }else {
              $.ajax({
                  url:"${pageContext.request.contextPath}/mcs/alterMcs",
                  dataType: "json",
                  data:{
                      mcsId:mcsId,
                      tet:$("#tet").val(),
                      mcsName:$("textarea[name='mcsName']").val(),
                      options1:$("textarea[name='options1']").val(),
                      options2:$("textarea[name='options2']").val(),
                      options3:$("textarea[name='options3']").val(),
                      options4:$("textarea[name='options4']").val(),
                      answer:$("input[name='answer']:checked").val()
                  },
                  async:false,
                  success: function (data){
                      if(data!=0){
                          alert("修改成功")
                          $("#alterSubjectInformationModal").modal("hide")
                         var page=$("select[name='page']").val()
                          switchSubject("mcs")
                          if($("select[name='page'] option:last-child").val()<page){
                              switchPage($("select[name='page'] option:last-child").val(),10,9)
                              $("select[name='page']").val($("select[name='page'] option:last-child").val())
                          }else {
                          switchPage(page,10,9)
                         $("select[name='page']").val(page)
                          }
                      }else {
                          alert("修改失败,题目已存在！！！")
                      }
                  }
              })
             }
            }
            //提交修改多选题题目
            alterMcq=function(mcqId){
                if($("textarea[name='mcqName']").val()==""){
                    alert("题目不允许为空！！！")
                }else if($("textarea[name='options1']").val()==""||$("textarea[name='options2']").val()==""||$("textarea[name='options3']").val()==""||$("textarea[name='options4']").val()==""){
                    alert("选项不允许为空！！！")
                }else if($("input[name='answer']:checked").length<2){
                    alert("答案不能少于2个！！！")
                }else {
                var answer=''
                $("input[name='answer']:checked").each(function () {
                    answer+=$(this).val()
                })
                $.ajax({
                    url:"${pageContext.request.contextPath}/mcq/alterMcq",
                    dataType: "json",
                    data:{
                        mcqId:mcqId,
                        tet:$("select[name='tet']").val(),
                        mcqName:$("textarea[name='mcqName']").val(),
                        options1:$("textarea[name='options1']").val(),
                        options2:$("textarea[name='options2']").val(),
                        options3:$("textarea[name='options3']").val(),
                        options4:$("textarea[name='options4']").val(),
                        answer:answer
                    },
                    success: function (data){
                        if(data!=0){
                            alert("修改成功")
                            $("#alterSubjectInformationModal").modal("hide")
                            var page=$("select[name='page']").val()
                            switchSubject("mcq")
                            if($("select[name='page'] option:last-child").val()<page){
                                switchPage($("select[name='page'] option:last-child").val(),10,9)
                                $("select[name='page']").val($("select[name='page'] option:last-child").val())
                            }else {
                                switchPage(page,10,9)
                                $("select[name='page']").val(page)
                            }
                        }else {
                            alert("修改失败,题目已存在！！！")
                        }
                    }
                })
                }
            }
            //弹出应用题修改模态框
            alterSubject1=function (wpsId,tet,wpsName,answer) {
                $("#mySubjectModalLabel").text("应用题修改页面")
                selectTet()
                var table='<form>' +
                    '<div style="font-size: 18px;width: 500px;height: 35px;margin: 0 auto;">' +
                    '<div style="margin-left: 35px;float: left">科目：<select name="tet">'
                $(Tet).each(function () {
                    table+='<option value="'+this+'">'+this+'</option>'
                })
                table+='</select></div></div>'+
                    '<table width="500" border="1" align="center" cellpadding="0" cellspacing="0">'+
                    '<tr><th>应用题目</th><td><textarea rows="8" cols="54"  name="wpsName" required maxlength="2000"/></textarea></td></tr>'+
                    '<tr><th>答案</th><td><textarea rows="6" cols="54"  name="answer" required maxlength="2000"/></textarea></td></tr>'+
                    '<tr><td colspan="2"><input name="reset" style="width: 100px" type="reset" value="重置"/>' +
                    '&emsp;&emsp;&emsp;&emsp;&emsp;<input style="width: 100px" type="button" onclick="alterWps('+wpsId+')" value="提交"/></td>'+
                    '</table></form>'
                    $("#alterSubjectInformationBody").html(table)
                $("select[name='tet']").val(tet)
                $("textarea[name='wpsName']").val(wpsName)
                $("textarea[name='answer']").val(answer)
                $("#alterSubjectInformationModal").modal("show")
            }
            //提交修改应用题
            alterWps=function (wpsId) {
                if($("textarea[name='wpsName']").val()==""){
                    alert("题目不允许为空！！！")
                }else if($("textarea[name='answer']").val()==""){
                    alert("答案不允许为空！！！")
                }else {
                $.ajax({
                    url:"${pageContext.request.contextPath}/wps/alterWps",
                    dataType: "json",
                    data:{
                        wpsId:wpsId,
                        tet: $("select[name='tet']").val(),
                        wpsName:$("textarea[name='wpsName']").val(),
                        answer: $("textarea[name='answer']").val()
                    },
                    success: function (data){
                        if(data!=0){
                            alert("修改成功")
                            $("#alterSubjectInformationModal").modal("hide")
                            var page=$("select[name='page']").val()
                            switchSubject("wps")
                            if($("select[name='page'] option:last-child").val()<page){
                                switchPage($("select[name='page'] option:last-child").val(),5,4)
                                $("select[name='page']").val($("select[name='page'] option:last-child").val())
                            }else {
                                switchPage(page,5,4)
                                $("select[name='page']").val(page)
                            }
                        }else {
                            alert("修改失败,题目已存在！！！")
                        }
                    }
                })
                }
            }
            //切换待阅卷科目
            switchTetPwps=function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/pwps/selectTetPwpss",
                    dataType: "json",
                    data:{
                        tet:$("select[name='tet']").val()
                    },
                    success:function (data) {
                        Start=1
                        End=5
                       var table='<tr><th>题目</th><th>学生答案</th><th>参考答案</th><th>打分</th></tr>'
                        $(data).each(function () {
                            table+='<tr><td><textarea rows="4" cols="28">'+this.wps.wpsName+'</textarea></td>' +
                                '<td><textarea rows="4" cols="28">'+this.answers+'</textarea></td>' +
                                '<td><textarea rows="4" cols="28">'+this.wps.answer+'</textarea></td>' +
                                '<td style="width: 70px"><i onclick="score(\''+this.pwpsId+'\',\''+this.resultsId+'\')" class="fa fa-pencil" aria-hidden="true"></i></td></tr>'
                        })
                        table+='<tr><td style="text-align: right;" colspan="4">' +
                            '<a onclick="homePage(5)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(5)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(5)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(5,4)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select onchange="switchPage(this.value,5,4)" style="background-color: #ffffff" name="page">'
                        Pages=0;

                        for(var i=1;i<=data.length/5+(data.length%5==0?0:1);i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+data.length+'条数据&emsp;&emsp;</td></tr>'
                        $("table").html(table)
                        trHideShow()
                    }
                })
            }
            //获取待阅卷题目类型
            selectPwpsTet=function(){
                 $.ajax({
                     url:"${pageContext.request.contextPath}/pwps/selectPwpsTet",
                     dataType: "json",
                     async:false,
                     success:function (data) {
                         Tet=data
                     }
                 })
            }
            //查看未阅卷题目方法
            $("#selectWpwss").click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/pwps/selectTetPwpss",
                    dataType: "json",
                    data:{
                        tet:"all"
                    },
                    success:function (data) {
                        selectPwpsTet()
                        Start=1
                        End=5
                        var table='<div style="margin: 0 auto;width: 800px;">' +
                            '<div style="padding-left: 35px;color: #ffffff;font-size: 18px;height: 30px">' +
                            '选择科目：<select onchange="switchTetPwps()" name="tet"><option value="all">全部科目</option>'
                        $(Tet).each(function () {
                            table+='<option value="'+this+'">'+this+'</option>'
                        })
                        table+='</select></div>' +
                            '<table  width="800" border="1" align="center" cellpadding="0" cellspacing="0">'+
                            '<tr><th>题目</th><th>学生答案</th><th>参考答案</th><th>打分</th></tr>'
                        $(data).each(function () {
                            table+='<tr><td><textarea rows="4" cols="28">'+this.wps.wpsName+'</textarea></td>' +
                                '<td><textarea rows="4" cols="28">'+this.answers+'</textarea></td>' +
                                '<td><textarea rows="4" cols="28">'+this.wps.answer+'</textarea></td>' +
                                '<td style="width: 70px"><i onclick="score(\''+this.pwpsId+'\',\''+this.resultsId+'\')" class="fa fa-pencil" aria-hidden="true"></i></td></tr>'
                        })
                        table+='<tr><td style="text-align: right;" colspan="4">' +
                            '<a onclick="homePage(5)" href="javascript:void(0)">首页</a>&emsp;' +
                            '<a onclick="previousPage(5)" href="javascript:void(0)">上一页</a>&emsp;' +
                            '<a onclick="nextPage(5)" href="javascript:void(0)">下一页</a>&emsp;' +
                            '<a onclick="lastPage(5,4)" href="javascript:void(0)">末页</a>&emsp;' +
                            '跳转到<select onchange="switchPage(this.value,5,4)" style="background-color: #ffffff" name="page">'
                        Pages=0;

                        for(var i=1;i<=data.length/5+(data.length%5==0?0:1);i++){
                            table+='<option value="'+i+'">'+i+'</option>'
                            Pages++
                        }
                        table+='</select>页&emsp;共'+Pages+'页&emsp;'+data.length+'条数据&emsp;&emsp;</td></tr></table></div>'
                        $("#section").html(table)
                        trHideShow()
                    }
                })
            })
            //打分方法
            score=function (pwps_id,results_id) {
                var wps=prompt("请输入你的打分的分数：")
               if(!isNaN(wps)&&1<=wps.length&&wps.length<=2&&wps>=0&&wps<=20){
                  $.ajax({
                      url:"${pageContext.request.contextPath}/pwps/alterPwpsTf",
                      dataType: "json",
                      data:{
                          pwpsId:pwps_id
                      },
                      success:function (data) {
                        if(data!=0){
                            $.ajax({
                                url:"${pageContext.request.contextPath}/result/alterResult",
                                dataType: "json",
                                data:{
                                    resultId:results_id,
                                    wps:wps
                                },
                                success:function (data) {
                                    if(data!=0){
                                        var page=$("select[name='page']").val()
                                        switchTetPwps()
                                        if($("select[name='page'] option:last-child").val()<page){
                                            switchPage($("select[name='page'] option:last-child").val(),5,4)
                                            $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                        }else {
                                            switchPage(page,5,4)
                                            $("select[name='page']").val(page)
                                        }
                                    }
                                }
                            })
                        }
                      }
                  })
               }else {
                   alert('打分只能是0-20之间的数字')
               }
            }
            //删除学生成绩方法
            deleteStudentResult=function () {
                var password=prompt("请输入教师密码验证身份：")
                if(password=='${teacher.password}'){
                     $.ajax({
                         url:"${pageContext.request.contextPath}/result/deleteStudentResult",
                         dataType: "json",
                         data:{
                             resultId:StudentResultId
                         },
                         success:function (data) {
                                 if(data!=0){
                                     var TetResultsPages=$("select[name='TetResultsPages']").val()
                                     switchTetResults(StudentsId)
                                     if($("select[name='TetResultsPages'] option:last-child").val()<TetResultsPages){
                                         switchPage2($("select[name='TetResultsPages'] option:last-child").val(),10,9)
                                         $("select[name='TetResultsPages']").val($("select[name='TetResultsPages'] option:last-child").val())
                                     }else {
                                         switchPage2(TetResultsPages,10,9)
                                         $("select[name='TetResultsPages']").val(TetResultsPages)
                                     }
                                 alert('删除成功')
                             }
                         }
                     })
                }else {
                    alert('密码错误')
                }
            }
            //删除应用题
            deleteWps=function (wpsId) {
                var r = confirm("是否删除该应用题");
                if (r == true) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/wps/deleteWps",
                            dataType: "json",
                            data:{
                                wpsId:wpsId
                            },
                            success:function (data) {
                                if(data!=0){
                                    alert("删除成功")
                                    var page=$("select[name='page']").val()
                                    switchSubject("wps")
                                    if($("select[name='page'] option:last-child").val()<page){
                                        switchPage($("select[name='page'] option:last-child").val(),5,4)
                                        $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                    }else {
                                        switchPage(page,5,4)
                                        $("select[name='page']").val(page)
                                    }
                                }else {
                                    alert("删除失败")
                                }
                            }
                        })
                }
            }
            //删除单选题
            deleteMcs=function (mcsId) {
                var r = confirm("是否删除该单选题");
                if (r == true) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/mcs/deleteMcs",
                        dataType: "json",
                        data:{
                            mcsId:mcsId
                        },
                        success:function (data) {
                            if(data!=0){
                                alert("删除成功")
                                var page=$("select[name='page']").val()
                                switchSubject("mcs")
                                if($("select[name='page'] option:last-child").val()<page){
                                    switchPage($("select[name='page'] option:last-child").val(),5,4)
                                    $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                }else {
                                    switchPage(page,5,4)
                                    $("select[name='page']").val(page)
                                }
                            }else {
                                alert("删除失败")
                            }
                        }
                    })
                }
            }
            //删除多选题
            deleteMcq=function (mcqId) {
                var r = confirm("是否删除该单选题");
                if (r == true) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/mcq/deleteMcq",
                        dataType: "json",
                        data:{
                            mcqId:mcqId
                        },
                        success:function (data) {
                            if(data!=0){
                                alert("删除成功")
                                var page=$("select[name='page']").val()
                                switchSubject("mcq")
                                if($("select[name='page'] option:last-child").val()<page){
                                    switchPage($("select[name='page'] option:last-child").val(),5,4)
                                    $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                }else {
                                    switchPage(page,5,4)
                                    $("select[name='page']").val(page)
                                }
                            }else {
                                alert("删除失败")
                            }
                        }
                    })
                }
            }
            //删除学生账号
            deleteStudent=function (username) {
                var password=prompt("请输入教师密码验证身份：")
                if(password=='${teacher.password}'){
                var r = confirm("是否删除该学生账号");
                if (r == true) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                        data:{
                            username:username
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
                                dataType: "json",
                                data:{
                                    studentId:student.studentId
                                },
                                success:function (data) {
                                    if(data!=0){
                                        alert("删除成功")
                                        var page=$("select[name='page']").val()
                                        selectStudentClass();
                                        var Classes=$("select[name='classes']").val()
                                        var  Select='<option value="all">全部班级</option>'
                                        $(Class).each(function () {
                                            Select+='<option value="'+this+'">'+this+'</option>'
                                        })
                                        $("select[name='classes']").html(Select)
                                        $("select[name='classes']").val(Classes)
                                        if($("select[name='classes']").val()!=null){
                                            switchClass1($("select[name='classes']").val())
                                        }else {
                                            $("select[name='classes']").val('all')
                                            switchClass1($("select[name='classes']").val())
                                        }
                                        if($("select[name='page'] option:last-child").val()<page){
                                            switchPage($("select[name='page'] option:last-child").val(),10,9)
                                            $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                        }else {
                                            switchPage(page,10,9)
                                            $("select[name='page']").val(page)
                                        }
                                    }else {
                                        alert("删除失败")
                                    }
                                }
                            })
                        }
                    })
                }
                }else {
                    alert('密码错误')
                }
            }
            //删除个人学生账号
            deleteStudent2=function (username) {
                var password=prompt("请输入教师密码验证身份：")
                if(password=='${teacher.password}'){
                    var r = confirm("是否删除该学生账号");
                    if (r == true) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/students/selectStudentInformation",
                            data:{
                                username:username
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
                                            alert("删除成功")
                                            $("#studentsUsername").click()
                                        }else {
                                            alert("删除失败")
                                        }
                                    }
                                })
                            }
                        })
                    }
                }else {
                    alert('密码错误')
                }
            }
            //删除教师账号
            deleteTeacher=function (teacherId) {
                var password=prompt("请输入管理员密码验证身份：")
                if(password=='${teacher.password}'){
                    var r = confirm("是否删除该教师账号");
                    if (r == true) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/teachers/deleteTeacher",
                            dataType: "json",
                            data:{
                                teacherId:teacherId
                            },
                            success:function (data) {
                                if(data!=0){
                                    alert("删除成功")
                                    var page=$("select[name='page']").val()
                                    selectTeacherInformation()
                                    if($("select[name='page'] option:last-child").val()<page){
                                        switchPage($("select[name='page'] option:last-child").val(),10,9)
                                        $("select[name='page']").val($("select[name='page'] option:last-child").val())
                                    }else {
                                        switchPage(page,10,9)
                                        $("select[name='page']").val(page)
                                    }
                                }else {
                                    alert("删除失败")
                                }
                            }
                        })
                    }
                }else {
                    alert('密码错误')
                }
            }
            //删除个人教师账号
            deleteTeacher2=function (teacherId) {
                var password=prompt("请输入管理员密码验证身份：")
                if(password=='${teacher.password}'){
                    var r = confirm("是否删除该教师账号");
                    if (r == true) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/teachers/deleteTeacher",
                            dataType: "json",
                            data:{
                                teacherId:teacherId
                            },
                            success:function (data) {
                                if(data!=0){
                                    alert("删除成功")
                                    teachersUsername()
                                }else {
                                    alert("删除失败")
                                }
                            }
                        })
                    }
                }else {
                    alert('密码错误')
                }
            }
            //注销账号
            $("#deleteUser").click(function () {
                var password=prompt("请输入教师密码验证身份：")
                if(password=='${teacher.password}'){
                    var r = confirm("是否注销该账号");
                    if (r == true) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/teachers/selectTeacherInformation",
                            data:{
                                username:'${teacher.username}'
                            },
                            dataType: "json",
                            success: function (teacher) {
                                $.ajax({
                                    url:"${pageContext.request.contextPath}/teachers/deleteTeacher",
                                    dataType: "json",
                                    data:{
                                        teacherId:teacher.teacherId
                                    },
                                    success:function (data) {
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
<div class="modal fade"  id="selectStudentsResultsModel"> <!-- modal使模态框隐藏-->
    <div class="modal-dialog"  style="width: 888px;"><!-- modal-dialog改变模态框的样式大小-->
        <div class="modal-content" ><!-- modal-content改变模态框的透明度-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myStudentsResultsModel"></h4>
            </div>
            <div class="modal-body" style="height: 555px;" id="myStudentsResultsBody">

            </div>
        </div>
    </div>
</div>

<div class="modal fade"  id="alterStudentResult"> <!-- modal使模态框隐藏-->
    <div class="modal-dialog"  style="width: 888px;"><!-- modal-dialog改变模态框的样式大小-->
        <div class="modal-content" ><!-- modal-content改变模态框的透明度-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myalterStudentResultModel">修改学生考试成绩</h4>
            </div>
            <div class="modal-body" style="height: 555px;" >
                <form>
                    <div class="form-group has-error">
                        <label class="control-label">
                            单选题成绩:
                        </label>
                        <div>
                            <input type="text" name="mcsResult" autocomplete="off" class="form-control">
                        </div>
                        <span id="mcsResult"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            多选题成绩:
                        </label>
                        <div>
                            <input type="text" name="mcqResult" autocomplete="off"  class="form-control">
                        </div>
                        <span id="mcqResult"></span>
                    </div>
                    <div class="form-group has-error">
                        <label class="control-label">
                            应用题成绩:
                        </label>
                        <div>
                            <input type="text" name="wpsResult" autocomplete="off" class="form-control">
                        </div>
                        <span id="wpsResult"></span>
                    </div>
                    <div id="div5">
                        <button type="reset" class="btn">清空信息</button>&emsp;&emsp;&emsp;&emsp;
                        <button id="submitAlterStudentResult" type="button" class="btn">提交信息</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="alterInformationModal"> <!-- modal使模态框隐藏-->
    <div class="modal-dialog"><!-- modal-dialog改变模态框的样式大小-->
        <div class="modal-content"><!-- modal-content改变模态框的透明度-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel">老师用户信息修改页面</h4>
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
                            <input type="text" name="username" value="${teacher.username}" autocomplete="off" disabled="disabled" class="form-control">
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
                        <button id="submitAlterInformation" type="button" class="btn">提交信息</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="alterSubjectInformationModal"> <!-- modal使模态框隐藏-->
    <div class="modal-dialog"><!-- modal-dialog改变模态框的样式大小-->
        <div class="modal-content"><!-- modal-content改变模态框的透明度-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="mySubjectModalLabel">选择题修改页面</h4>
            </div>
            <div id="alterSubjectInformationBody" class="modal-body">

            </div>
        </div>
    </div>
</div>

<div id="div1">
    <div id="header" class="align-self-center mx-auto" style="background-image: url(${pageContext.request.contextPath}/static/img/examtop.jpg)">
        <div style="padding-top: 10px"><h1 >OBTK考试系统教师界面</h1></div>
    </div>
    <div id="nav">
        <div class="nav" id="li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <i class="fa fa-angle-double-right" id="i1" aria-hidden="true"></i> 用户管理
        </div >
        <div onclick="teacherInformation()" class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            用户信息
        </div>
        <div id="deleteUser" class="nav li1" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            注销账号
        </div>
        <div class="nav" id="li2" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <i class="fa fa-angle-double-right" id="i2" aria-hidden="true"></i> 学生信息管理
        </div>
        <div id="selectStudentsInformation" class="nav li2" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            查询所有学生信息
        </div>
        <div id="studentsUsername" class="nav li2" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
           查询学生个人信息
        </div>
        <div class="nav" id="li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <i class="fa fa-angle-double-right" id="i3" aria-hidden="true"></i> 题库管理
        </div>
        <div id="querySubjects" class="nav li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            查看所有题目
        </div>
        <div id="addmcs" class="nav li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            添加单选题
        </div>
        <div id="addmcq" class="nav li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            添加多选题
        </div>
        <div id="addwps" class="nav li3" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            添加应用题
        </div>
        <div class="nav" id="li4" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <i class="fa fa-angle-double-right" id="i4" aria-hidden="true"></i> 未审核试卷
        </div>
        <div class="nav li4" id="selectWpwss" style="background-image: url(${pageContext.request.contextPath}/static/img/btn1.jpg)">
            待阅卷
        </div>
        <div class="nav" style="background-image: url(${pageContext.request.contextPath}/static/img/btn.jpg)">
            <a style="color:#2e6da4" href="${pageContext.request.contextPath}/login.jsp">登出</a>
        </div>
    </div>
    <div id="section" style="background-image: url(${pageContext.request.contextPath}/static/img/section.jpg)">
    </div>
</div>
</body>
</html>
