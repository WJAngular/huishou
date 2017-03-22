	<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>


	<jsp:include page="/h5/header-nav.jsp?title=${object.name }"></jsp:include>	
	
	
	<div class="ui bottom fixed two item inverted menu">
      <a class=" active orange item">评估价格:${endPrice }元</a>
      <a class="active teal item" onclick="to_apply()">马上换钱</a>
    </div>


	<div class="ui grid ">
		
		<div class="row">
			<div class="sixteen wide column">
				<div class="ui teal inverted segment">
					  <div class="ui grid">
					  	<div class="row">
					      <div class="eight wide column">
							  <div class="ui inverted orange circular segment">
							  <h2 class="ui inverted header">
							    	${endPrice }元
							    <div class="sub header">评估价格</div>
							  </h2>
							</div>
					  	</div>
					  <div class="eight wide column right aligned">
					  <div class="ui button" onclick="product(${object.id })">重新估价</div>
					  <p>深圳 最快明天可以完成交易 </p><p>支持 上门回收快递回收</p>
					</div>
					    </div></div>
				</div>
				
			</div>	
		</div>
	</div>	
	
	<div class="ui grid container">
		<div class="row">
			<div class="sixteen wide column">
					<h4 class="ui horizontal divider blue header">
					  <i class="tag icon"></i>
					  安特回收隐私三重保护
					</h4>
			</div>
		</div>
		
		
		<div class="centered row">
		  <div class="ui mobile reversed equal width grid ">
		  <div class="column">
		     <img src="<%=request.getContextPath()%>/images/m/guarren/1.png">
						  <h6>当面确认数据清除</h6>
		  </div>
		  <div class="column">
		     <img src="<%=request.getContextPath()%>/images/m/guarren/1.png">
						  <h6>专业包装确保安全</h6>
		  </div>
		  <div class="column">
		     <img src="<%=request.getContextPath()%>/images/m/guarren/1.png">
						  <h6>专业工具数据粉碎</h6>
		  </div>
		</div>
		</div>
		
		
		<div class="row">
			<div class="sixteen wide column">
					<h4 class="ui horizontal divider blue header">
					  <i class="tag icon"></i>
					 评估结果
					</h4>
			</div>
		</div>
		
		
		<div class="row">
			<div class="sixteen wide column">
		<div class="ui teal segment">
			<p>
				${orderInfo.detail}
			</p>		
		</div>
		</div></div>
		
		<div class="row"></div>
		
		
		
		
	</div>
	
	
	
<script type="text/javascript">
	
	var actionUrl = "${actionUrl}";
	this.applyPageUrl = actionUrl + "apply";
	this.productPageUrl = actionUrl + "product";
	
	function to_apply(){
		to_page(applyPageUrl)
	}

	function choose(object){
		$(".pkg").removeClass("active")
		$("#"+object).addClass("active")
	}

	
	
	function product(id){
		var actionParams = {"id":id};
		standardPost(productPageUrl,actionParams)	;
	}
	
	
	$(document).ready(function(){
	
	})
	
</script>
