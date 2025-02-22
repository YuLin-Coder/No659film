<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>影院后台系统</title>

    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <style type="text/css">
        * {
            margin: 0px;
        }

        #tou * {
            display: inline-block;
            vertical-align: middle;
            color: white;
        }

        #ul {
            border-top: 1px solid dodgerblue;
        }

        #ul ul {
            list-style-type: none;
            text-align: left;
        }

        #ul ul li {
            margin-top: 10px;
        }

        #ul ul li:hover {
            cursor: pointer;
            color: deepskyblue;
        }

        a:link {
            text-decoration: none;
            /* 指正常的未被访问过的链接*/
        }

        a:visited {
            text-decoration: none;
            color: black;
            /*指已经访问过的链接*/
        }

        a:hover {
            text-decoration: none;
            /*指鼠标在链接*/
        }

        a:active {
            text-decoration: none;
            /* 指正在点的链接*/
        }

        a {
            color: black;
        }

        .xx {
            color: royalblue;
        }

        .ff {
            color: royalblue;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            setInterval(function() {
                var win = $(window).height() - $("#shou").height() - $("#x").height() - 1;
                $("#lan").height(win);
                var fff = $(window).width() - $("#x").width() - 2;
                $("#w").width(fff);
                $("#f").width(fff - 1);
                $("#f").height(win - 2);
                $("#iframe").width(fff - 10);
                $("#iframe").height(win - 12);
                //时间
                var mydate = new Date();
                var year = mydate.getFullYear()
                var month = mydate.getMonth() + 1;
                var data = mydate.getDate();
                var h = mydate.getHours(); //获取当前小时数(0-23)
                var m = mydate.getMinutes(); //获取当前分钟数(0-59)
                var s = mydate.getSeconds(); //获取当前秒数(0-59)
                var cg = year + "/" + month + "/" + data + "     " + h + ":" + m + ":" + s;
                $("#cg").html(cg)

            }, 1000)

            $("a").click(function() {
                $("#ul ul li").removeClass("xx");
                $(this).parent().parent().addClass("xx");
            })

            $("li a").click(function(){
                $("#xxx").text($(this).text())
            })

            $("#tui").click(function () {
                $.ajax({
                    type: "post",
                    url: "tuichu",
                    data: {},
                    success: function(data) {
                        window.location.reload();
                    },
                    error: function() {
                        alert("服务器异常")
                    }

                });
            })



        })
    </script>
    <script type="text/javascript">
    </script>
</head>

<body>
<div class="container-fluid" id="shou" style="background: #9eb4c7;">
    <div style="padding: 10px;" id="tou">
        <img src="${pageContext.request.contextPath}${admin.imgUrl}" class="img-circle" width="80px" />
        <h4>管理员:${admin.adminName}</h4>
        <button id="tuichu" class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="margin-left: 20px;"><span class=" glyphicon glyphicon-off" style="font-size: 14px; margin-right: 5px;"></span><span >退出登录</span></button>
        <span style="margin-left: 20px;" id="cg"></span>
    </div>
</div>
<!-- 是否退出登录 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center;">是否退出影城后台系统</h4>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="tui" type="button" class="btn btn-danger">退出登录</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="container-fluid">
    <div class="row">
        <!--菜单-->
        <div class="col-md-2 text-center" style=" margin-right: -15px;">
            <div id="x" style=" background: #9eb4c7; width: 100%; height: 40px;margin-top: -10px;  margin-left:-15px; margin-bottom: 10px;">
                <h4 style="line-height: 40px;"><span class="glyphicon glyphicon-th-list" style="font-size: 14px; margin-right: 5px;"></span><span>菜单列表</span></h4>
            </div>
            <div id="lan" style="background: aliceblue; width: 100%; margin-left:-15px; margin-top: -10px;">
                <div style="padding-top: 5px; border-top:1px solid dodgerblue ">
                    <h5><span class="glyphicon glyphicon-user" style="font-size: 14px; margin-right: 5px;"></span><span>基础操作</span></h5>
                </div>
                <div id="ul">
                    <ul>
                        <li><span class="glyphicon glyphicon-play" style="margin-right: 5px;"></span><span><a href="type?page=1" target="mainFrame">电影类别管理</a></span></li>
                        <li><span class="glyphicon glyphicon-play" style="margin-right: 5px;"></span><span><a href="isfilm?page=1" target="mainFrame">电影信息管理</a></span></li>
                        <li><span class="glyphicon glyphicon-play" style="margin-right: 5px;"></span><span><a href="room?page=1" target="mainFrame">放映大厅管理</a></span></li>
                        <li><span class="glyphicon glyphicon-play" style="margin-right: 5px;"></span><span><a href="ticket?page=1" target="mainFrame">订单管理</a></span></li>

                    </ul>
                </div>

            </div>
        </div>

        <div class="col-md-10">
            <div id="w" style="background:aliceblue ; width: 100%; height: 40px; border:1px solid dodgerblue ; margin-left: -30px; border-bottom:0px;">
                <p style="line-height: 40px; margin-left: 40px; margin-bottom: 0px;">
                    <a href="home" target="mainFrame"><span class="glyphicon glyphicon-home"></span>
                        <strong>首页</strong></a>
                    <strong style="margin-left: 10px; margin-right: 10px; color:#e0bebe;">/</strong>
                    <strong id="xxx" style="color: black;"><span>网站信息</span></strong>
                    <strong style="margin-left: 10px; margin-right: 10px; color:#e0bebe;">/</strong>
                    <strong style=" color:#988787;">当前语言:</strong><strong style=" color:red;">简体中文</strong>
                </p>
                <div style="margin: 0px;border:1px solid dodgerblue; background: white;" id="f">
                    <iframe id="iframe" name="mainFrame" scrolling="no" noresize="noresize" src="home" frameborder="no"/>
                </div>
            </div>
        </div>

    </div>

</div>
</body>

</html>
