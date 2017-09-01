require.config({
　　　　baseUrl: "resource/js",
　　　　paths: {
　　　　　　"jquery": "jquery.min",
      	"bootstrap": "bootstrap/bootstrap.min",
　　　　},
	 shim: {
	    "bootstrap" : {
	        deps : ["jquery"]
	    }
	 }
　　});
// 所需要的模块 ，别名
require(['jquery','bootstrap'], function ($){
	  // alert("“精神互撸”（Mental Mutual
		// Masturbation）：两个或一群人在一起谈论一些宽泛的概念、和缺乏实质性的内容，从而获得一种优于他人的自我感受，在惺惺相惜、互相吹捧中共同营造一种智力上升的幻想。");
	$(document).ready(function() {
		/*
		 * $("#demo_nav li a").click(function() { var href =
		 * $(this).attr("href"); $("#tab-list a[href='" + href +
		 * "']").tab("show"); });
		 */
		
		$(window).scroll(function(){    
			executeAnimate();
		});
		
		executeAnimate();
		
		function executeAnimate(){
			var b = document.getElementById("shortinfo").offsetTop;
			if (b >= $(window).scrollTop() && b < ($(window).scrollTop()+$(window).height())) {
				$('.fade-left').addClass('animated fadeInLeft');
				$('.fade-right').addClass('animated fadeInRight');
			}
			var a = document.getElementById("wechat").offsetTop;
	        if (a >= $(window).scrollTop() && a < ($(window).scrollTop()+$(window).height())) {
	        	$("#wechat").addClass("animated zoomIn");
	        }
		}
		
		$(".jumplink").click(function(){
			var targetid = $(this).attr("for");
			console.log("targetId is "+ targetid)
			if(targetid == 0){
				$('html,body').animate({scrollTop:0}, 800);
			}else{				
				$('html,body').animate({scrollTop:$('#'+targetid).offset().top-200}, 800);
			}
		})
		
		function loadHugeImg(){
			$.get("/show/showsByType?type=1",function(data){
				var indicated = "";
				var html = "";
				if(data.respCode == "1"){
					for (var i=0;i<data.data.list.length;i++){
						var item = data.data.list[i];
						if(i == 0 ){						
							indicated += '<li data-target="#carousel-example-generic" data-slide-to="'+i+'" class="active"></li>';
							html += '<div class="item active" data-toggle="modal" data-target="#product_detail" showId='+item.id+' >';
						}else{
							indicated += '<li data-target="#carousel-example-generic" data-slide-to="'+i+'"></li>';
							html += '<div class="item" data-toggle="modal" data-target="#product_detail" showId='+item.id+' >';
						}
						html += '<img src="'+item.showImgPath+'" alt="...">';
						html += '<div class="carousel-caption">';
						html += '<h1 class="animated fadeInLeft">'+item.title+'</h1>'
						html += '<p class="animated fadeInRight">'+item.description+'</p>'
						html += '</div></div>';
						
					}
					$(".carousel-indicators").html(indicated);
					$(".carousel-inner").html(html);
				}
			});
		}
		loadHugeImg();
		
		function loadProduct(){
			$.get("/show/showsByType?type=2",function(data){
				var html = "";
				if(data.respCode == "1"){
					if(data.data.list.length > 0){
						for (var i = 0;i<data.data.list.length;i++){
							var item = data.data.list[i];
							if(i % 4 == 0){								
								html += '<div class="row">';
							}
							html += '<div class="col-md-3">';
							html += '<div class="product_show item" data-toggle="modal" data-target="#product_detail" showId='+item.id+'>';
							html += '<img src="'+item.showImgPath+'" alt="" />';
							html += '<div class="wordOnPic">';
							html += '<h1>'+item.title+'</h1>';
							html += '<p>'+item.description+'</p>';
							html += '</div></div></div>';
							
							if( i == (data.data.list.length -1) || i % 4 == 3){
								html += "</div>";
							}
							
						}
					}	
				}
				html += '<hr id="divider">';
				$("#product").append(html);
			});
		}
		loadProduct();
		
		function loadHotNews(){
			$.get("/show/showsByType?type=3",function(data){
				var html = "";
				if(data.respCode == "1"){
					if(data.data.list.length > 0){
						for (var i=0;i<data.data.list.length;i++){
							var item = data.data.list[i];
							if(i % 4 == 0){								
								html += '<div class="row">';
							}
							html += '<div class="col-md-3">';
							html += '<div class="product_show item" data-toggle="modal" data-target="#product_detail" showId='+item.id+'>';
							html += '<img src="'+item.showImgPath+'" alt="" />';
							html += '<div class="wordOnPic">';
							html += '<h1>'+item.title+'</h1>';
							html += '<p>'+item.description+'</p>';
							html += '</div></div></div>';
							if( i == (data.data.list.length -1) || i % 4 == 3){
								html += "</div>";
							}
						}
					}
				}
				html += '<hr id="divider">';
				$("#hotnews").append(html);
				
			});
		}
		loadHotNews();
		
		function loadAction(){
			$.get("/show/showsByType?type=4",function(data){
				var html = "";
				if(data.respCode == "1"){
					if(data.data.list.length > 0){
						for (var i=0;i<data.data.list.length;i++){
							var item = data.data.list[i];
							if(i % 4 == 0){								
								html += '<div class="row">';
							}
							html += '<div class="col-md-3">';
							html += '<div class="product_show item" data-toggle="modal" data-target="#product_detail" showId='+item.id+'>';
							html += '<img src="'+item.showImgPath+'" alt="" />';
							html += '<div class="wordOnPic">';
							html += '<h1>'+item.title+'</h1>';
							html += '<p>'+item.description+'</p>';
							html += '</div></div></div>';
							if( i == (data.data.list.length -1) || i % 4 == 3){
								html += "</div>";
							}
						}
					}
				}
				html += '<hr id="divider">';
				$("#action").append(html);
				
			});
		}
		loadAction();
		
		//对动态生成的元素需要对其父类绑定事件，然后时间触发的时候进行元素过滤
		$("#product").on("mouseenter",".product_show",function(){
			var img = $(this).find("img");
			img.css("transform", "scale(1.5)");
			img.css("transition-duration", "0.7s");
			img.next("div").show(100);
		})
		
		$("#product").on("mouseleave",".product_show",function(){
			var img = $(this).find("img");
			img.css("transform", "scale(1)");
			img.css("transition-duration", "0.7s");
			img.next("div").hide(100);
		})
		
		$("#hotnews").on("mouseenter",".product_show",function(){
			var img = $(this).find("img");
			img.css("transform", "scale(1.5)");
			img.css("transition-duration", "0.7s");
			img.next("div").show(100);
		})
		
		$("#hotnews").on("mouseleave",".product_show",function(){
			var img = $(this).find("img");
			img.css("transform", "scale(1)");
			img.css("transition-duration", "0.7s");
			img.next("div").hide(100);
		})
		
		$("#action").on("mouseenter",".product_show",function(){
			var img = $(this).find("img");
			img.css("transform", "scale(1.5)");
			img.css("transition-duration", "0.7s");
			img.next("div").show(100);
		})
		
		$("#action").on("mouseleave",".product_show",function(){
			var img = $(this).find("img");
			img.css("transform", "scale(1)");
			img.css("transition-duration", "0.7s");
			img.next("div").hide(100);
		})
		
		if(window.innerWidth > 800){			
			$("#product_detail").on("show.bs.modal",function(e){
				var showId = $(e.relatedTarget).attr("showId");
				$.get("/show/showContent?id="+showId,function(data){
					console.log(data.data);
					$("#product_detail .modal-body").html(data.data);
				});
			});
		}else{
			$("#product").on("click",".item",function(e){
				//$("#product_detail").modal("hide");
				var showId = $(this).attr("showId");
				window.location.href="/show/showContentView?id="+showId;
			})
			$(".carousel-inner").on("click",".item",function(e){
				//$("#product_detail").modal("hide");
				var showId = $(this).attr("showId");
				window.location.href="/show/showContentView?id="+showId;
			})
			$("#hotnews").on("click",".item",function(e){
				//$("#product_detail").modal("hide");
				var showId = $(this).attr("showId");
				window.location.href="/show/showContentView?id="+showId;
			})
			$("#action").on("click",".item",function(e){
				//$("#product_detail").modal("hide");
				var showId = $(this).attr("showId");
				window.location.href="/show/showContentView?id="+showId;
			})
		}
	
	
	})
});

