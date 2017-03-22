<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/topmenu.jsp"></jsp:include>
<jsp:include page="layout/search.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>

		<div style="background-color: #f6f7fb">

		<!-- 中部 -->
		<div style="width: 100%;position: relative;height: 356px; margin-top: -14px">
		<!-- 分类框 -->
		<div style="z-index: 2;position: relative;left: 3.2%;">
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
	<div style="padding: 20px">
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
		</div>
	</div><!-- 中部流程图 -->

	<!-- 热门产品 -->
	<div class="ui  container piled segment" id="context1">
		<div></div>
		<div class="ui pointing secondary menu">
		  <a class="item active" data-tab="first">限时 高价回收</a>
		 <a class="item " data-tab="second">限时 高价回收2</a>
		
		 <c:forEach items="${clazzBrand }" var="clazz">  
		  	<a class="item" data-tab="${ clazz.id}">${clazz.name}</a>
		 </c:forEach>
		
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
		
		
		</div>



<jsp:include page="layout/footer.jsp"></jsp:include>