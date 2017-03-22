<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.focus .hd ul .on{ background:#d4d4d5 ;  }
	.focus .bd{ position:relative; z-index:0; }
	.focus .bd li img{ width:100%;  height:200px; }
	.focus .bd li a{ -webkit-tap-highlight-color:rgba(0, 0, 0, 0); /* 取消链接高亮 */ }
	
	
	
		/* 热门产品css -------------------------------------- */
	.tabBox .hd{ height:40px; line-height:40px;  font-size:10px; background:#F3F3F3; border-top:2px solid #CECECE;  }
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
	.picScroll .bd li img{ width:90px; height:90px;  background:url(<%=request.getContextPath()%>/images/m/partner/loading.gif) #fff center center no-repeat;  }


	.picScroll .hd{ height:40px; line-height:40px; border-bottom:2px solid #80BD6D; background:#f6f6f6;   overflow:hidden; text-align:left;  padding:0 10px;  }
	.picScroll .hd ul{ float:right; padding-top:16px;   }	
	.picScroll .hd li{ float:left; width:8px; height:8px; background:#D0D0D0; margin:0 5px; overflow:hidden; 
	-webkit-border-radius:8px; -moz-border-radius:8px; border-radius:8px; 
	}
	.picScroll .hd .on{ background:#80BD6D;  }
	.picScroll .prev,.picScroll .next{ display:block; float:right;  width:18px; height:18px; background:url(<%=request.getContextPath()%>/images/m/partner/pisScrollIcons.gif) -6px -7px no-repeat; overflow:hidden; margin:11px 5px 0 5px;  }
	.picScroll .next{ background-position:-34px -7px; }
	.picScroll .prevStop{ background-position:-6px -40px; }
	.picScroll .nextStop{ background-position:-34px -40px; }
	
	
</style>


	<!-- 头部 Start ================================ -->
	<div class="ui  fixed menu secondary" style="background-color: white;">
	  <div class="item" style="margin-left: -15px;">
	    <img src="<%=request.getContextPath()%>/image/logo.png" class="ui image small">
	  </div>
	   <div class="right menu">
		  
		  
		  	<c:if test="${ empty user }">
		  	<a onclick="popLoginModal()" class="item">
	        <div class="ui button basic teal">订单中心</div>
	         </a>
	        </c:if>
	        
	       <c:if test="${not empty user }" >
		        <div class="item">
				  <a onclick="to_page('/user/home')">${user.username }</a><a>&nbsp;|&nbsp;</a>
				  <a onclick="logout()">退出</a>
				</div>
		  </c:if>

	     
	  </div>
	</div><!-- 头部 Start ================================ -->


	
	<!-- 广告图轮播 Start ================================ -->
	<div id="focus" class="focus" style="margin-top: 4.6em;">
		<div class="hd">
			<ul></ul>
		</div>
		<div class="bd">
			<ul>
					<li><a href="#"><img src="<%=request.getContextPath()%>/images/m/ad1.png" /></a></li>
					<li><a href="#"><img src="<%=request.getContextPath()%>/images/m/ad2.png" /></a></li>
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
	<div class="ui celled grid three column padded" style="font-size: 14px;">
		
		<div class="row">
		
			 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s">  
		  				<c:if test="${fn:contains(clazz.name,'手机')  }">
		  					<div class="column center aligned">
		  					<img onclick="clazz(${clazz.id})" style="width: 50px" src="<%=request.getContextPath()%>/images/m/clazz/tel.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
		  				<c:if test="${fn:contains(clazz.name,'平板')  }">
		  				<div class="column center aligned">
		  					<img onclick="clazz(${clazz.id})" style="width: 50px" src="<%=request.getContextPath()%>/images/m/clazz/pad.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
		 	</c:forEach>
			<div class="column center aligned">
			        <img onclick="clazz(${clazz.id})" style="width: 50px" src="<%=request.getContextPath()%>/images/m/clazz/laptop.png" class="ui small image centered">
			        <p>笔记本回收</p>
			</div>
			
		</div>
		<div class="row">
		
		    <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s">  
		  				<c:if test="${fn:contains(clazz.name,'单反')  }">
		  				<div class="column center aligned">
		  					<img onclick="clazz(${clazz.id})" style="width: 50px" src="<%=request.getContextPath()%>/images/m/clazz/glass.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
		  				<c:if test="${fn:contains(clazz.name,'手表')  }">
		  				<div class="column center aligned">
		  					<img onclick="clazz(${clazz.id})" style="width: 50px" src="<%=request.getContextPath()%>/images/m/clazz/game.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
				      <c:if test="${fn:contains(clazz.name,'相机')  }">
				      <div class="column center aligned">
		  					<img onclick="clazz(${clazz.id})" style="width: 50px" src="<%=request.getContextPath()%>/images/m/clazz/camer.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
		 	</c:forEach>
		 
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
				 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s" end='4'>  
		  			<li><a href="#">${clazz.name}</a></li>
		 		</c:forEach>
			</ul>
		</div>
		<div class="bd">
				 <c:forEach items="${clazzBrandProduct }" var="clazz" varStatus="s" end='4'>  
					<ul>
						 <c:forEach items="${clazz.brand }" var="brand" varStatus="s" end='10'>
						     <c:if test="${brand.id == -1 }">
								 <div class="ui six doubling cards">
								 	
								 	  <c:forEach items="${brand.product }" var="product" end='5'>
											<div class="ui  card" onclick="product(${product.id })">
<!-- 											      <div class="image" style=" display: block; width: 134px; height: 134px; margin: 0 auto;"> -->
											      <div class="image" >
											        <img src="${product.imgUrl }">
											      </div>
											     <div class="center floated content" style=" text-align: center;">
											        <h4>${product.name }</h4>
											        <h6>回收最高价格 <a style="color:orange">￥${product.recycleMaxMoney} </a> </h6>
					  								  <div class="ui  basic attached teal button tiny">
												      <i class="add icon"></i> 立即回收
												    </div>
											      </div>
											        
										    </div>
								    </c:forEach>
								    
								</div>
							</c:if>
						</c:forEach>
					</ul>
				</c:forEach>
		</div>
	</div>
	<script type="text/javascript">TouchSlide({ slideCell:"#leftTabBox" });</script>
	<!-- 本例主要代码 End ================================ -->
			
			
	<h4 class="ui horizontal divider blue header">
	  <i class="tag icon"></i>
	 	安特回收保证
	</h4>
	
	
	<div class="ui grid">
		<div class="centered row">
			  <div class="ui mobile reversed equal width grid ">
			  <div class="column">
			     <img style="width: 50px" src="<%=request.getContextPath()%>/image/guarren/free.png">
							  <h6>全国范围免邮</h6>
			  </div>
			  <div class="column">
			     <img style="width: 50px" src="<%=request.getContextPath()%>/image/guarren/protect.png">
							  <h6>72小时价格保护</h6>
			  </div>
			  <div class="column">
			     <img style="width: 50px" src="<%=request.getContextPath()%>/image/guarren/oneday.png">
							  <h6>1天内打款</h6>
			  </div>
			</div>
			</div>
			
				<div class="centered row">
			  <div class="ui mobile reversed equal width grid ">
			  <div class="column">
			     <img style="width: 50px" src="<%=request.getContextPath()%>/image/guarren/safe.png">
							  <h6>安全数据清除</h6>
			  </div>
			  <div class="column">
			     <img style="width: 50px" src="<%=request.getContextPath()%>/image/guarren/leatest.png">
							  <h6>最新报价</h6>
			  </div>
			  <div class="column">
			     <img style="width: 50px" src="<%=request.getContextPath()%>/image/guarren/team.png">
							  <h6>专业检测团队</h6>
			  </div>
			</div>
			</div>
			
	</div>
		
	
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
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/10.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/6.png" src="images/blank.png" /></a></li>
						</ul>
						
						<ul>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/7.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/8.png" src="images/blank.png" /></a></li>
							<li><a href="#"><img _src="<%=request.getContextPath()%>/images/m/partner/9.png" src="images/blank.png" /></a></li>
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
				    <div class="five wide column" onclick="to_page('/h5/info/about/view.jsp')">
				       	联系我们
				    </div>
				    <div class="five wide column" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=1552107066&site=qq&menu=yes')">
				     	QQ客服
				    </div>
				    <div class="five wide column" onclick="popLoginModal()">
				     	我的订单
				    </div>
			  </div>
			  <div class="row">
				    <div class="five wide column" onclick="to_page('/h5/other/newproduct/view.jsp')">
				       	提交型号
				    </div>
				    <div class="five wide column" onclick="to_page('/h5/other/bigrecycle/view.jsp')">
				     	量大回收
				    </div>
				    <div class="five wide column" onclick="to_page('/h5/other/join/view.jsp')">
				     	我要加盟
				    </div>
			  </div>
			    <div class="row">
			    	<div class="column">
			    		<h6>Copyright 2016 深圳市雀子网络科技有限公司</h6> 
			    		<h6>粤ICP备16097252号-1</h6>
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
							  <button class="ui button tiny" id="sendMobileCodeBtn" onclick="validImageCode()" type="button">
									  		<a id="sendMobileCodeMsg">获取验证码</a>
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
	
	this.productActionUrl = "/trade/product"
	this.clazzActionUrl = "/clazz"

	function popLoginModal(){
		$('.ui.modal').modal('show');
	}

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

</script>



<!-- 登录页面代码 -->

<script type="text/javascript">
	

	//验证图片验证码
	var validRandomCodeActionUrl = "/system/validRandomCode";
	//发送图片验证码
	var sendCodeActionUrl = "/system/sendCode"
	//登陆
	var loginActionUrl = "/system/login"
	//退出
	var logoutActionUrl = "/system/logout"
		
	//用户中心
	var userHomeActionUrl = "/user/home"
	
	
	
		$(document).ready(function(){
			
		})
		
		function logout(){
			standardPost(this.logoutActionUrl,"");
		}
	
		function login(){
		
			 if($("#smsCode").val() == ""){
				  fromError("请输入短信验证码!" );
			        return;
			    }
			
			 if($("#tel").val() == ""){
				 fromError("请输入手机号码!" );
			     return;
			 }
		  $("#loginBtn").attr("disabled", "disabled");
		  var actionParamArray = {"smsCode":$("#smsCode").val(),"tel":$("#tel").val()}
		  var retData = actionPost(this.loginActionUrl,actionParamArray);
		  if(retData.status == "success"){
			  to_page(userHomeActionUrl)
		  }
		  else{
			  fromError("短信验证码错误");
			  $("#loginBtn").removeAttr("disabled");
		  }
		
		}
		
		
		function popLoginModal(){
			
			$('.ui.modal').modal({
			    blurring: true
			  })
			  .modal('show')
			;
			$(".ui.error.message").html("");
// 			$("#tel").val("");
			$("#smsCode").val("");
			$("#code").val("");
	}
		
	function fromError(msg){
		$("#loginForm").form('add errors', { error: msg });
	}
	
		
		var delayTime = 60;
		var delayFlag = true;
		
		 //验证图形验证码
		function validImageCode(){
			 
			  if($("#code").val() == ""){
				  fromError("请输入图片验证码!" );
			        return;
			    }
			
			 if($("#tel").val() == ""){
				 fromError("请输入手机号码!" );
			     return;
			 }
			  
			  //验证图形验证码
			  var actionParamArray = {"code":$("#code").val()}
			  var retData = actionPost(this.validRandomCodeActionUrl,actionParamArray);
			  
			  //图形验证码正确
			  if(retData.status == "success"){
				  //发送短信验证码
				  sendMobileCode();
				  
			  }
			  //图形验证码错误
			  else{
				  $("#codeImg").click();
				  $("#code").val("");
				  fromError("图片验证码有误!" );
			  }
		}
		 
		
		//计数器
		function countDown() {
		    delayTime--;  
		    $("#sendMobileCodeBtn").attr("disabled", "disabled");
		    $("#sendMobileCodeMsg").html(delayTime + '秒后重新获取');
		    if (delayTime == 1) {
		        delayTime = 60;
		        $("#sendMobileCodeMsg").html("获取短信验证码");
		        $("#sendMobileCodeBtn").removeAttr("disabled");
		        $("#contactTelDiv").removeClass("disabled");
		        $("#mobileCode_error").hide();
		        delayFlag = true;
		    } else {
		        delayFlag = false;
		        setTimeout(countDown, 1000);
		    }
		}
		
		
		//发送短信验证码
		function sendMobileCode(){
			
			  if ($("#sendMobileCodeBtn").attr("disabled") || delayFlag == false) {
			        return;
			    }
			  
			  $("#sendMobileCodeBtn").attr("disabled", "disabled");
		      $("#sendMobileCodeMsg").html("60秒后重新获取");
		      $("#contactTelDiv").addClass("disabled");
		      setTimeout(countDown, 1000);
		        
			  
			  var sendCodeActionParamArray = {"mobile":$("#tel").val()}
			  var sendCodeRetData = actionPost(this.sendCodeActionUrl,sendCodeActionParamArray);
			  if(sendCodeRetData.status == "success"){
			  }else{
				  alert(sendCodeRetData.message);
			  }
			  
		}
		
		
	</script>
<!-- 登录页面代码 -->













