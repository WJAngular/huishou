<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>


	
	<jsp:include page="/h5/header-nav.jsp?title=提交成功&noback=true"></jsp:include>	

	<div class="ui grid container" style="margin-top: 2.6em;">
		
		<div class="row">
			<div class="sixteen wide column" >
				
				<div class="ui grid ">
				<div class="centered row">
				  <div class="ui mobile reversed equal width grid ">
				  <div class="column">
				     <img src="<%=request.getContextPath()%>/images/m/guarren/1.png">
					 <h1 class="ui header teal">订单提交成功!</h1>
				  </div>
				</div>
				</div>
				
				<div class="row">
					<div class="sixteen wide column">
							<h6 class="ui horizontal divider  header">
							  订单详情
							</h6>
					</div>
				</div>
				
				<div class="row">
					<div class="sixteen wide column">
							<h4 class="ui  header">订单号：${orderInfo.orderId }</h4>
								<!--如果是快递方式，显示公司地址 -->
							<c:if test="${orderInfo.recycleType == 'express' }">
								<h4 class="ui  header">请尽快把产品快递到如下地址 : ${expressAddress.paramDesc}
								 </h4>
							</c:if>
							
							<!--如果是面叫，显示交易地址 -->
							<c:if test="${orderInfo.recycleType == 'facetoface' }">
								<h4 class="ui  header">上门回收地址 : 
												<c:forEach items="${ recycleTradeAddressCity}" var="recycleTradeAddressCity">
													<c:if test="${orderInfo.recycleTradeAddressCity ==  recycleTradeAddressCity.paramCode }">
											   	 		${recycleTradeAddressCity.paramDesc }  ${orderInfo.recycleTradeAddress }
											   	 	</c:if>
												</c:forEach>	
								</h4>
									<h6 class="ui  header">回收时间: <fmt:formatDate value='${orderInfo.recycleTradeTime}' pattern='yyyy-MM-dd' /></h6>
							</c:if>
							
							<h6 class="ui  header">估算金额：￥${orderInfo.assessPrice }</h6>
					</div>
				</div>
				
				
				<div class="row">
					<div class="sixteen wide column">
							<h6 class="ui horizontal divider  header">
							  达成以下条件，增加放款速度
							</h6>
					</div>
				</div>
				
				<div class="row">
					<div class="sixteen wide column">
							<p>1.请提前将您的机器充满电，方便快速质检</p>
							<p>2.解除机器开机密码</p>
							<p>3.手机号码保持一致(请将下单时的手机号填写在快递上)</p>
					</div>
				</div>
				
				
				<div class="row">
					<div class="eight wide column">
						<a class="ui fluid button" onclick="to_page('/user/home')">进入个人中心</a>
					</div>
					<div class="eight wide column">
						<a class="ui fluid button" onclick="to_page('/clazz')">继续回收</a>
					</div>
				</div>
				
				
				</div>
				
			
				
				
				
			</div>	
		</div>
	</div>
	
	
	
<script>



</script>
 		
