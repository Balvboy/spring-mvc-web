<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>后台管理</title>

<!-- Bootstrap -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>resource/css/flat-ui.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=basePath%>resource/img/favicon.ico">

<!-- upload plugin -->
<link href="<%=basePath%>resource/css/fileinput.css" media="all"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resource/css/summernote.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePath%>resource/js/jquery.min.js"></script>
<script src="<%=basePath%>resource/js/fileinput.js"
	type="text/javascript"></script>
<style>
body {
	padding-top: 50px;
	padding-bottom: 200px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<h4>${typeName }列表</h4>
		<c:forEach items="${list}" varStatus="i" var="item" >  
            <div class="row">
				<div class="col-xs-6">
					<h5>${item.title }</h5>
				</div>
				<div class="col-xs-3">
					<a href="/admin/showUpdate?id=${item.id }&type=${type}" class="btn btn-block btn-lg btn-primary">修改</a>
				</div>
				<div class="col-xs-3">
					<a href="/admin/showDel?id=${item.id }&type=${type}" class="btn btn-block btn-lg btn-danger">删除</a>
				</div>
			</div>  
			<hr/>
			
        </c:forEach>
	</div>
	<!-- /.container -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<%-- <script src="<%=basePath%>resource/js/flat-ui.js"></script> --%>
	<%-- <script src="<%=basePath%>resource/js/application.js"></script> --%>

	<script src="<%=basePath%>resource/js/locales/zh.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>resource/js/bootstrap/bootstrap.js"></script>
	<script src="<%=basePath%>resource/js/summernote.min.js"
		type="text/javascript"></script>
</body>
</html>