<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>

	<jsp:include page="/h5/header-nav.jsp?title=用户中心&noback=true"></jsp:include>	

	<div class="ui grid " style=" background-color: #00b5ad;margin-top: 2.6em; ">
				<div class="centered row">
				  <div class="ui mobile reversed equal width grid ">
				  		<div class="column">
				     		<img class="ui image rounded tiny " src="<%=request.getContextPath()%>/images/m/header.jpg">
				  		</div>
					</div>
				</div>

				<div class="centered row">
				  <div class="ui mobile reversed equal width grid ">
				  		<div class="column">
				     		
					 		<h3>用户:${object.contactTel }</h3>
				  		</div>
					</div>
				</div>
	</div>
				
				
	<div class="ui grid " style="margin-top: 2.6em;padding:10px">
		
		
		
		<div class="  row">
			<div class="sixteen wide column" >
				<h6 class="ui horizontal divider  header">
					 订单详情
				</h6>
			</div>
		</div>
			
		<div class="row"> 
			<div class="sixteen wide column" >
				
				<div class="ui divided items">
				
				
						<c:forEach items="${objectPage}" var="object">
							 <div class="item">
							    <div class="image" >
							      <img src="<%=request.getContextPath()%>/image/phone/1.jpg">
							    </div>
							    
							    <div class="content">
							      <a class="header">${ object.prdProductName}</a>
							      <h5 class="teal ui  header right floated">
										<c:forEach items="${ orderStatus}" var="orderStatus">
									   		<c:if test="${ object.status ==  orderStatus.paramCode}">
									   			${ orderStatus.paramDesc}
									   		</c:if>
									   </c:forEach>
								</h5>
							      <div class="meta">
							        <span class="cinema">${ object.orderId}</span>
							        
							        <c:if test="${ object.status != 'CLOSE'}">
								        <div class="ui right floated  button tiny" onclick="cancelOrder(${ object.id})">
								         		取消
								          <i class="right chevron icon"></i>
								        </div>
							        </c:if>
							        
							      </div>
							      <div class="description">
							        <div class="ui label orange basic ">${ object.assessPrice}元</div>
									
							      </div>
							      <div class="extra">
							      <div class="ui label">${ object.createTime}</div>
							         		 <c:forEach items="${ orderStatus}" var="orderStatus">
										   		<c:if test="${ object.status ==  orderStatus.paramCode}">
										   			<c:if test="${ object.recycleType == 'express' && object.status ==  'WAIT_EXPRESS'}">
										   				<div class="ui right floated primary button " onclick="toExpress(${ object.id})"> 发货
										   			 		<i class="right chevron icon"></i>
							        					</div>
										   			</c:if>
										   			<c:if test="${ object.status !=  'WAIT_EXPRESS'}">
										   				<div class="ui right floated primary button " onclick="toOrderInfo(${ object.id})"> 查看详情
										   			 		<i class="right chevron icon"></i>
							        					</div>
										   			</c:if>
										   		</c:if>
										   </c:forEach>
							      </div>
							    </div>
							  </div>
					  	</c:forEach>
					  
					  
				</div>
				
			</div>	
		</div>
		
	</div>
	
<script type="text/javascript">

	this.toExpressActionUrl = "/user/toExpress"
	this.toOrderInfoActionUrl = "/user/toOrderInfo"
	this.cancelOrderActionUrl = "/user/cancelOrder"
		
	$(document).ready(function() {
	
	})
	
	//取消订单
	function cancelOrder(id){
		var actionParams = {"id":id};
		standardPost(this.cancelOrderActionUrl,actionParams)
	}
	
	//跳转到发货页面
	function toExpress(id){
		var actionParams = {"id":id};
		standardPost(this.toExpressActionUrl,actionParams)
	}
	
	//跳转到查看订单信息页面
	function toOrderInfo(id){
		var actionParams = {"id":id};
		standardPost(this.toOrderInfoActionUrl,actionParams)
	}
</script>
