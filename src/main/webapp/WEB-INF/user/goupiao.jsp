<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/21
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
</head>

<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/toubu.css"/>
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
<script type="text/javascript">
    setInterval(function() {
        //时间
        var mydate = new Date();
        var year = mydate.getFullYear()
        var month = mydate.getMonth() + 1;
        var data = mydate.getDate();
        var h = mydate.getHours(); //获取当前小时数(0-23)
        var m = mydate.getMinutes(); //获取当前分钟数(0-59)
        var s = mydate.getSeconds(); //获取当前秒数(0-59)
        var cg = year + "/" + month + "/" + data + "     " + h + ":" + m + ":" + s;
        $("#time").html(cg)

    }, 1)
</script>
<script>
    $(function(){
        $("#tui").click(function() {
            $.ajax({
                type:"get",
                url:"tui",
                success:function(data){
                    window.location.reload();
                }
            });
        })
        $("#login").on("click","#toLogin",function(){
            $.ajax({
                type:"post",
                url:"login",
                data:{
                    userAccount:$("#userName").val(),
                    userPassword:$("#userPassword").val()
                },
                success:function(data){
                    console.log(data);
                    if(data.userId!=0){
                        window.location.reload();
                    }else{
                        alert("用户名或者密码错误，登录失败")
                    }
                },
                error:function () {
                    alert("服务器请求失效")
                }
            });
        })

        $("#but66").click(function () {
            var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
            var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (uPattern.test($("#userName1").val())){
                if (uPattern.test($("#account").val())) {
                    if (uPattern.test($("#userPassword2").val())) {
                        if ($("#userPassword2").val()==$("#userPassword3").val()){
                            if (ePattern.test($("#emli").val())){
                                if (uPattern.test($("#phone").val())){
                                    $.ajax({
                                        type:"post",
                                        url:"zhu",
                                        data:{
                                            userName:$("#userName1").val(),
                                            userAccount:$("#account").val(),
                                            userPassword:$("#userPassword2").val(),
                                            userEmli:$("#emli").val(),
                                            userPhone:$("#phone").val()
                                        },
                                        success:function(data){
                                            if(data>0){
                                                alert("注册成功")
                                                window.location.reload();
                                            }else{
                                                alert("注册失败")
                                            }
                                        },
                                        error:function () {
                                            alert("服务器请求失效")
                                        }
                                    });
                                } else{
                                    alert("手机号输入不正确")
                                }
                            } else {
                                alert("邮箱输入不正确")
                            }
                        } else{
                            alert("密码不一致")
                        }
                    }else{
                        alert("密码输入不正确")
                    }
                }else {
                    alert("用户名输入不正确,请输入4到6位")
                }
            } else{
                alert("昵称输入不正确,请输入4到6位")
            }
        })
    })
</script>
<style type="text/css">
    body {
        background: #2E323B;
    }

    .detailed{
        background: white;
        border-radius:20px;
        padding-bottom: 50px;
    }

    .piaopiao{
        width: 35px;
        height: 20px;
        display: block;
        background: black;
        color: white;
        border-radius: 5px;
        pointer-events: none;
    }
    #register table tr {
        height: 50px;
    }
    #font td{
        width: 40px;
        height: 20px;

    }
    #font font{
        width: 35px;
        border-radius: 5px;
        background:#bcf1be;
        /*禁止点击*/
        /*pointer-events: none;*/
    }

    .zipiao{
        width: 35px;
        height: 20px;
        display: block;
        cursor: pointer;
        background: black;
        color: white;
    }
    #font font:hover{
        cursor: pointer;
        background: #72b778;
        color: white;
    }
    .pp{
        cursor: pointer;
        margin: 5px;
        float: left;
        text-align: center;
        width: 35px;
        height: 20px;
        display: block;
        background:#7b85ad;
        color: white;
        border-radius: 5px;
    }

    #font .piaopiao:hover{
        width: 35px;
        height: 20px;
        display: block;
        background: black;
        color: white;
        border-radius: 5px;
        pointer-events: none;
    }
    .piaopiao:hover{
        width: 35px;
        height: 20px;
        display: block;
        background: black;
        color: white;
        border-radius: 5px;
        pointer-events: none;
    }
    #font .piaopiao{
        width: 35px;
        height: 20px;
        display: block;
        background: black;
        color: white;
        border-radius: 5px;
    }
