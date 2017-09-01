<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>官方网站</title>
<link rel="icon" href="<%=basePath%>resource/img/favicon.ico"
	mce_href="<%=basePath%>resource/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="<%=basePath%>resource/img/favicon.ico"
	mce_href="<%=basePath%>resource/img/favicon.ico" type="image/x-icon">
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>resource/css/animate.css" rel="stylesheet">
<link href="<%=basePath%>resource/css/index.css" rel="stylesheet">

<script src="<%=basePath%>resource/js/require.js"></script>
<script src="<%=basePath%>resource/js/main.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<!-- container-fluid 表示占用100%宽度  container是占用固定宽度  -->
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display  -->
			<!-- 用来当页面宽度小于一定的值得时候，进行响应式布局的显示 -->
			<div class="navbar-header">
				<img alt="logo" src="/resource/img/logo.jpg" style="max-height:50px;float:left;margin-right:10px" >
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				
				<a class="navbar-brand jumplink" href="javascript:;" for="0">官方网站</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="javascript:;" for="product" class="jumplink"
						id="jump_product">产品展示<span class="sr-only">(current)</span></a></li>
					<li><a href="javascript:;" for="action" class="jumplink"
						id="jump_action">公司动态<span class="sr-only">(current)</span></a></li>
					<li><a href="javascript:;" for="hotnews" class="jumplink">热点新闻</a></li>
					<li><a href="javascript:;" id="jump_short" for="shortinfo"
						class="jumplink">公司简介</a></li>
					<li><a href="javascript:;" for="wechat" class="jumplink"
						id="jump_wechat">联系我们</a></li>
				</ul>
				<!-- <form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form> -->
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div id="carousel-example-generic" class="carousel slide margin-b-50" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">

		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox"></div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			onclick="javascript:return false;" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">上一页</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">下一页</span>
		</a>
	</div>

	<!-- 使用栅格 实现3列布局 -->
	<div class="container margin-b-50" id="product" >
		<!-- row 必须包包含在 container 或者 container-fluid里面 -->
		<div class="title">
			<h4 class="text-center">产品展示</h4>
			<div></div>
		</div>

		<!-- <div class="row"> -->
			<%-- <div class="col-md-3">
				<div class="product_show" data-toggle="modal"
					data-target="#product_detail">
					<img src="<%=basePath%>resource/img/1.jpg" alt="" />
					<div class="wordOnPic">
						<h1>FireFox</h1>
						<p>fireFox</p>
					</div>
				</div>
			</div> --%>
		<!-- </div> -->
	</div>
	
	
	<div class="container margin-b-50" id="action" >
		<!-- row 必须包包含在 container 或者 container-fluid里面 -->
		<div class="title">
			<h4 class="text-center">公司动态</h4>
			<div></div>
		</div>
	</div>

	<div id="hotnews" class="container margin-b-50">
		<div class="title">
			<h4 class="text-center">热点新闻</h4>
			<div></div>
		</div>
		<div class="row">
			<%-- <div class="col-md-3">
				<div class="product_show" data-toggle="modal"
					data-target="#product_detail">
					<img src="<%=basePath%>resource/img/1.jpg" alt="" />
					<div class="wordOnPic">
						<h1>FireFox</h1>
						<p>fireFox</p>
					</div>
				</div>
			</div> --%>
		</div>
	</div>

	<div id="shortinfo" class="container margin-b-50">
		<div class="row about">
			<div class="title">
				<h4 class="text-center">公司简介</h4>
				<div></div>
			</div>
			<div class="col-sm-6 logo fade-left">
				<h1>
					SHANG<span>SHANCI.CN</span>
				</h1>
				<h4>尚善磁水™</h4>
				<div class="addr scrollimation fade-right d2 in">
					<address>
						河北省沧州市青县盘古镇官庄村<br> <span class="hidden-xs">电话：</span><i
							class="fa fa-phone visible-xs-inline" aria-hidden="true"></i>+8618034476658<br>
						<span class="hidden-xs">邮箱：</span>business@meweidea.com
					</address>
				</div>
			</div>
			<div class="col-sm-6 slogon scrollimation fade-right d1 in"
				style="over-flow: hidden">
			
				<p>沧州尚善磁水设备有限公司是一家重发展&amp;重质量的企业。一直以稳定可靠的产品质量和良好的经营信誉，取得了广大客户的信任，紧随市场发展趋势，不断地开发新产品，以满足广大客户最新需求。所有的产品均已于通过内部质量标准；</p>
				<p>竭诚欢迎广大的新、老客户来电洽谈合作；</p>
				<p>公司主要经营 磁水设备、环保净化设备研发、制造、销售</p>
				<div class="city text-right scrollimation fade-left d3 in">
					<img src="<%=basePath%>resource/img/city.png">
				</div>
			</div>
		</div>
		<hr id="divider">
	</div>

	<div class="title">
		<h4 class="text-center">联系我们</h4>
		<div></div>
	</div>
	<div id="wechat" class="container">
		<img src="<%=basePath%>resource/img/wechat.jpg">
		<h4>想要获取更详细内容，请扫二维码关注我们的微信服务号进行咨询</h4>
		<p>或</p>
		<p>微信搜索公众号：觅未创意</p>
	</div>
	<footer>
		<p class="pull-right">
			<a href="javascript:;" id="backtotop" class="jumplink" for="0">回到顶部</a>
		</p>
		<p>© 2016 沧州尚善磁水设备有限公司 版权所有 <!-- 京ICP备16046633号 --></p>
	</footer>

	<!-- 弹出框一般直接放到body中 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="product_detail">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body"></div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">瓦卡利玛西嗒</button>
				</div> -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
</html>