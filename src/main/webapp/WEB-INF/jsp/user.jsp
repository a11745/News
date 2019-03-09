<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>用户中心</title>
    <link rel="shortcut icon" href="../static/base/images/logo.png">
    <link rel="stylesheet" href="../static/base/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/base/css/bootstrap-movie.css">
    <link rel="stylesheet" href="../static/base/css/animate.css">
    
    <link type="text/css" rel="stylesheet" href="/css/account.css" />
    <!--底部-->
<script src="../static/base/js/jquery.min.js"></script>
<script src="../static/base/js/bootstrap.min.js"></script>
<script src="../static/base/js/jquery.singlePageNav.min.js"></script>
<script src="../static/base/js/wow.min.js"></script>
<script src="../static/lazyload/jquery.lazyload.min.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>

<script type="text/javascript" src="/js/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript" src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript" src="/js/plugins/uploadify/jquery.uploadify.min.js"></script>
    <style>
        .navbar-brand>img {
            display: inline;
        }
        .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9{
            padding-right: 3px;
            padding-left: 3px;
        }
        .media{
            padding:3px;
            border:1px solid #ccc
        }
    </style>

<script type="text/javascript" src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>

<script type="text/javascript">
  $(function(){
	 
	$("#usereditForm").ajaxForm({success:function(data){
		if(data.success){
			$.messager.alert(data.msg);
			window.location.href="/index";
		}else{
			$.messager.alert(data.msg);
			//$.messager.popup(data.msg);
		}
	}});
	
	//把上传身份证正面的a标签变成一个uploadify的组件
    $("#uploadBtn1").uploadify({
    	buttonImg:"/static/image/btnimg.png",
        buttonText:"上传头像",
        fileObjName:"file",
        fileTypeDesc:"头像图片",
        fileTypeExts:"*.gif; *.jpg; *.png",
        multi:false,
        swf:"/js/plugins/uploadify/uploadify.swf",
        uploader:"/headImageUpload",
        overrideEvents:["onUploadSuccess","onSelect"],
        onUploadSuccess:function(file,data){
            $("#uploadImg1").attr("src",data);
            $("#uploadImage1").val(data);
        }
    });
});  

</script>

</head>

<body>
<!--导航-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.html" class="navbar-brand" style="width:250px;">
                <img src="../static/base/images/logo.png" style="height:30px;">&nbsp;用户中心
            </a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="curlink" href="/index"><span class="glyphicon "></span>&nbsp;首页</a>
                </li>
                <li id="tes">
		          	<a class="curlink" href="/signup"><span class="glyphicon glyphicon-plus"></span>&nbsp;注册</a>
		        </li> 
                
                <li>
                    <a class="curlink" href="/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a>
                </li>
                <li id="tes"><a class="curlink" href="/user"><span class="glyphicon glyphicon-user"></span>&nbsp;我的</a></li> 
            </ul>
        </div>
        <!--导航-->

    </div>
</nav>
<!--导航-->
<!--内容-->
<div class="container" style="margin-top:76px">
    <div class="col-md-3">
        <div class="list-group">
            <a href="/user" class="list-group-item active">
                <span class="glyphicon glyphicon-user"></span>&nbsp;会员中心
            </a>
             <a href="/pwd" class="list-group-item">
                <span class="glyphicon glyphicon-lock"></span>&nbsp;修改密码
            </a>
            <a href="/comments" class="list-group-item">
                <span class="glyphicon glyphicon-comment"></span>&nbsp;评论记录
            </a>
            <a href="/loginlog" class="list-group-item">
                <span class="glyphicon glyphicon-calendar"></span>&nbsp;登录日志
            </a>
            <a href="/moviecol" class="list-group-item">
                <span class="glyphicon glyphicon-heart"></span>&nbsp;我的收藏
            </a>
        </div>
    </div>
    <div class="col-md-9">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;会员中心</h3>
            </div>
            <div class="panel-body">
                <form id="usereditForm" action="/useredit" method="post">
                    <fieldset>
                            <div class="form-group">
                                <label for="input_name"><span class="glyphicon glyphicon-user"></span>&nbsp;昵称</label>
                                <input id="input_name" class="form-control" placeholder="昵称" name="userName" type="text" autofocus value="${user.userName }">
                            </div>
                            <div class="col-md-12" id="error_name"></div>
                            <div class="form-group">
                                <label for="input_email"><span class="glyphicon glyphicon-envelope"></span>&nbsp;邮箱</label>
                                <input id="input_email" class="form-control" placeholder="邮箱" name="email" type="email" autofocus value="${user.email }">
                            </div>
                            <div class="col-md-12" id="error_email"></div>
                            <div class="form-group">
                                <label for="input_phone"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机</label>
                                <input id="input_phone" class="form-control" placeholder="手机" name="phone" type="text" autofocus value="${user.phone }">
                            </div>
                            <div class="col-md-12" id="error_phone"></div>
                            <div class="form-group">
                                <label for="input_face"><span class="glyphicon glyphicon-picture"></span>&nbsp;头像</label><br>
                                <img id="uploadImg1" width="50" height="50" src="${user.headimage }" class="img-circle" style="border:1px solid #abcdef;width:50;height:50;"> <br>
                                <a id="uploadBtn1" class="btn btn-primary" style="margin-top:6px;" ><span  class="glyphicon glyphicon-open"></span>&nbsp;上传头像</a>
                                <!-- <input id="uploadBtn1" name="file_upload" type="file" multiple="true">   -->
                                <input id="uploadImage1" id="input_face" class="form-control" name="headimage" type="hidden" autofocus>
                            </div>
                            <div class="col-md-12" id="error_face"></div>
                            <div class="form-group">
                                <label for="input_info"><span class="glyphicon glyphicon-edit"></span>&nbsp;简介</label>
                                <textarea class="form-control" rows="10" id="input_info"  name="info">${user.info }</textarea>
                            </div>
                            <div class="col-md-12" id="error_info"></div>
                        <div class="form-group">
							<button class="btn btn-lg btn-primary btn-block" >修改</button>
						</div>
                        </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<!--内容-->
<!--底部-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>
                   		 黑科身边事 © 2017 - 2018 黑龙江科技大学版权所有
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- <script>
    $(function() {
        new WOW().init();
    })

</script>
<script>
    $(document).ready(function() {
        $("img.lazy").lazyload({
            effect: "fadeIn"
        });
    });

</script> -->
</body>
</html>
