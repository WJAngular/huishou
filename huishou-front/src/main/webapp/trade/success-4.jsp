<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/search.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>


<div class="ui grid  " style="background-color: #F8F8F8; padding: 20px">
	<div class="row">
		<div class=" one wide column"></div>
		<div class=" fourteen wide column">
			
			<div class="ui teal segment"  style="padding: 100px">
				
				<h2 class="ui green header">订单提交成功!</h2>
				
				<h4 class="ui  header">订单号：${orderInfo.orderId }</h4>
				
				<!--如果是快递方式，显示公司地址 -->
				<c:if test="${orderInfo.recycleType == 'express' }">
					<h4 class="ui  header">请尽快把产品快递到如下地址 : ${expressAddress.paramDesc}
					 }</h4>
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
						<h4 class="ui  header">回收时间: <fmt:formatDate value='${orderInfo.recycleTradeTime}' pattern='yyyy-MM-dd' /></h4>
				</c:if>
				
				<h4 class="ui  header">估算金额：￥${orderInfo.assessPrice }</h4>
				<br>
				<a class="ui button" onclick="to_page('/user/home')">进入个人中心</a>
				<a class="ui button" onclick="to_page('/clazz')">继续回收</a>
				<br><br><br>
				<img class="ui image centered" src="../image/trade-success-4/2.png">
				
				
			</div>
			
		</div>

	</div>

</div>

<script type="text/javascript">

	$(document).ready(function() {
		
	
	})
	
	
	
	
	
	
</script>



<jsp:include page="../layout/footer.jsp"></jsp:include>