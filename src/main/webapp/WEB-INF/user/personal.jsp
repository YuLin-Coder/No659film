<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/26
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>个人简介</title>
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
        if (${user.sex!=null}){
            if (${user.sex==2}) {
                $("#sex3").text("未知")
            }
            if (${user.sex==1}) {
                $("#sex3").text("男")
            }
            if (${user.sex==0}) {
                $("#sex3").text("女")
            }
            $("#imgMoney2").hide();
        }

        $("#selectidMethod").change(function () {
            var methodid = $("#selectidMethod").val();
            console.log(methodid);
            debugger;

            if (methodid=='1'){
                $("#imgMoney2").hide();
                $("#imgMoney1").show();
            }else if (methodid=='2'){
                $("#imgMoney1").hide();
                $("#imgMoney2").show();
            }

        })

        $("#toMoneyUp").click(function () {
            console.log($("#userMoney5").val())
            $.ajax({
                type:"post",
                url:"updateMoney",
                data:{
                    userMoney:$("#userMoney5").val()
                },
                success:function(data){
                    window.location.reload();
                },
                error:function () {
                    alert("充值失败！");
                }
            });
        })


        $("#toUp").click(function () {
            console.log($("#select option:selected").val())
            $.ajax({
                type:"post",
                url:"update",
                data:{
                    userName:$("#userName4").val(),
                    sex:$("#select option:selected").val(),
                    userEmli:$("#userEmli4").val(),
                    userPhone:$("#userPhone4").val()
                },
                success:function(data){
                    window.location.reload();
                },
                error:function () {
                    alert("服务器请求失效")
                }
            });

        })

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
                            alert("密码输入不一致")
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
        $().ready(function(){
            if (${map.pages>1}) {
                $("#fenye").css("display","block")
                if(${!map.prevopus}){
                    $('#Previous').addClass("disabled")
                }else{
                    $('#Previous').removeClass("disabled")
                    $('#Previous a').attr("href","personal?page=${map.pageNum-1}");
                }
                if (${!map.next}) {
                    $('#li').addClass("disabled")
                }else {
                    $('#li').removeClass("disabled")
                    $('#li a').attr("href","personal?page=${map.pageNum+1}");
                }
                for(var i = 0; i <${map.pages}; i++) {
                    var a=${map.pageNum};
                    if( a==(i+1)) {
                        $("#li").before("<li id='pageSum' class='active data'><a href='personal?page=${map.pageNum}'>" + (i + 1) + "</a></li>")
                    } else {
                        $("#li").before("<li id='pageSum' class='data'><a href='personal?page="+(i+1)+"'>" + (i + 1) + "</a></li>")
                    }
                }

            }
        })
    })
</script>
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
</div>
<div class="container detailed">
    <strong style="font-size: 30px; margin:20px; display: block;">个人中心</strong>
    <c:if test="${user==null}">
        <div align="center" class="container" style="margin-top: 30px; margin-left: 50px; line-height: 30px;font-size: 16px;">
            <p>暂未登录!请先<a data-toggle='modal' data-target='#login'>登录</a></p>
        </div>
    </c:if>
    <c:if test="${user!=null}">
        <div class="container" style="margin: 30px;line-height: 30px;font-size: 18px; position: relative;">
            <a data-toggle='modal' data-target='#userUp' style="font-size: 15px">修改用户信息</a>&nbsp;&nbsp;<br>
            <strong>昵称:<span id="userName3">${user.userName}</span></strong><br>
            <strong>性别:<span id="sex3"></span></strong><br>
            <strong>手机:<span id="userPhone3">${user.userPhone}</span></strong><br>
            <strong>邮箱:<span id="userEmli3">${user.userEmli}</span></strong><br>
            <strong>账户余额:<span id="userMoney3">${user.userMoney}.00</span></strong>&nbsp;&nbsp; <a data-toggle='modal' data-target='#userMoneyUp' style="font-size: 15px">充值</a>
            <img data-toggle='modal' data-target='#upimg' src="${pageContext.request.contextPath}${user.imgUrl}" style="width: 180px;height: 180px;position: absolute ;right:15%;top:-45%;float: right">

        </div>
        <div class="container" style="margin-left: 30px;margin-top: 40px;">
            <table class="table table-striped" style="width: 80%">
                <caption><span id="sum" style="margin-left: 30px;">共${map.conut}条数据</span></caption>
                <thead>
                <tr>
                    <th>单号</th>
                    <th>电影</th>
                    <th>大厅</th>
                    <th>座位</th>
                    <th>票价</th>
                    <th>播放时间</th>
                </tr>
                </thead>
                <tbody id="table3">
                <c:forEach items="${map.info}" var="ticket">
                    <tr>
                        <td id="ticketId">${ticket.ticketId}</td>
                        <td id="filmName">${ticket.play.film.filmName}</td>
                        <td id="roomName">${ticket.play.room.roomName}</td>
                        <td id="seat">${ticket.seat.seat}</td>
                        <td id="money">${ticket.play.money}</td>
                        <td id="">${ticket.play.playTime}</td>
                    </tr>
                </c:forEach>
                <tr style="height: 35px">
                    <td colspan="6" style="padding: 0px;">
                        <!--分页-->
                        <div id="fenye" class="panel-footer" style="text-align: center;padding: 0px; display: none">
                            <nav style="height: 35px;">
                                <ul class="pagination" style="margin-top:0px;">
                                    <li id="Previous">
                                        <a aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <li id="li">
                                        <a aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="clearfix"></div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </c:if>

