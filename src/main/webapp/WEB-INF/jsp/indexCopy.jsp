<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>新闻主页</title>
<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/main.css">
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a href="/index" class="navbar-brand"></a>
			</div>
			<label id="toggle-label" for="toggle-checkbox">MENU</label>
			<input class="hidden" id="toggle-checkbox" type="checkbox" >
			<div class="hidden-xs">
				<ul class="nav navbar-nav">
					<li><a href="#">首页</a></li>
					<li><a href="#">国内</a></li>
					<li><a href="#">国际</a></li>
					<li><a href="#">数读</a></li>
					<li><a href="#">社会</a></li>
					<li><a href="#">军事</a></li>
					<li><a href="#">政务</a></li>
					<li><a href="#">公益</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right"> 
		            <li><a href="/login"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
		            <li><a href="/signup"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
		        </ul> 
			</div>
		</div>
	</nav>
	
	
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="hidden-xs list-groud side-bar">
					<a href="#" class="list-group-item active">综合</a>
					<a href="#" class="list-group-item">电影</a>
					<a href="#" class="list-group-item">电视剧</a>
					<a href="#" class="list-group-item">明星</a>
					<a href="#" class="list-group-item">音乐</a>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="news-list">
					<div class="news-list-item clearfix">
						<div class="col-xs-3">
							<img src="static/image/001.jpg">
						</div>
						<div class="col-xs-9">
							<a href="/details" class="title">24小时内2名中国学生在英国失联 使馆、警方已介入
								\\24小时内2名中国学生在英国失联 使馆、警方已介入
							</a>
							<div class="info">
								<span>
									<span class="avatar">
										<img src="/static/image/logo.jpg">
									</span>
									王花花
								</span>·
								<span>24k评论</span>&nbsp;·
								<span>7分钟前</span>
							</div>
						</div>
					</div>
					
					<div class="news-list-item clearfix">
						<div class="col-xs-3">
							<img src="/static/image/002.jpg">
						</div>
						<div class="col-xs-9">
							<a href="#" class="title">网络公司用大数据“杀熟”：酒店房价300元变380
								||网络公司用大数据“杀熟”：酒店房价300元变380
							</a>
							<div class="info">
								<span>
									<span class="avatar">
										<img src="/static/image/logo.jpg">
									</span>
									王花花
								</span>·
								<span>24k评论</span>&nbsp;·
								<span>7分钟前</span>
							</div>
						</div>
					</div>
					
					<div class="news-list-item clearfix">
						<div class="col-xs-3">
							<img src="/static/image/003.jpg">
						</div>
						<div class="col-xs-9">
							<a href="#" class="title">国内油价今日或迎“两连跌”：加满一箱油将省7.5元！||
								国内油价今日或迎“两连跌”：加满一箱油将省7.5元！
							</a>
							<div class="info">
								<span>
									<span class="avatar">
										<img src="/static/image/logo.jpg">
									</span>
									王花花
								</span>·
								<span>24k评论</span>&nbsp;·
								<span>7分钟前</span>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			<!-- 右侧栏 -->
			<div class="col-sm-3">
				<div class="search-bar">
					<input type="search" class="form-control" placeholder="搜一下">
				</div>
				<!-- clearfix清除栅格浮动 -->
				<div class="side-bar-card flag clearfix">
					<div class="col-xs-5">
						<img alt="" src="/static/image/1-1.jpg">
					</div>
					<div class="col-xs-7">
						<div class="text-lg">有害信息举报专区</div>
						<div>举报电话：12377</div>
					</div>
				</div>
				<div class="side-bar-card">
					<div class="card-title">24小时热闻</div>
					<div class="card-body">
						<div class="list">
							<div class="item">
								<a class="title">李克强：反腐败斗争压倒性态势已经形成并巩固发展</a>
								<div class="desc">15K阅读  1K评论</div>
							</div>
							<div class="item">
								<div class="title">李克强：五年来重点城市重污染天数减少一半</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
							<div class="item">
								<div class="title">2018年GDP增长预期目标为6.5%左右</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
							<div class="item">
								<div class="title">好消息！移动网络流量资费年内至少降低30%</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
							<div class="item">
								<div class="title">个人所得税起征点将提高</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 页脚 -->
	<div class="footer">
		栓蛋头条 © 1998 - 2018 黑龙江科技大学版权所有
	</div>
</body>
</html>