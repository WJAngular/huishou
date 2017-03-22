<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>


<!-- 图片轮播插件
	http://www.superslide2.com/
	http://excolo.github.io/Excolo-Slider/
 -->
<script src="<%=request.getContextPath()%>/js/excolo-slider/jquery.excoloSlider.min.js"></script>
<script src="<%=request.getContextPath()%>/js/TouchSlide/TouchSlide.1.1.source.js"></script>
<link href="<%=request.getContextPath()%>/css/excolo-slider/jquery.excoloSlider.css" rel="stylesheet">

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
	
	/* 广告图 css -------------------------------------- */
	.focus{ width:100%; height:200px;  margin:0 auto; position:relative; overflow:hidden;   }
	.focus .hd{ width:100%; height:5px;  position:absolute; z-index:1; bottom:0; text-align:center;  }
	.focus .hd ul{ overflow:hidden; display:-moz-box; display:-webkit-box; display:box; height:5px; background-color:rgba(51,51,51,0.5);   }
	.focus .hd ul li{ -moz-box-flex:1; -webkit-box-flex:1; box-flex:1; }
	.focus .hd ul .on{ background:#00B5AD ;  }
	.focus .bd{ position:relative; z-index:0; }
	.focus .bd li img{ width:100%;  height:200px; }
	.focus .bd li a{ -webkit-tap-highlight-color:rgba(0, 0, 0, 0); /* 取消链接高亮 */ }
	
	
	
		/* 热门产品css -------------------------------------- */
	.tabBox .hd{ height:40px; line-height:40px; padding:0 10px; font-size:16px; background:#F3F3F3; border-top:2px solid #CECECE;  }
	.tabBox .hd ul{ overflow:hidden;  }
	.tabBox .hd ul li{ float:left; margin:0 10px; color:#515151;  }
	.tabBox .hd ul .on{ border-bottom:2px solid #BA2636; color:#BA2636;  }
	.tabBox .hd ul .on a{ display:block; /* 修复Android 4.0.x 默认浏览器当前样色无效果bug */  }
	.tabBox .bd ul{ padding:10px 0 10px 10px;  }
	.tabBox .bd li{ height:33px; line-height:33px;   }
	.tabBox .bd a{ -webkit-tap-highlight-color:rgba(0,0,0,0); }  /* 去掉链接触摸高亮 */
	.tabBox .bd li a{ color:#555;  }
	.tabBox .bd .t{ height:85px; overflow:hidden;   }
	.tabBox .bd .t .pic{ width:130px; float:left;    }
	.tabBox .bd .t .con{ margin-left:130px; line-height:20px;   }
	.tabBox .bd .t .con p{ font-size:12px; color:#999;  }
	
	
	/* 合作伙伴css -------------------------------------- */
	.picScroll{ margin:10px auto; text-align:center;  }
	.picScroll .bd ul{ width:100%;  float:left; padding-top:10px;  }
	.picScroll .bd li{ width:33%; float:left; font-size:14px; text-align:center;  }
	.picScroll .bd li a{-webkit-tap-highlight-color:rgba(0, 0, 0, 0); /* 取消链接高亮 */ }
	.picScroll .bd li img{ width:90px; height:90px;  background:url(../images/m/partner/loading.gif) #fff center center no-repeat;  }


	.picScroll .hd{ height:40px; line-height:40px; border-bottom:2px solid #80BD6D; background:#f6f6f6;   overflow:hidden; text-align:left;  padding:0 10px;  }
	.picScroll .hd ul{ float:right; padding-top:16px;   }	
	.picScroll .hd li{ float:left; width:8px; height:8px; background:#D0D0D0; margin:0 5px; overflow:hidden; 
	-webkit-border-radius:8px; -moz-border-radius:8px; border-radius:8px; 
	}
	.picScroll .hd .on{ background:#80BD6D;  }
	.picScroll .prev,.picScroll .next{ display:block; float:right;  width:18px; height:18px; background:url(../images/m/partner/pisScrollIcons.gif) -6px -7px no-repeat; overflow:hidden; margin:11px 5px 0 5px;  }
	.picScroll .next{ background-position:-34px -7px; }
	.picScroll .prevStop{ background-position:-6px -40px; }
	.picScroll .nextStop{ background-position:-34px -40px; }
	
	
</style>


	<!-- 头部 Start ================================ -->
	<div class="ui  fixed menu secondary" style="background-color: white;">
	  <div class="item">
	    <img src="/huishou-front/image/logo.png" class="ui image small">
	  </div>
	   <div class="right menu">
		  <a onclick="popLoginModal()" class="item">
	        <div class="ui button basic teal">订单中心</div>
	      </a>
	  </div>
	</div><!-- 头部 Start ================================ -->


	
	<!-- 广告图轮播 Start ================================ -->
	<div id="focus" class="focus" style="margin-top: 4.6em;">
		<div class="hd">
			<ul></ul>
		</div>
		<div class="bd">
			<ul>
					<li><a href="#"><img src="<%=request.getContextPath()%>/images/m/adv1.png" /></a></li>
					<li><a href="#"><img src="<%=request.getContextPath()%>/images/m/adv2.jpg" /></a></li>
					<li><a href="#"><img src="<%=request.getContextPath()%>/images/m/adv1.png" /></a></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		TouchSlide({ 
			slideCell:"#focus",
			titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
			mainCell:".bd ul", 
			effect:"leftLoop", 
			autoPlay:true,//自动播放
			autoPage:true //自动分页
		});
	</script>
	<!-- 广告图轮播 End ================================ -->
			
			
			
	
	<!-- 分类 ================================================================-->
	<div class="ui celled grid three column padded">
		
		<div class="row">
			<div class="column center aligned">
			        <img src="<%=request.getContextPath()%>/images/m/clazz/tel.png" class="ui small image centered">
			        <p>手机回收</p>
			</div>
			<div class="column center aligned">
			        <img src="<%=request.getContextPath()%>/images/m/clazz/pad.png" class="ui small image centered">
			        <p>平板回收</p>
			</div>
			<div class="column center aligned">
			        <img src="<%=request.getContextPath()%>/images/m/clazz/laptop.png" class="ui small image centered">
			        <p>笔记本回收</p>
			</div>
		</div>
		<div class="row">
			<div class="column center aligned">
			        <img src="<%=request.getContextPath()%>/images/m/clazz/glass.png" class="ui small image centered">
			        <p>镜头回收</p>
			</div>
			<div class="column center aligned">
			        <img src="<%=request.getContextPath()%>/images/m/clazz/game.png" class="ui small image centered">
			        <p>游戏机回收</p>
			</div>
			<div class="column center aligned">
			        <img src="<%=request.getContextPath()%>/images/m/clazz/camer.png" class="ui small image centered">
			        <p>相机回收</p>
			</div>
		</div>
	
	</div><!-- 分类 ================================================================-->
	
	
	<h4 class="ui horizontal divider blue header">
	  <i class="tag icon"></i>
	  热门回收机型
	</h4>
	

<!-- 本例主要代码 Start ================================ -->
	<div id="leftTabBox" class="tabBox">
		<div class="hd">
			<ul>
				 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s">  
		  			<li><a href="#">${clazz.name}</a></li>
		 		</c:forEach>
			</ul>
		</div>
		<div class="bd">
				<ul>
					 <div class="ui six doubling cards">
						<div class="ui  card">
						      <div class="image" style=" display: block; width: 134px; height: 134px; margin: 0 auto;">
						        <img src="http://static.aihuishou.com/image?file=5502b8bdc4aec790430000c1&amp;w=134&amp;h=134">
						      </div>
						     <div class="center floated content" style=" text-align: center;">
						        <h4>苹果 iPhone6</h4>
						        <h6>回收最高价格 <a style="color:orange">5000元 </a> </h6>
  								  <div class="ui  basic attached teal button">
							      <i class="add icon"></i> 立即回收
							    </div>
						      </div>
						        
					    </div>
						</div>
				</ul>
				<ul>
					
				</ul>
				<ul>
				</ul>
				<ul>
				</ul>
				<ul>
				</ul>
				<ul>
				</ul>
		</div>
	</div>
	<script type="text/javascript">TouchSlide({ slideCell:"#leftTabBox" });</script>
	<!-- 本例主要代码 End ================================ -->
			
			
	<h4 class="ui horizontal divider blue header">
	  <i class="tag icon"></i>
	 	安特回收保证
	</h4>
	
	
	<!-- 本例主要代码 Start ================================ -->
			<div id="picScroll" class="picScroll">
				<div class="hd">
						<span class="next"></span>
						<ul></ul>
						<span class="prev"></span>
						<h3 style="    margin-top: 10px;}">合作伙伴</h3>
				</div>
				<div class="bd">
						<ul>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/1.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/2.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/3.png" src="images/blank.png" /></a></li>
						</ul>

						<ul>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/4.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/5.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/6.png" src="images/blank.png" /></a></li>
						</ul>

				</div>
			</div>
			<script type="text/javascript">
				TouchSlide({ 
					slideCell:"#picScroll",
					titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
					autoPage:true, //自动分页
					pnLoop:"false", // 前后按钮不循环
					switchLoad:"_src" //切换加载，真实图片路径为"_src" 
				});
			</script>
			<!-- 本例主要代码 End ================================ -->
			
			
			<!-- 页脚 -->
			<div class="ui internally celled grid center aligned" style="background-color: #f4f4f4;">
			  <div class="row">
			    <div class="five wide column">
			     首页
			    </div><div class="six wide column">
			     订单
			    </div>
			    
			    <div class="five wide column">
			      电脑版
			    </div>
			  </div>
			    <div class="row">
			    	<div class="column">
			    		<h6>Copyright 2010 - 2016 上海悦易网络信息技术有限公司</h6> 
			    		<h6>沪ICP备10043802号 - 2</h6>
			    	</div>
			    </div>
			</div>
			<!-- 页脚 -->






<div class="ui modal small" >
	  <i class="close icon"></i>
	  <div class="header">登陆订单中心</div>
	  <div class="content">
	  
	  		<div class=" ui grid "> 
	  			<div class=" column "> 
	  				    <form class="ui form mini" id="loginForm">
					      <div class="field" id="contactTelDiv">
					        <input type="text" id="tel" value="" name="tel" placeholder="输入提交订单的手机号">
					      </div>
						
					      <div class="field">
					     		<div class="ui mini icon input">
							    <input type="text" placeholder="请输入图片验证码" id="code" name="imgCode">
							    <img id="codeImg" src="<%=request.getContextPath()%>/system/randomCode" class="ui image" onclick="javascript:this.src='<%=request.getContextPath()%>/system/randomCode?' + new Date().getTime();">
							</div>
					      </div>
						      
					      <div class="field">
					        <div class="ui action input">
							  <input type="text" placeholder="输入短信验证码" name="smsCode" id="smsCode" value="">
							  <button class="ui button" id="sendMobileCodeBtn" onclick="validImageCode()" type="button">
									  		<a id="sendMobileCodeMsg">获取短信验证码</a>
							  </button>
							</div>
					      </div>
					      
					      <div class="ui error message"></div>
					      	
					       <div class="field">
							  <button class="ui button teal fluid " type="button" onclick="login()" id="loginBtn">登陆</button>
					      </div>
				    </form>
	  			</div>
	  			
	  		</div>
	  		
	    
	  </div>
	</div>





<script>


function popLoginModal(){
	
	$('.ui.modal').modal('show');
}


$(function () {
    $("#slider").excoloSlider();
});
</script>