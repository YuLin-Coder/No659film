<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <title>后台登录系统</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
   <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/toubu.css"/>--%>
    <%--<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">--%>
    <style type="text/css">
        #form {
            width: 300px;
            height: 230px;
            position: relative;
            left: 50%;
            top: 0%;
            margin-left: -155px;
            margin-top: 300px;
        }

        #background {
            background-color: rgba(255, 255, 255, 0.5);
            width: 400px;
            height: 180px;
            padding: 30px;
            border-radius: 10px;
        }

        label {
            line-height: 35px;
        }

    </style>
    <script type="text/javascript">
        $(function() {
            //登录是否成功
            $(":submit").click(function() {
                    $.ajax({
                        type: "post",
                        url: "loginadmin",
                        data: {
                            account: $(":text").val(),
                            adminPwd: $(":password").val()
                        },
                        success: function(data) {
                            if(data == "ok") {
                                location.href = "root/admin";
                            } else {
                                alert("登录失败")
                            }
                        },
                        error: function() {
                            alert("服务器异常")
                        }

                    });
            })
        })
    </script>
</head>

<body style="background: url(${pageContext.request.contextPath}/img/0.jpg); background-size:100%; background-repeat:repeat-x; background-repeat:repeat-y;">

<div class="container" id="form">
    <div id="background">
        <div class="form-group">
            <label for="firstname" class="col-sm-3 control-label">用户名</label>
            <div class="">
                <input type="text" class="form-control" style="display: inherit;width: 230px;" id="firstname" placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="lastname" class="col-sm-3 control-label">密码</label>
            <div class="">
                <input type="password" class="form-control" style="display: inherit;width: 230px;" id="lastname" placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <div class="text-center ">
                <button type="submit" class="btn btn-default">登录</button>
            </div>
        </div>
    </div>
</div>
</div>

</body>

</html>