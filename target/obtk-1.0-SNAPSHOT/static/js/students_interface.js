$(function () {

   //获取相对路径
   var pathName=window.document.location.pathname;
   //截取，得到项目名称
   var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

   $("#alterStudentInformationModal").modal({
      show:false,
      backdrop:'static'
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
      if($("#name").text()!=""||$("#password").text()!=""||$("#passwords").text()!=""||$("#studentClass").text()!=""){
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

   $("#submitAlterStudentInformation").click(function () {
      onfocusBlur()
      if (spans()) {
         $.ajax({
            url: projectName + "/students/alterStudentInformation",
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
                  $("#alterStudentInformationModal").modal("hide")
                  $("#studentInformation").click()
               }
            }
         })
      }
   })
   function display(ID,CLASS){
      if(CLASS.css("display")=="none"){
         ID.removeClass("fa-angle-double-right")
         ID.addClass("fa-angle-double-down")
      }else {
         ID.removeClass("fa-angle-double-down")
         ID.addClass("fa-angle-double-right")
      }
      CLASS.toggle()
   }
   $("#li1").click(function () {
      display($("#i1"),$(".li1"))
   })
   $("#li2").click(function () {
      display($("#i2"),$(".li2"))
   })
   $("#li3").click(function () {
      display($("#i3"),$(".li3"))
   })
   $("#mcsssli").click(function () {
      display($("#mcsssi"),$("#mcsss"))
   })
   $("#mcqssli").click(function () {
      display($("#mcqssi"),$("#mcqss"))
   })
   $("#wpsssli").click(function () {
      display($("#wpsssi"),$("#wpsss"))
   })
})