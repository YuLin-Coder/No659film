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
    <title>电影详细</title>
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
        $("#but1").click(function () {
            var search=$("#search").val()
            window.location.href="mohu?page=1&name="+search;
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
                            alert("密码输入不正确")
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
    #register table tr {
        height: 50px;
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
        <div><strong id="biaoti" style="font-size: 26px;">${film.filmName}</strong><font style="color: #adadad">(${film.filmTime})</font></div>
        <img style="float: left; display: block; height: 300px; width: 250px; margin-right: 20px;" src="${pageContext.request.contextPath}${film.posterUrl}" />
        <div>
            <div style="padding-top: 15px;line-height: 25px;">
                <p>导演:<font id="daoyan">${film.director}</font></p>
                <p>编剧:<font id="bianju">${film.screenwriters.screenwriterName}</font></p>
                <p>主演:<font id="zhuyan">${film.star.performerName}</font></p>
                <p>类型:<font id="leixing">${film.filmCategory.filmCategory}</font></p>
                <p>语言:<font id="yuyan">中文/英文</font></p>
                <p>首映时间:<font id="shangying">${film.filmTime}</font></p>
                <p>片长:<font id="pianchang">${film.playTime}分钟</font></p>
                <strong>
                    <p><font>对不起，此电影没有档期，无法购票</font></p>
                </strong>

                <strong>
                    <a href="list"><font class ="btn btn-danger glyphicon glyphicon-shopping-cart">返回电影列表 </font></a>
                </strong>
            </div>
        </div>
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
</html>
