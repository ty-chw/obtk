$(function () {

    //获取相对路径
    var pathName=window.document.location.pathname;
    //截取，得到项目名称
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

    $("#alterInformationModal").modal({
        show:false,
        backdrop:'static'
    })
    $("#alterSubjectInformationModal").modal({
        show:false,
        backdrop:'static'
    })
    $("#selectStudentsResultsModel").modal({
        show:false,
        backdrop:'static'
    })
    $("#alterStudentResult").modal({
        show:false,
        backdrop:'static'
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
    $("#li4").click(function () {
        display($("#i4"),$(".li4"))
    })
})