</style>
<body>
<div class="container">
    <div class="row" id="tou">
        <nav class="navbar navbar-default col-lg-12" style="text-align: center;">
            <div class="logo navbar-header" style="width: 90px; height: 51px; padding: 8px;">
                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/logo.png" style="width: 88px;" height="50.59px" alt="" /></a>
            </div>
            <div class="container-fluid" style="margin-left: 120px; padding: 10px; margin: 0px;">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul id="ul" class="nav navbar-nav" style="margin-left: 20px;">
                        <li>
                            <a href="${pageContext.request.contextPath}">首页</a>
                        </li>
                        <li>
                            <a href="list">电影</a>
                        </li>
                        <li>
                            <a href="we">影城介绍</a>
                        </li>
                    </ul>
                    <div class="navbar-nav container-fluid" style="position: relative;">
                        <div style="margin-left:30px;" style="display: block;">
                            <input id="search" type="search" placeholder="搜索">
                            <span id="but1" class="glyphicon glyphicon-search"></span>
                            <font id="time">#</font>
                        </div>

                    </div>

                    <div style="float: right;" id="islog">
                        <c:if test="${user!=null}">
                            <a href="personal"><img  src="${pageContext.request.contextPath}${user.imgUrl}" class="img-circle" style="width: 40px; margin-right: 10px; height: 40px"></a>
                            <a href="personal">${user.userName}</a>&nbsp;&nbsp;
                            <button class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="margin-left: 20px;"><span class=" glyphicon glyphicon-off" style="font-size: 14px; margin-right: 5px;"></span><span >退出</span></button>
                        </c:if>
                        <c:if test="${user==null}">
                            <img data-toggle='modal' data-target='#login' id="img" src="${pageContext.request.contextPath}/img/ht.jpg" class="img-circle" style="width: 40px; margin-right: 10px; height: 40px">
                            <a data-toggle='modal' data-target='#login'>登录</a>&nbsp;&nbsp;
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
<div style="margin: 30px;">
    <!-- 是否退出登录 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align: center;">是否退出登录</h4>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button id="tui" type="button" class="btn btn-danger">退出登录</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<div class="container detailed" >
    <div class="container" style="margin-top: 20px;">
        <div><strong id="biaoti" style="font-size: 26px;">售票:<font id="dianyan" style="font-size: 20px">${play.film.filmName}</font><font style="font-size: 16px;color: #adadad">（${play.room.roomName}）</font></strong></div>
    </div>
    <div class="row" style="margin-left: 60px; margin-top: 20px;">
        <table border="0px" class="col-lg-5">
            <thead>
            <tr align="center">
                <td width="20px"></td>
                <td colspan="9"style="background: #999; width: 500px; height:35px; border-radius: 10px;"><strong>屏幕</strong></td>
            </tr>
            <tr><td style="height: 10px;"></td></tr>
            </thead>
            <tbody id="font" align="center" >
            <tr>
                <td>1</td>
                <td><font id="1-1" style="display: block;">1<font style="display: none;">1-1</font></font></td>
                <td><font id="1-2" style="display: block;">2<font style="display: none;">1-2</font></font></td>
                <td><font id="1-3" style="display: block;">3<font style="display: none;">1-3</font></font></td>
                <td><font id="1-4" style="display: block;">4<font style="display: none;">1-4</font></font></td>
                <td><font id="1-5" style="display: block;">5<font style="display: none;">1-5</font></font></td>
                <td><font id="1-6" style="display: block;">6<font style="display: none;">1-6</font></font></td>
                <td><font id="1-7" style="display: block;">7<font style="display: none;">1-7</font></font></td>
                <td><font id="1-8" style="display: block;">8<font style="display: none;">1-8</font></font></td>
                <td><font id="1-9" style="display: block;">9<font style="display: none;">1-9</font></font></td>
            </tr><tr><td style="height: 10px;"></td></tr>
            <tr>
                <td>2</td>
                <td><font id="2-1" style="display: block;">1<font style="display: none;">2-1</font></font></td>
                <td><font id="2-2" style="display: block;">2<font style="display: none;">2-2</font></font></td>
                <td><font id="2-3" style="display: block;">3<font style="display: none;">2-3</font></font></td>
                <td><font id="2-4" style="display: block;">4<font style="display: none;">2-4</font></font></td>
                <td><font id="2-5" style="display: block;">5<font style="display: none;">2-5</font></font></td>
                <td><font id="2-6" style="display: block;">6<font style="display: none;">2-6</font></font></td>
                <td><font id="2-7" style="display: block;">7<font style="display: none;">2-7</font></font></td>
                <td><font id="2-8" style="display: block;">8<font style="display: none;">2-8</font></font></td>
                <td><font id="2-9" style="display: block;">9<font style="display: none;">2-9</font></font></td>
            </tr><tr><td style="height: 10px;"></td></tr>
            <tr>
                <td>3</td>
                <td><font id="3-1" style="display: block;">1<font style="display: none;">3-1</font></font></td>
                <td><font id="3-2" style="display: block;">2<font style="display: none;">3-2</font></font></td>
                <td><font id="3-3" style="display: block;">3<font style="display: none;">3-3</font></font></td>
                <td><font id="3-4" style="display: block;">4<font style="display: none;">3-4</font></font></td>
                <td><font id="3-5" style="display: block;">5<font style="display: none;">3-5</font></font></td>
                <td><font id="3-6" style="display: block;">6<font style="display: none;">3-6</font></font></td>
                <td><font id="3-7" style="display: block;">7<font style="display: none;">3-7</font></font></td>
                <td><font id="3-8" style="display: block;">8<font style="display: none;">3-8</font></font></td>
                <td><font id="3-9" style="display: block;">9<font style="display: none;">3-9</font></font></td>
            </tr><tr><td style="height: 10px;"></td></tr>
            <tr>
                <td>4</td>
                <td><font id="4-1" style="display: block;">1<font style="display: none;">4-1</font></font></td>
                <td><font id="4-2" style="display: block;">2<font style="display: none;">4-2</font></font></td>
                <td><font id="4-3" style="display: block;">3<font style="display: none;">4-3</font></font></td>
                <td><font id="4-4" style="display: block;">4<font style="display: none;">4-4</font></font></td>
                <td><font id="4-5" style="display: block;">5<font style="display: none;">4-5</font></font></td>
                <td><font id="4-6" style="display: block;">6<font style="display: none;">4-6</font></font></td>
                <td><font id="4-7" style="display: block;">7<font style="display: none;">4-7</font></font></td>
                <td><font id="4-8" style="display: block;">8<font style="display: none;">4-8</font></font></td>
                <td><font id="4-9" style="display: block;">9<font style="display: none;">4-9</font></font></td>
            </tr><tr><td style="height: 10px;"></td></tr>
            <tr>
                <td>5</td>
                <td><font id="5-1" style="display: block;">1<font style="display: none;">5-1</font></font></td>
                <td><font id="5-2" style="display: block;">2<font style="display: none;">5-2</font></font></td>
                <td><font id="5-3" style="display: block;">3<font style="display: none;">5-3</font></font></td>
                <td><font id="5-4" style="display: block;">4<font style="display: none;">5-4</font></font></td>
                <td><font id="5-5" style="display: block;">5<font style="display: none;">5-5</font></font></td>
                <td><font id="5-6" style="display: block;">6<font style="display: none;">5-6</font></font></td>
                <td><font id="5-7" style="display: block;">7<font style="display: none;">5-7</font></font></td>
                <td><font id="5-8" style="display: block;">8<font style="display: none;">5-8</font></font></td>
                <td><font id="5-9" style="display: block;">9<font style="display: none;">5-9</font></font></td>
            </tr><tr><td style="height: 10px;"></td></tr>
            <tr>
                <td>6</td>
                <td><font id="6-1" style="display: block;">1<font style="display: none;">6-1</font></font></td>
                <td><font id="6-2" style="display: block;">2<font style="display: none;">6-2</font></font></td>
                <td><font id="6-3" style="display: block;">3<font style="display: none;">6-3</font></font></td>
                <td><font id="6-4" style="display: block;">4<font style="display: none;">6-4</font></font></td>
                <td><font id="6-5" style="display: block;">5<font style="display: none;">6-5</font></font></td>
                <td><font id="6-6" style="display: block;">6<font style="display: none;">6-6</font></font></td>
                <td><font id="6-7" style="display: block;">7<font style="display: none;">6-7</font></font></td>
                <td><font id="6-8" style="display: block;">8<font style="display: none;">6-8</font></font></td>
                <td><font id="6-9" style="display: block;">9<font style="display: none;">6-9</font></font></td>
            </tr>
            </tbody>
        </table>
        <div class="col-lg-6" id="piaoqi" style=" width: 450px; margin-top: 10px;">
            <strong>电影排期</strong>
            <select id="select" style="width: 200px; text-align: center;">
                <c:forEach items="${list}" var="play">
                    <c:if test="${index==play.playId}">
                        <option value="${play.playId}" selected>${play.playTime}</option>
                    </c:if>
                    <c:if test="${index!=play.playId}">
                        <option value="${play.playId}">${play.playTime}</option>
                    </c:if>
                </c:forEach>
            </select>


            <strong style="float: right;">
                已出售:<font style="float: right;" class="piaopiao"
            id="maichu">

            </font></strong>

            <div class="row">
                <div id="zuowei" class="col-lg-2" style="width: 300px; margin-top: 20px; ">
                    <strong>已选：</strong>
                    <div id="po" style="margin-left: 30px;">
                        <font id="yi"></font>
                    </div>
                </div>
                <strong style="margin-left: 15px; display: block;float: left; width: 200px;">费用:￥<font style="color: red; font-size: 16px;" id="money"></font></strong>
            </div>
        </div>

    </div>

    <div align="center">
        <font id="gou" class ="btn btn-danger glyphicon glyphicon-shopping-cart">购票</font>
    </div>
