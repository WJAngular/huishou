<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="image_src" type="image/jpeg"
	href="http://www.semantic-ui.cn/images/logo.png" />

<!-- Site Properities -->
<meta name="generator" content="DocPad v6.78.5" />

<link rel="stylesheet" type="text/css" class="ui"
	href="semantic/semantic.css?casd222">
<link rel="stylesheet" type="text/css" href="semantic/docs.css">
<script src="js/jquery.min.js"></script>
<script src="semantic/semantic.js"></script>
<script src="semantic/highlight.min.js"></script>
<script src="semantic/docs.js"></script>
<script src="semantic/menu.js"></script>

<script type="text/javascript">

	this.CONTEXT_PATH = '<%=request.getContextPath()%>';	
	this.path = CONTEXT_PATH;

	$('.shape').shape("height ","next");	  
	
	function next(){
		$('.shape').shape('flip up');
	}
	
	$(document).ready(function(){
		$('#context1 .menu .item')
		  .tab({
		    context: $('#context1')
		  })
		;
	})
	
</script>

<style type="text/css">
	.ui.steps .icon {
		color: #00B5AD
	}
	
	.clazzcontent{
		    margin-top: 20px;
    margin-bottom: 10px;
    margin-left: 10px;
     font-size: 12px;
    
	}
	.clazzheader{
	color: #00B5AD;
		 margin-right: 20px;
   		 font-size: 18px;
	}
	.clazzitem{
	color: #00B5AD;
		margin-right: 20px;
	}
	.clazzmore{
	
	}
	
