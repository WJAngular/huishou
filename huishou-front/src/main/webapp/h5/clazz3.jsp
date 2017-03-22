<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/TouchSlide/TouchSlide.1.1.source.js"></script>
<style type="text/css">
	/* css 重置 */
	body, p, input, h1, h2, h3, h4, h5, h6, ul, li, dl, dt, dd, form { margin: 0; padding: 0; list-style: none; vertical-align: middle; font-weight:normal; }
	img { border:0; margin: 0; padding: 0;   }
	body { color: #000; -webkit-user-select: none; -webkit-text-size-adjust: none; font:normal 16px/200% "微软雅黑", helvetica, arial; text-align:left;   }
	header, section, footer { display: block; margin: 0; padding: 0 }
	a{text-decoration:none;color:#000;}


	/* 内容 */
	#content{ padding:10px 0; background:#fff;  }
	.path{ padding:0 0 5px 5px;   }
	
	
		/* 本例子css -------------------------------------- */
	.tabBox .hd{ height:40px;  padding:0 10px; font-size:16px; background:#00B5AD; border-top:2px solid #00B5AD;  }
	.tabBox .hd ul{ overflow:hidden; }
	.tabBox .hd ul li{ float:left; margin:0 10px; color:#515151;  }
	.tabBox .hd ul .on{ border-bottom:2px solid #BA2636; color:#BA2636;  }
	.tabBox .hd ul .on a{ display:block; /* 修复Android 4.0.x 默认浏览器当前样色无效果bug */  }
	.tabBox .bd ul{ padding:10px 0 10px 10px;  height: 650px }
	.tabBox .bd li{ height:33px; line-height:33px;   }
	.tabBox .bd a{ -webkit-tap-highlight-color:rgba(0,0,0,0); }  /* 去掉链接触摸高亮 */
	.tabBox .bd li a{ color:#555;  }
	.tabBox .bd .t{ height:85px; overflow:hidden;   }
	.tabBox .bd .t .pic{ width:130px; float:left;    }
	.tabBox .bd .t .con{ margin-left:130px; line-height:20px;   }
	.tabBox .bd .t .con p{ font-size:12px; color:#999;  }
	
	
	
</style>




<!-- 头部 Start ================================ -->
	<div class="ui fixed top menu secondary  " style="background-color: #00B5AD">
	   <a class="item"><i class="reply icon"></i></a>
	    <div class="item" style="width: 87%">
	      <div class="ui  icon input">
	        <input type="text" placeholder="搜索你想要卖的型号">
	        <i class="search link icon"></i>
	      </div>
	    </div>
	</div><!-- 头部 Start ================================ -->
	
	
	
	<!-- 本例主要代码 Start ================================ -->
	<div id="leftTabBox" class="tabBox" style="margin-top: 2.6em;">
		<div class="hd">
			<ul>
				<li><a href="#">手机</a></li>
				<li><a href="#">平板</a></li>
				<li><a href="#">镜头</a></li>
				<li><a href="#">游戏机</a></li>
				<li><a href="#">相机</a></li>
				<li><a href="#">笔记本</a></li>
			</ul>
		</div>
		<div class="bd">
				<ul style="height:1000px">
					 <div class="ui  sidebar  vertical menu visible " style="width: 7rem;" >
					   		<div class="item">
							  <p ><b> 苹果1</b></p>
							</div>
								<div class="item">
							  <p ><b> 苹果2</b></p>
							</div>	<div class="item">
							  <p ><b> 苹果3</b></p>
							</div>	
					  </div>	
					  
					    <div class=" pusher    "  style="margin-left: 90px;">
					    		<div class="ui middle aligned divided list" style="font-size: 1rem;margin: -7px;">
								  <div class="item" style="padding: 0.92857143em 1.14285714em;">
								    <div class="content">
								      <a class="header">Daniel Louise</a>
								    </div>
								  </div>
								   <div class="item" style="padding: 0.92857143em 1.14285714em;">
								    <div class="content">
								      <a class="header">Stevie Feliciano</a>
								    </div>
								  </div>
								    <div class="item" style="padding: 0.92857143em 1.14285714em;">
								    <div class="content">
								      <a class="header">Elliot Fu</a>
								    </div>
								  </div>
								</div>
	 					 </div>
  
				</ul>
			
		</div>
	</div>
	<script type="text/javascript">TouchSlide({ slideCell:"#leftTabBox" });</script>
	<!-- 本例主要代码 End ================================ -->
	
	
	
	
	
<script>



</script>
 		
