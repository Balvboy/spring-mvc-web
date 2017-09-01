<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

   <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/theme.css">
    <link rel="stylesheet" href="${ctx}/resource/font-awesome/css/font-awesome.css">

    <script src="${ctx}/resource/js/bootstrap/bootstrap.js"></script>
	
    <script src="${ctx}/resource/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <!-- Demo page code -->

	<script type="text/javascript">
		$(function(){
			
			$("#signin").click(function(){
				
				$("#loginForm").submit();
				
			});
			
		})
	</script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

  
  </head>

  <body class=""> 

    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="javascript:;"><span class="first">管理</span> <span class="second">系统</span></a>
        </div>
    </div>
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">Sign In</p>
            <div class="block-body">
                <form action="${ctx }/login" method="post" id="loginForm">
                    <label>Username</label>
                    <input type="text" name="username" class="span12">
                    <label>Password</label>
                    <input type="password" name="password" class="span12">
                    <a href="#" id="signin" class="btn btn-primary pull-right">Sign In</a>
                    <!-- <label class="remember-me"><input type="checkbox"> Remember me</label> -->
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <p class="pull-right" style=""><a href="#" target="blank">Theme by Portnine</a></p>
        <p><a href="reset-password.html">Forgot your password?</a></p>
    </div>
</div>
<script>
$(document).ready(function(){
	  $(".btn.btn-primary.pull-right").click(function(){
		  $("form").submit();
      });
});
</script>

    


    
  </body>
</html>


