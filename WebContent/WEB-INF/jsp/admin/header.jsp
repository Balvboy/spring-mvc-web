<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<!-- container-fluid 表示占用100%宽度  container是占用固定宽度  -->
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display  -->
		<!-- 用来当页面宽度小于一定的值得时候，进行响应式布局的显示 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand jumplink" href="/admin" for="0">后台管理</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/admin/list?type=1" for="huge" class="jumplink"
					id="jump_product">头条内容<span class="sr-only">(current)</span></a></li>
				<li><a href="/admin/list?type=4" for="action" class="jumplink"
					id="jump_action">公司动态<span class="sr-only">(current)</span></a></li>
				<li><a href="/admin/list?type=2" for="product" class="jumplink"
					id="jump_product">产品展示<span class="sr-only">(current)</span></a></li>
				<li><a href="/admin/list?type=3" for="hotnews" class="jumplink">热点新闻</a></li>
				<li><a href="javascript:;" id="jump_short" for="shortinfo"
					class="jumplink">公司信息</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