</div>

<!--登录模态框 -->
<div class="modal fade" id="login" style="margin-top: 200px"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <table align="center" id="table">
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">用户名</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="userName" placeholder="请输入用户名">
                        </td>
                    </tr>
                    <tr height="50px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">密码</label>
                        </td>
                        <td>
                            <input type="password" class="form-control" style="display: inherit;width: 200px;" id="userPassword" placeholder="请输入密码">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="position:relative;height: 60px; line-height: 60px;">
                <button style="position: absolute; left: 42%;" type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button id="toLogin" style="position: absolute; left: 52%;" type="button" class="btn btn-success" data-dismiss="modal">登录</button>
                <a style="position: absolute; right: 10%;line-height:50px;" data-dismiss="modal" data-toggle='modal' data-target='#register'>注册</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!--注册模态框 -->
<div class="modal fade" id="register" style="margin-top: 200px"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">用户注册</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <table align="center" id="table2">
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">昵称</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="userName1" placeholder="请输入用户名">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">用户名</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="account" placeholder="请输入账号">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">密码</label>
                        </td>
                        <td>
                            <input type="password" class="form-control" style="display: inherit;width: 200px;" id="userPassword2" placeholder="请输入密码">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">确认密码</label>
                        </td>
                        <td>
                            <input type="password" class="form-control" style="display: inherit;width: 200px;" id="userPassword3" placeholder="确认密码">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">邮箱</label>
                        </td>
                        <td>
                            <input type="email" class="form-control" style="display: inherit;width: 200px;" id="emli" placeholder="邮箱">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">手机号</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="phone" placeholder="手机号">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="position:relative;height: 60px; line-height: 60px;">
                <button style="position: absolute; left: 42%;" type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button style="position: absolute; left: 52%;" type="button" class="btn btn-success" id="but66">注册</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</body>