</div>
<!--用户修改模态框 -->
<div class="modal fade" id="userUp" style="margin-top: 200px" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">用户信息修改</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <table align="center" id="table">
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">昵称</label>
                        </td>
                        <td>
                            <input type="text" value="${user.userName}" class="form-control" style="display: inherit;width: 200px;" id="userName4" placeholder="修改昵称">
                        </td>
                    </tr>
                    <tr height="50px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">性别</label>
                        </td>
                        <td>
                           <select id="select" class="form-control">
                               <option value="2" <c:if test="${user.sex==2}">selected</c:if>>未知</option>
                               <option value="1" <c:if test="${user.sex==1}">selected</c:if>>男</option>
                               <option value="0" <c:if test="${user.sex==0}">selected</c:if>>女</option>
                           </select>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">手机</label>
                        </td>
                        <td>
                            <input type="text" value="${user.userPhone}" class="form-control" style="display: inherit;width: 200px;" id="userPhone4" placeholder="修改手机">
                        </td>
                    </tr>
                    <tr height="20px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">邮箱</label>
                        </td>
                        <td>
                            <input type="text" value="${user.userEmli}" class="form-control" style="display: inherit;width: 200px;" id="userEmli4" placeholder="修改邮箱">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="position:relative;height: 60px; line-height: 60px;">
                <button style="position: absolute; left: 42%;" type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button  id="toUp" style="position: absolute; left: 52%;" type="button" class="btn btn-success" data-dismiss="modal">确认修改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<!--用户余额修改模态框 -->
<div class="modal fade" id="userMoneyUp" style="margin-top: 200px" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myMoneyModalLabel">用户余额充值</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <table align="center" id="tableMoney">
                    <tr height="50px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">充值方式</label>
                        </td>
                        <td>
                            <select id="selectidMethod" class="form-control" >
                                <option value="1" >支付宝</option>
                                <option value="2" >微信</option>
                            </select>
                        </td>
                    </tr>
                    <tr height="50px">
                        <td align="center" width="80px">
                            <img data-toggle='modal' id="imgMoney1" src="${pageContext.request.contextPath}/img/zhifubao.png" class="img-circle" style="width: 200px; margin-right: 10px; height: 200px">
                            <img data-toggle='modal' id="imgMoney2" src="${pageContext.request.contextPath}/img/weixin.png" class="img-circle" style="width: 200px; margin-right: 10px; height: 200px">
                        </td>
                    </tr>
                    <tr height="50px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">充值金额:</label>
                        </td>
                        <td>
                            <input type="text"  class="form-control" style="display: inherit;width: 200px;" id="userMoney5" placeholder="格式:数字">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="position:relative;height: 60px; line-height: 60px;">
                <button style="position: absolute; left: 42%;" type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button  id="toMoneyUp" style="position: absolute; left: 52%;" type="button" class="btn btn-success" data-dismiss="modal">确认充值</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!--登录模态框 -->
<div class="modal fade" id="login" style="margin-top: 200px" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <button  id="toLogin" style="position: absolute; left: 52%;" type="button" class="btn btn-success" data-dismiss="modal">登录</button>
                <a style="position: absolute; right: 10%;line-height:50px;" data-dismiss="modal" data-toggle='modal' data-target='#register'>注册</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
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
<!-- 是否退出登录 -->
<div class="modal fade" id="upimg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center;">跟换图片</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <form action="update" method="post" enctype="multipart/form-data">
                    <input type="file" style="margin-left: 30%" id="file" name="file">
                    <input type="submit" class="btn btn-success" value="跟换">
                </form>
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
