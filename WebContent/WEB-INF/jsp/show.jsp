<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
<title>${entity.title}</title>
<link rel="icon" href="<%=basePath%>resource/img/favicon.ico"
	mce_href="<%=basePath%>resource/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="<%=basePath%>resource/img/favicon.ico"
	mce_href="<%=basePath%>resource/img/favicon.ico" type="image/x-icon">
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>resource/css/animate.css" rel="stylesheet">
<link href="<%=basePath%>resource/css/index.css" rel="stylesheet">

<%-- <script src="<%=basePath%>resource/js/require.js"></script>
<script src="<%=basePath%>resource/js/main.js"></script> --%>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	${entity.content}
</body>
</html>