<script type="text/javascript">
    var moneySum = "";
    $(function(){
        var money=${play.money};

        /*统计买了多少票*/
        var sun=0;
        $("#font font").removeClass("piaopiao")
        $().ready(function(){
            $.ajax({
                type:"get",
                url:"mai",
                data:{
                    playId:$("#select option:selected").val()
                },
                dataType: "json",
                success:function(data){
                    $.each(data.ticket, function(index,info) {
                        var i=54;
                        for(var a=0;a<i;a++){
                            if($("#font font font").eq(a).text()==info.seat.seat){
                                $("#font font font").eq(a).parent().addClass("piaopiao")
                            }
                        }
                    });
                    $("#maichu").text(getJsonLength(data.ticket))

                }
            });
        });


        function getJsonLength(jsonData){
            var jsonLength = 0;
            for(var item in jsonData){
                jsonLength++;
            }
            return jsonLength;
        }



        $("#gou").click(function () {
            if (${user==null}){
                alert("请先登录")
            }else {
                $.ajax({
                    type: "post",
                    url: "goumai",
                    data: {
                        playId:$("#select option:selected").val(),
                        sun: sun,
                        seat: $(".pp").text(),
                        money:moneySum
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data>0){
                            alert("成功购买"+data+"张票");
                        } else if (data='-1'){
                            alert("余额不足，请先充值！")
                        }else if (data='-2'){
                            alert("系统异常，请检查后台！")
                        }else{
                            alert("购买失败"+data+"张票")
                        }
                        window.location.reload();

                    }
                });
            }
        })


        /*下拉框选择器*/
        $("#select").change(function(){
            window.location.href="goupiao2?playId="+$(this).find("option:selected").val()
        })
        /*在选座表进行添加座位与已选取消*/
        $("#font").on("click","font",function(){
            var text=$(this).children().text()
            if($(this).hasClass("zipiao")){
                var a=[];
                a=$(".pp").text()
                var i=0;
                for(i;i<a.length;){
                    var arr=a[i]+a[i+1]+a[i+2];
                    if(text==arr){
                        var x=0;
                        for(x;x<a.length;){
                            if(text==$(".pp").eq(x).text()){
                                $(".pp").eq(x).remove()
                                sun-=1;
                                $("#money").text(money*sun);
                                moneySum = money*sun;
                            }
                            x++;
                        }
                        $(this).removeClass("zipiao")
                    }
                    i+=3;
                }
            }else if($(this).hasClass("piaopiao")){
                return
            }else{
                /*添加座位+加钱*/
                $(this).addClass("zipiao")
                sun+=1;
                $("#money").text(money*sun)
                moneySum = money*sun;
                var piao="<font class='pp'>"+text+"</font>";
                $("#yi").after(piao)
            }
        })
        /*在已选处点击取消*/
        $("#po").on("click","font",function(){
            var a=$(this).text()
            var table=$("#font font font").text()
            var i=0;
            for(i;i<table.length;){
                var arr=table[i]+table[i+1]+table[i+2];
                if(a==arr){
                    var x=0;
                    for(x;x<table.length;){
                        if($("#font font font").eq(x).text()==a){
                            $("#font font font").eq(x).parent().removeClass("zipiao")
                            $(this).remove()
                            sun-=1;
                            $("#money").text(money*sun);
                            moneySum = money*sun;
                        }
                        x++;
                    }
                }
                i+=3;
            }

        })
        $("#but1").click(function () {
            var search=$("#search").val()
            window.location.href="mohu?page=1&name="+search;
        })
        $("#gou").click(function () {
            console.log($("option:selected").val())
        })


    })
</script>
</html>

