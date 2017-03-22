<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/topmenu.jsp"></jsp:include>
<jsp:include page="layout/search.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>

<script src="js/excolo-slider/jquery.excoloSlider.min.js"></script>
<script src="js/TouchSlide/TouchSlide.1.1.source.js"></script>
<link href="css/excolo-slider/jquery.excoloSlider.css" rel="stylesheet">

<style type="text/css">
	/* css 重置 */
/* 	body, p, input, h1, h2, h3, h4, h5, h6, ul, li, dl, dt, dd, form { margin: 0; padding: 0; list-style: none; vertical-align: middle; font-weight:normal; } */
/* 	img { border:0; margin: 0; padding: 0;   } */
/* 	body { color: #000; -webkit-user-select: none; -webkit-text-size-adjust: none; font:normal 16px/200% "微软雅黑", helvetica, arial; text-align:left;   } */
/* 	header, section, footer { display: block; margin: 0; padding: 0 } */
/* 	a{text-decoration:none;color:#000;} */


	/* 内容 */
	#content{ padding:10px 0; background:#fff;  }
	.path{ padding:0 0 5px 5px;   }
	
	
	/* 本例子css -------------------------------------- */
	.focus{ width:100%; height:356px;  margin:0 auto; position:relative; overflow:hidden;   }
	.focus .hd{ width:100%; height:26px;  position:absolute; z-index:1; bottom:5px; text-align:center;  }
	.focus .hd ul{ display:inline-block; height:20px; padding:3px 5px; background-color:rgba(255,255,255,0.7); 
		-webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; font-size:0; vertical-align:top;
	}
	.focus .hd ul li{ display:inline-block; width:11px; height:13px; -webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; background:#8C8C8C; margin:0 5px;  vertical-align:top; overflow:hidden;   }
	.focus .hd ul .on{ background:#FE6C9C;  }

	.focus .bd{ position:relative; z-index:0; }
	.focus .bd li img{ width:100%;  height:356px; background:url(images/loading.gif) center center no-repeat;  }
	.focus .bd li a{ -webkit-tap-highlight-color:rgba(0, 0, 0, 0); /* 取消链接高亮 */  }
	
	
		/* 本例子css -------------------------------------- */
	.zhijian{ width:100%; height:320px;  margin:0 auto; position:relative; overflow:hidden;   }
	.zhijian .hd{ width:100%; height:26px;  position:absolute; z-index:1; bottom:5px; text-align:center;  }
	.zhijian .hd ul{ display:inline-block; height:20px; padding:3px 5px; background-color:rgba(255,255,255,0.7); 
		-webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; font-size:0; vertical-align:top;
	}
	.zhijian .hd ul li{ display:inline-block; width:11px; height:13px; -webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; background:#8C8C8C; margin:0 5px;  vertical-align:top; overflow:hidden;   }
	.zhijian .hd ul .on{ background:#FE6C9C;  }

	.zhijian .bd{ position:relative; z-index:0; }
	.zhijian .bd li img{ width:100%;  height:320px; background:url(images/loading.gif) center center no-repeat;  }
	.zhijian .bd li a{ -webkit-tap-highlight-color:rgba(0, 0, 0, 0); /* 取消链接高亮 */  }
	
	
	
</style>






		<div style="background-color: #f6f7fb">

		<!-- 中部 -->
		<div style="width: 100%;position: relative;height: 356px; margin-top: -14px" id="middleDiv">
		<!-- 分类框 -->
		<div style="z-index: 2;position: relative;left: 3.4%;">
			<div class="ui secondary vertical menu" style="    background: rgba(68, 68, 68, 0.9);">
			
			
			
			 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s">  
				  <div class="ui dropdown item " style="color: white;text-align: center;">
				  		<i class="dropdown icon"></i> 
				  		${clazz.name}回收
				  	 <div class="menu">
				  	 	<div class="ui divided  items">
		  					<c:forEach items="${clazz.brand }" var="brand" varStatus="s" end="4">
		  					  <c:if test="${brand.id != -1 }">
							  <div class="item">
							    <div class="clazzcontent">
							       <a class="clazzheader">${brand.name }</a> 
							       <c:forEach items="${brand.product }" var="product" varStatus="status" end="2">
								        <a class="clazzitem" onclick="product(${product.id })">${product.name }</a>
							       </c:forEach>
							       <a class="clazzmore" onclick="clazzBrand(${clazz.id},${brand.id})">更多 ></a>
							    </div>
							  </div>
							   </c:if>
						 	</c:forEach>
						 	
						 	 <div class="item">
							    <div class="clazzcontent" >
							       <a class="clazzheader" onclick="clazz(${clazz.id})" style=" font-size: 10px;">更多手机品牌</a> 
							    </div>
							  </div>
							  
						</div>
				    </div>
				  </div>
			  </c:forEach>
			  
			  
			  
			</div>	
		</div><!-- 分类框 -->
		
			
			<!-- 广告图轮播 Start ================================ -->
			<div style="width: 100%;height: 356px;position: absolute;top: 0;left: 0;z-index: 1;">
				<div id="focus" class="focus" >
					<div class="hd">
						<ul></ul>
					</div>
					<div class="bd">
						<ul>
								<li><a href="#"><img src="image/ad1.png" /></a></li>
								<li><a href="#"><img src="image/ad2.png" /></a></li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				TouchSlide({ 
					slideCell:"#focus",
					titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
					mainCell:".bd ul", 
					effect:"left", 
					autoPlay:true,//自动播放
					autoPage:true //自动分页
				});
			</script>
			<!-- 广告图轮播 End ================================ -->
		
		
		</div><!-- 中部 -->


	<!-- 中部流程图 -->
	<div style="border-top: 1px solid rgba(68, 68, 68, 0.9);">
	
		<div class="ui buttons fluid massive ">
		  <button class="ui button olive"> <i class="search icon"></i>1 搜索机型</button>
		  <div class="or"></div>
		  <button class="ui  button green"><i class="calculator icon"></i>2 商家报价</button>
		  <div class="or"></div>
		  <button class="ui  button teal"><i class="desktop icon"></i> 3 提交订单</button> 
		   <div class="or"></div>
		    <button class="ui  button blue"><i class="user icon"></i> 4 当面回收</button>
		</div>


<!-- 		<div class="ui steps  fluid" style="margin-top: 1px"> -->
<!-- 		  <div class="step" style="border: 1px solid #00B5AD ;"> -->
<!-- 		    <i class="search icon"></i> -->
<!-- 		    <div class="content"> -->
<!-- 		      <div class="description">1   搜索机型</div> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
<!-- 		  <div class=" step" style="border: 1px solid #00B5AD ;"> -->
<!-- 		    <i class="calculator icon"></i> -->
<!-- 		    <div class="content"> -->
<!-- 		      <div class="description">2   商家报价</div> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
<!-- 		  <div class=" step" style="border: 1px solid #00B5AD ;"> -->
<!-- 		    <i class="desktop icon"></i> -->
<!-- 		    <div class="content"> -->
<!-- 		      <div class="description">3 提交订单</div> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
<!-- 		    <div class=" step" style="border: 1px solid #00B5AD ;"> -->
<!-- 		    <i class="user icon"></i> -->
<!-- 		    <div class="content"> -->
<!-- 		      <div class="description">4 当面回收</div> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
<!-- 		</div> -->
	</div><!-- 中部流程图 -->

	<!-- 热门产品 -->
	<div class="ui  container piled segment" id="context1">
		<div></div>
		<div class="ui pointing secondary menu">
		 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s">  
		  	<a class="item ${s.index == 0 ? 'active' : '' }" data-tab="${ clazz.id}">${clazz.name}</a>
		 </c:forEach>
		
		</div>
		
		
		 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s">  
			<div class="ui tab segment ${s.index == 0 ? 'active' : '' } " data-tab=${clazz.id} style="    box-shadow: 0px 0px 0px 0 rgba(34, 36, 38, 0.15);border: 0px">
		  <div class="ui top attached tabular menu">
		  
		  	 <c:forEach items="${clazz.brand }" var="brand" varStatus="s" end='10'>
			    <a class="item ${s.index == 0 ? 'active' : '' }" data-tab="${clazz.id}/${brand.id}">${brand.name }</a>
		  	</c:forEach>
		  	 <a class="item " onclick="to_page('/clazz')">更多请点击</a>
		  	
		  </div>
		  
		  <c:forEach items="${clazz.brand }" var="brand" varStatus="s">
			  <div class="ui bottom attached tab segment ${s.index == 0 ? 'active' : '' }" data-tab="${clazz.id}/${brand.id}">
			  		
			  		<div class="ui five stackable cards link">
			  		
			  		   <c:forEach items="${brand.product }" var="product" end='14'>
						  <div class="card" onclick="product(${product.id })">
						    <div class="image">
						      <img src="${product.imgUrl }" alt="${product.name }">
						    </div>
						    <div style="text-align: center;margin-bottom: 15px">
					      		<p>${product.name }</p>
					      		<p>回收次数 <a style="color:orange">${product.hasRecycleQuantity}</a> &nbsp;次</p>
					      		<p>回收最高价格   <a class="ui tag teal label">￥${product.recycleMaxMoney} </a></p> 
		   					</div>
						  </div>
					  </c:forEach>
					  
					</div>
			  </div>
		  </c:forEach>
		  
		</div>
		</c:forEach>
		
		
		
	</div><!-- 热门产品 -->


	
		<!-- 回收质检-->
		<div class="ui segment container">
		  <h2 class="ui left floated header">回收质检</h2>
		  <div class="ui clearing divider"></div>
		  
		  <div class="ui grid">
				  <div class="row">
						<div class=" five wide column">
							<div class="ui teal inverted segment" >
  									<h4 class="ui header">首创手机检测4步</h4>
									<p>【第一步.屏幕检测】屏幕缺角，碎屏幕，屏幕漏光，屏幕色差，屏幕失控触摸情况、屏幕是否有划痕等各种问题</p>
  									<p>【第二步.外观检测】进行外观成色鉴定，检查是否拆修，按键是否损坏等</p>
  									<p>【第三步.性能检测】手机触屏，手机存储，通话感应，拍照，蓝牙，扬声器，听筒，wifi等功能检测</p>
  									<p>【第四步.综合估价】安特回收质检员收到快递后将扫描单号，匹对您的基本情况，确认无误后将信息转达给用户，并马上返款</p>
  									<p></p>
								</div>
						</div>
						<div class=" six wide column">
									<!-- 广告图轮播 Start ================================ -->
								<div style="width: 100%;height: 320px;position: absolute;top: 0;left: 0;z-index: 1;">
									<div id="zhijian" class="zhijian" >
										<div class="hd">
											<ul></ul>
										</div>
										<div class="bd">
											<ul>
													<li><a href="#"><img src="image/zhijian/1.jpg" /></a></li>
													<li><a href="#"><img src="image/zhijian/2.jpg" /></a></li>
													<li><a href="#"><img src="image/zhijian/3.jpg" /></a></li>
													<li><a href="#"><img src="image/zhijian/4.jpg" /></a></li>
											</ul>
										</div>
									</div>
								</div>
								<script type="text/javascript">
									TouchSlide({ 
										slideCell:"#zhijian",
										titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
										mainCell:".bd ul", 
										effect:"left", 
										autoPlay:true,//自动播放
										autoPage:true //自动分页
									});
								</script>
								<!-- 广告图轮播 End ================================ -->
						</div>
						
						<div class=" five wide column">
							<img alt="" src="image/zhijian/6.png" class="ui image" height="320px" onclick="to_page('/other/join/view.jsp?curNav=join')">
						</div>
				  </div>
		  </div>
		</div><!-- 回收质检 -->
		
		
		
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
		
		
		</div>










<script type="text/javascript">

	this.productActionUrl = "/trade/product"
	this.clazzActionUrl = "/clazz"
	
	function product(id){
		var actionParams = {"id":id};
		standardPost(productActionUrl,actionParams)	;
	}
	
	function clazzBrand(clazzid,brandid){
		console.log(clazzid+":"+brandid)
		var actionParams = {"clazzId":clazzid,"brandId":brandid};
		standardPost(clazzActionUrl,actionParams)	;
	}
	
	function clazz(clazzid){
		console.log(clazzid)
		var actionParams = {"clazzId":clazzid};
		standardPost(clazzActionUrl,actionParams)	;
	}
	
	
	var timer;
	function advAuto(){
		$('.shape').shape('flip up');
		clearTimeout(timer);
		timer = setTimeout("advAuto()", 5000);
	}
	
	
	$(document).ready(function(){
		
		
	})
	
	
</script>
<jsp:include page="layout/footer.jsp"></jsp:include>