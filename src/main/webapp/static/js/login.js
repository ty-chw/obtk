$(function(){
	//获取相对路径
	var pathName=window.document.location.pathname;
    //截取，得到项目名称
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	$("#MyStudentmodal").modal({
  		 	show:false,
  		 	backdrop:'static'
  		 })
  		 $("#btn1").click(function(){
		 	if($(this).val()=="学生注册"){
		 	 $("#myModalLabel").text("学生注册页面")
				$("#userClass").show()
				$("#MyStudentmodal").modal("show")
		 	}else{
		 	$.ajax({
				url:projectName+"/teachers/selectTeacherInformation",
				data:{
					username:"admin"
				},
				success:function (teacher) {
					var password=prompt("请输入你的管理员密码：")
					if(password==teacher.password){
						$("#myModalLabel").text("教师注册页面")
							$("#userClass").hide()
						$("#MyStudentmodal").modal("show")
					}else {
						if(password!=null){
							alert("管理员密码错误")
						}
					}
				}
			})
		 	}
		 	$("input[name='name']").val("")
			$("input[name='studentClass']").val("")
		 	$("input[name='username']").val("")
		 	$("input[name='password']").val("")
		 	$("input[name='passwords']").val("")
		 	$("#name").text("")
			$("#studentClass").text("")
		 	$("#username").text("")
		 	$("#password").text("")
		 	$("#passwords").text("")
  		 })
  		$("#div1").click(function(){
  			$("#div1").css("background-color","rgba(255,255,255,0)")
  			$("#div2").css("background-color","rgba(255,255,255,1)")
  			$("#btn1").val("学生注册")
  			$("#btn2").val("学生登录")
  		})
  		$("#div2").click(function(){
  			$("#div2").css("background-color","rgba(255,255,255,0)")
  			$("#div1").css("background-color","rgba(255,255,255,1)")
  			$("#btn1").val("教师注册")
  			$("#btn2").val("教师登录")
  		})
  		function onfocusBlur() {
		$("input[name='studentClass']").focus()
		$("input[name='studentClass']").blur()
        $("input[name='name']").focus()
        $("input[name='name']").blur()
        $("input[name='username']").focus()
        $("input[name='username']").blur()
        $("input[name='password']").focus()
        $("input[name='password']").blur()
        $("input[name='passwords']").focus()
        $("input[name='passwords']").blur()
    }
    function spans() {
        if($("#name").text()!=""||$("#username").text()!=""||$("#password").text()!=""||$("#passwords").text()!=""){
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

        //学生姓名的输入规范
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

  		//登录名的输入规范
  		$("input[name='username']").blur(function(){
  		//要求输入内容规范
  		var Reg = /^[0-9a-zA-Z]*$/g;
        var Text="用户名只能由数字和字母组成"
        var ErrorIdText="用户名长度为2-12"
        onblurError(this,Reg,$("#username"),Text,ErrorIdText)
  		})
  		$("input[name='username']").focus(function(){
  			onfocusError($(this),$("#username"))
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
        function onfocusBlur1() {
			$("#usernameID").focus()
			$("#usernameID").blur()
			$("#passwordID").focus()
			$("#passwordID").blur()
        }
        function spans1() {
        	if($("#usernameErrorID").text()!=""||$("#passwordErrorID").text()!=""){
        		return false
        	}
        	return true
        }
		//登录名的输入规范
  		$("#usernameID").blur(function(){
  		//要求输入内容规范
  		var Reg = /^[0-9a-zA-Z]*$/g;
        var Text="用户名只能由数字和字母组成"
        var ErrorIdText="用户名长度为2-12"
        onblurError(this,Reg,$("#usernameErrorID"),Text,ErrorIdText)
  		})
  		$("#usernameID").focus(function(){
  			onfocusError($(this),$("#usernameErrorID"))
  		})

  		//密码的输入规范
  		$("#passwordID").blur(function(){
  		//要求输入内容规范
  		var Reg = /^[0-9a-zA-Z]*$/g;
        var Text="密码只能由数字和字母组成"
        var ErrorIdText="密码长度为2-12"
        onblurError(this,Reg,$("#passwordErrorID"),Text,ErrorIdText)
  		})
  		$("#passwordID").focus(function(){
  			onfocusError($(this),$("#passwordErrorID"))
  		})

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
        $("#passwordEyeID").click(function(){
			eye($("#passwordID"),$(this))
		})
	    //回车方式登录
	    document.onkeydown=function(event){
	    	if(event.keyCode==13) {
	    		    if($("#MyStudentmodal").css("display")=="none"){
					onfocusBlur1()
					if(spans1()){
						$("#btn2").click()
					}
			 }
	    	}
	    }
       // 注册判断
	  $("#registered").click(function () {
		  onfocusBlur()
		  if(spans()){
		  	if($("#myModalLabel").text()=="学生注册页面") {
				if($("#studentClass").text()==""){
					$.ajax({
						url: projectName + "/students/addStudent",
						data: {
							studentName: $("input[name='name']").val(),
							studentClass: $("input[name='studentClass']").val(),
							username: $("input[name='username']").val(),
							password: $("input[name='password']").val()
						},
						dataType: "json",
						success: function (data) {
							if (data == 0) {
								alert("注册失败，用户名已存在")
							} else {
								alert("注册成功")
								$("#MyStudentmodal").modal("hide")
								$("#usernameID").val($("input[name='username']").val())
								$("#passwordID").val($("input[name='password']").val())
							}
						}
					})
				}
			}else {
				$.ajax({
					url: projectName+"/teachers/addTeacher",
					data: {
						teacherName: $("input[name='name']").val(),
						username: $("input[name='username']").val(),
						password: $("input[name='password']").val()
					},
					dataType: "json",
					success: function (data) {
						if (data == 0) {
							alert("注册失败，用户名已存在")
						} else {
							alert("注册成功")
							$("#MyStudentmodal").modal("hide")
							$("#usernameID").val($("input[name='username']").val())
							$("#passwordID").val($("input[name='password']").val())
						}
					}
				})
			}
		  }
	  })
	  //登录判断
	  $("#btn2").click(function () {
        onfocusBlur1()
		  if(spans1()){
			  if($("#btn2").val()=="学生登录") {
				  $.ajax({
					  url:projectName+"/students/verifyStudent",
					  data: {
						  username: $("#usernameID").val(),
						  password: $("#passwordID").val()
					  },
					  dataType: "json",
					  success: function (data) {

						  if (data == 0) {
							  alert("登录失败，用户名或密码错误")
						  } else {
							  alert("登陆成功")
							  $('#form').attr("action", "students/students_interface").submit();
						  }
					  },
					  error(){
					  	alert("出现错误")
					  }
				  })
			  }else {
				  $.ajax({
					  url: projectName+"/teachers/verifyTeacher",
					  data: {
						  username: $("#usernameID").val(),
						  password: $("#passwordID").val()
					  },
					  dataType: "json",
					  success: function (data) {
						  if (data == 0) {
							  alert("登录失败，用户名或密码错误")
						  } else {
							  alert("登陆成功")
							  $('#form').attr("action", "teachers/teachers_interface").submit();
						  }
					  }
				  })
			  }
		  }
	  })
})