</style>
</head>
<body id="example" class="main ui ">

	
	<!-- 顶部菜单 -->
	<div class="ui tiny menu">
		<a class="item">深圳</a>
		<div class="right menu">
			<a class="item">登陆</a> <a class="item">回收车</a> <a class="item">关于我们</a>
			<a class="item">帮助中心</a>
		</div>
	</div><!-- 顶部菜单 -->

	<!-- LOGO 导航条 -->
	<div class="ui grid container">
		<div class="left floated left aligned six wide column">
			<h3 class="ui  image header">
				<img src="image/logo.jpg" class="ui small image">
				<div class="content" style="color: gray;">手机回收一站式平台</div>
			</h3>

		</div>

		<div class="right floated right aligned six wide column">
			<div class="ui big icon input fluid" style="color:#00B5AD ">
				<input type="text" placeholder="请输入手机型号" style="    border: 2px solid #00B5AD ;"> 
				<i class="search icon"></i>
			</div>
		</div>
	</div><!-- LOGO 查询框-->

	<!-- 导航条 -->
	<div class="ui secondary menu pointing massive" >
		  <a class="item " style="margin-left: 0px;" >
		  </a>
		  <a class="item active " style="width: 209px;display: block;text-align: center;">
		    	旧机回收
		  </a>
		  <a class="item " style="margin-left: 100px;display: block;text-align: center;" onclick="next()">
		    	提交型号
		  </a>
		  <a class="item " style="margin-left: 100px;display: block;text-align: center;">
		    	量大回收
		  </a>
		  <a class="item " style="margin-left: 100px;display: block;text-align: center;">
		    	我要加盟
		  </a>
		  <div class="right menu">
		    <a class="ui item">
		    </a>
		  </div>
	</div><!-- 导航条 -->
	
		
		
		<!-- 中部 -->
		<div style="width: 100%;position: relative;height: 356px; margin-top: -14px">
		<!-- 分类框 -->
		<div style="z-index: 2;position: relative;width: 212px;left: 50%;margin-left: -585px;top: 0;">
			<div class="ui secondary vertical menu" style="    background: rgba(68, 68, 68, 0.9);">
			  <div class="ui dropdown item " style="color: white;text-align: center;">
			  		<i class="dropdown icon"></i> 
			  		手机回收
			  	 <div class="menu">
			  	 		
			  	 		
			  	 	<div class="ui divided  items">
					  <div class="item">
					    <div class="clazzcontent">
					       <a class="clazzheader">苹果</a> 
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzmore">更多 ></a>
					    </div>
					  </div>
					 	  <div class="item">
					    <div class="clazzcontent">
					       <a class="clazzheader">苹果</a> 
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzmore">更多 ></a>
					    </div>
					  </div>
					  	  <div class="item">
					    <div class="clazzcontent">
					       <a class="clazzheader">苹果</a> 
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzitem">苹果 Iphone7</a>
					       <a class="clazzmore">更多 ></a>
					    </div>
					  </div>
					</div>

			  	 
			  	 
			    </div>
			  </div>
			</div>	
		</div><!-- 分类框 -->
		
		<!-- 中间广告图 -->
		<div style="width: 100%;position: absolute;height: 356px;top: 0;left: 0;z-index: 1;">
			<div class="ui  shape"  >
				  <div class="sides">
				    <div class="side ">
				          <img src="image/ad1.png" class="ui image" height="356px">
				    </div>
				    <div class="side active">
				          <img src="image/ad2.png" class="ui image" height="356px">
				    </div>
				  </div>
			</div>
		</div><!-- 中间广告图 -->
		</div><!-- 中部 -->


	<!-- 中部流程图 -->
	<div class="ui steps  fluid" style="margin-top: 1px">
	  <div class="step" style="border: 1px solid #00B5AD ;">
	    <i class="search icon"></i>
	    <div class="content">
	      <div class="description">1   搜索机型</div>
	    </div>
	  </div>
	  <div class=" step" style="border: 1px solid #00B5AD ;">
	    <i class="calculator icon"></i>
	    <div class="content">
	      <div class="description">2   商家报价</div>
	    </div>
	  </div>
	  <div class=" step" style="border: 1px solid #00B5AD ;">
	    <i class="desktop icon"></i>
	    <div class="content">
	      <div class="description">3 提交订单</div>
	    </div>
	  </div>
	    <div class=" step" style="border: 1px solid #00B5AD ;">
	    <i class="user icon"></i>
	    <div class="content">
	      <div class="description">4 当面回收</div>
	    </div>
	  </div>
	</div><!-- 中部流程图 -->


	<!-- 热门产品 -->
	<div class="ui  container piled segment" id="context1">
		<div></div>
		<div class="ui pointing secondary menu">
		  <a class="item active" data-tab="first">限时 高价回收</a>
		  <a class="item" data-tab="second">手机</a>
		</div>
		<div class="ui tab segment active" data-tab="first" style="    box-shadow: 0px 0px 0px 0 rgba(34, 36, 38, 0.15);border: 0px">
		  <div class="ui top attached tabular menu">
		    <a class="item active" data-tab="first/a">1A</a>
		    <a class="item" data-tab="first/b">1B</a>
		    <a class="item" data-tab="first/c">1C</a>
		  </div>
		  <div class="ui bottom attached tab segment active" data-tab="first/a">
		  		
		  		<div class="ui five stackable cards link">
				  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>
				  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  <div class="card">
				    <div class="image">
				      <img src="image/phone/1.jpg">
				    </div>
				    <div style="text-align: center;margin-bottom: 15px">
			      		<p>苹果 Iphone 6s</p>
			      		<p>回收最高价格   <a class="ui tag teal label">￥10.00 </a></p> 
   					</div>
				  </div>  
				
				</div>

		  </div>
		  <div class="ui bottom attached tab segment" data-tab="first/b">1B</div>
		  <div class="ui bottom attached tab segment" data-tab="first/c">1C</div>
		</div>
		<div class="ui tab segment" data-tab="second">
		  <div class="ui top attached tabular menu">
		    <a class="item active" data-tab="second/a">2A</a>
		    <a class="item" data-tab="second/b">2B</a>
		    <a class="item" data-tab="second/c">2C</a>
		  </div>
		  <div class="ui bottom attached tab segment active" data-tab="second/a">2A</div>
		  <div class="ui bottom attached tab segment" data-tab="second/b">2B</div>
		  <div class="ui bottom attached tab segment" data-tab="second/c">2C</div>
		</div>
	</div><!-- 热门产品 -->


	
		<!-- 合作伙伴 -->
		<div class="ui segment container">
		  <h2 class="ui left floated header">合作伙伴</h2>
		  <div class="ui clearing divider"></div>
		  
		  <div class="ui internally celled grid center aligned">
		  	  <div class="sixteen wide column">
		  	  		  <div class="ui internally celled grid">
		  	  		 <div class="row">
					    <div class="three wide column">
					        <img src="image/partner/3.png">
					    </div>
					    <div class="three wide column">
					        <img src="image/partner/4.png">
					    </div>
					    <div class="three wide column">
					        <img src="image/partner/5.png">
					    </div>
					    <div class="three wide column">
					         <img src="image/partner/6.png">
					    </div>
					      <div class="three wide column">
					         <img src="image/partner/1.png">
					    </div>
					  </div>
					  
					  <div class="row">
					    <div class="three wide column">
					      <img src="image/partner/7.png">
					    </div>
					    <div class="three wide column">
					        <img src="image/partner/8.png">
					    </div>
					    <div class="three wide column">
					        <img src="image/partner/9.png">
					    </div>
					    <div class="three wide column">
					         <img src="image/partner/10.png">
					    </div>
					      <div class="three wide column">
					         <img src="image/partner/2.png">
					    </div>
					  </div>
			  		</div>
		  	  
		  	  </div>
			</div>
		</div><!-- 合作伙伴 -->

		
		<!-- 底部 -->
		<div>
		<div class="ui grid  " style="background-color: #00B5AD;margin-top: 50px">
			<div class=" two wide column"></div>
			<div class=" three wide column">
				<h2 class="ui header">
				  <i class="trophy icon"></i>
				  <div class="content" style="color: white">高价
				  	<div class="sub header" style="color:wheat">百家竞价 价格公道</div>
				  </div>
				</h2>
			</div>
		<div class=" three wide  column">
				<h2 class="ui header">
				  <i class="hourglass half icon"></i>
				  <div class="content" style="color: white">便捷
				  	<div class="sub header" style="color:wheat">交易便利 节省时间</div>
				  </div>
				</h2>
			</div>
			<div class=" three wide  column">
				<h2 class="ui header">
				  <i class="protect icon"></i>
				  <div class="content" style="color: white">安全
				  	<div class="sub header" style="color:wheat">放心回收 保障有我</div>
				  </div>
				</h2>
			</div>
			<div class=" three wide column">
				<h2 class="ui header">
				  <i class="recycle icon"></i>
				  <div class="content" style="color: white">环保
				  	<div class="sub header" style="color:wheat">综合利用 避免污染</div>
				  </div>
				</h2>
			</div>
			<div class="  two wide column"></div>
		</div>

		
		<div class="ui grid  container five column internally celled center aligned" style="margin-top: 50px">
			<div class="column">
				<div class="ui list">
				<div class="item"> <h4>交易方式</h4></div>
				  <div class="item">回寄方式</div>
				  <div class="item">上门回收方式</div>
				</div>
			</div>
			<div class="column">
				<div class="ui list">
				<div class="item"> <h4>交易方式</h4></div>
				  <div class="item">回寄方式</div>
				  <div class="item">上门回收方式</div>
				</div>
			</div>
			<div class="column">
				<div class="ui list">
				<div class="item"> <h4>交易方式</h4></div>
				  <div class="item">回寄方式</div>
				  <div class="item">上门回收方式</div>
				</div>
			</div>
			<div class="column">
				<div class="ui list">
				<div class="item"> <h4>交易方式</h4></div>
				  <div class="item">回寄方式</div>
				  <div class="item">上门回收方式</div>
				</div>
			</div>
			<div class="column">
				<div class="ui list">
				<div class="item"> <h4>交易方式</h4></div>
				  <div class="item">回寄方式</div>
				  <div class="item">上门回收方式</div>
				</div>
			</div>
		</div>
 		
 		<div class="ui clearing divider"></div>
 
		<div style="text-align: center;">
			<img src="image/bottom/1.png">
			<img src="image/bottom/2.png">
			<img src="image/bottom/3.png">
			<img src="image/bottom/4.png">
			<img src="image/bottom/5.png">
		</div>

		<div style="text-align: center;">
			<p>宝山运营中心：上海市宝山区纪蕴路588号1号楼6楼</p>
			<p>Copyright 2010 - 2016 上海悦易网络信息技术有限公司     沪ICP备10043802号 - 2</p>
		</div>
		<div><!-- 底部 -->

<script src="http://www.semantic-ui.cn/javascript/library/less.min.js"></script>
</body>
</html>