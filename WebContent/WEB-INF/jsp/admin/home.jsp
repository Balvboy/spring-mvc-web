<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<h4>创建展示内容</h4>
		<div class="row">
			<div class="col-md-12">
				<form role="form" id="form" action="/admin/save" method="post">
					<!-- <legend>Form Legend</legend> -->
					<h5 style="font-size:18px">标题：</h5>
					<div class="form-group success">
						 <input type="text" name="title"
							class="form-control" id="lineTitle" placeholder="Enter title">
					</div>
					<div class="form-group success">
					<h5 style="font-size:18px">描述：</h5>
						 <input type="text"
							name="description" class="form-control" id="lineTitle"
							placeholder="Enter description">
					</div>
					<h5 style="font-size:18px">文章类别：</h5>
					<label class="radio">
		            <input type="radio" name="type" id="optionsRadios1" value="1" data-toggle="radio" checked="">
		            	头条内容
		            </label>
		            <label class="radio">
		            <input type="radio" name="type" id="optionsRadios2" value="2" data-toggle="radio" >
		            	产品介绍
		            </label>
		            <label class="radio">
		            <input type="radio" name="type" id="optionsRadios3" value="3" data-toggle="radio" >
		            	热点新闻
		            </label>
		            <label class="radio">
		            <input type="radio" name="type" id="optionsRadios3" value="4" data-toggle="radio" >
		            	公司动态
		            </label>
		            <h5 style="font-size:18px">显示图片：</h5>
					<input id="input-700" name="file" type="file" multiple
						class="file-loading"> <input id="lineImage"
						name="showImgPath" hidden="true" type="text">
					<script>
						$("#input-700").fileinput(
							{
								uploadUrl : "/upload/upload", //上传的地址
								allowedFileExtensions : [ 'jpg','png', 'gif', 'jpeg' ],//接收的文件后缀
								showUpload : false, //是否显示上传按钮
								showRemove : false,
								showCaption : false,//是否显示标题
								browseClass : "btn btn-primary", //按钮样式             
								previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
								browseOnZoneClick : true,
								maxFileCount:1
							});
					</script>
					<hr>
					<div id="summernote" name="content" placeholder="请输入详细内容" action="/upload/upload"></div>
					<button type="button" id="submitButton" class="btn btn-primary">提交</button>
				</form>
			</div>
			<!-- /.col-md-12 -->
		</div>
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
	<script type="text/javascript">
		$(document).ready(function() {
			var $this = $("#summernote");
			var placeholder = $this.attr("placeholder") || '';
			var url = $this.attr("action") || '';
			$this.summernote({
				lang : 'zh-CN',
				minHeight : 300,
				disableDragAndDrop : true,
				callbacks : {
					onImageUpload : function(files) {
						var $files = $(files);
						$files.each(function() {
							var file = this;
							var data = new FormData();
							data.append("file",file);
							$.ajax({
								data : data,
								type : "POST",
								url : url,
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) {
									var imageUrl = eval("("+data+")").fileUrl;
									$this.summernote('insertImage',imageUrl,'bac.jpg');
								},
								error : function(){
									console.log("失败");
								}
							});
						});
					}
				}
			});
			
			
			$('#input-700').on('fileselect', function(event, numFiles, label) {
				$('#input-700').fileinput('upload');//上传操作  
			});
			
			$("#input-700").on("fileuploaded",function(event, data, previewId, index) {
				$("#lineImage").val(data.response.fileUrl);
				
			});
			
			$("#submitButton").click(function(){
				var $this = $("#summernote");
		        var $form = $("#form");
		        if (!$this.summernote('isEmpty')) {
		            var editor = "<input type='hidden' name='" + $this.attr("name") + "' value='" + $this.summernote('code') + "' />";
		            $form.append(editor);
		        } else {
					console.log("editor is null")
		        }
		        $form.submit();
			});		
		});
	</script>
</body>
</html>