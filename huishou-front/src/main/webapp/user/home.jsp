<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/layout/header.jsp"></jsp:include>
<jsp:include page="/layout/topmenu.jsp"></jsp:include>
<jsp:include page="/layout/search.jsp"></jsp:include>
<jsp:include page="/layout/nav.jsp"></jsp:include>


<div class="ui grid  " style="background-color: #F8F8F8; padding: 20px">
	<div class="row">
		<div class=" one wide column"></div>
		<div class=" fourteen wide column">
			<div class="ui teal segment"  style="padding: 20px">
					
					<h3 class="ui dividing header">我的订单</h3>				
					<table class="ui table teal celled">
				      <thead>
				        <tr>
				        	<th>订单号</th>
				        	<th>回收商品</th>
				        	<th>回收方式</th>
				        	<th>估算回收价格</th>
				        	<th>最终价格</th>
				        	<th>订单状态</th>
				        	<th>创建时间</th>
				        	<th>交易操作</th>
				      	</tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${objectPage.getList() }" var="object">
					        <tr>
					          <td>${ object.orderId}</td>
					          <td>${ object.prdProductName}</td>
					          <td>
											${ object.recycleType == 'express' ? '快递' : '当面交易'}
							  </td>
					          <td>${ object.assessPrice}元</td>
							  <td>
							  	  <c:if test="${ empty object.tradePrice }">
									等待质检报价							  	  	
							  	  </c:if>
							  	  <c:if test="${ object.tradePrice != 0}">
									${ object.tradePrice }元							  	  	
							  	  </c:if>
							  </td>
							  <td>
							   <c:forEach items="${ orderStatus}" var="orderStatus">
							   		<c:if test="${ object.status ==  orderStatus.paramCode}">
							   			${ orderStatus.paramDesc}
							   		</c:if>
							   </c:forEach>
							   </td>
							   <td>${ object.createTime}</td>
							  <td>
							  	 <c:forEach items="${ orderStatus}" var="orderStatus">
							   		<c:if test="${ object.status ==  orderStatus.paramCode}">
							   			<c:if test="${ object.recycleType == 'express' && object.status ==  'WAIT_EXPRESS'}">
							   				<button class="ui button" onclick="toExpress(${ object.id})">发货</button>
							   			</c:if>
							   			<c:if test="${ object.status !=  'WAIT_EXPRESS'}">
							   				<button class="ui button" onclick="toOrderInfo(${ object.id})">查看详情</button>
							   			</c:if>
							   			<c:if test="${object.status == 'FINISH' }">
							   				<button class="ui button" onclick="toOrderComment(${ object.id})">评价详情</button>
							   			</c:if>
							   		</c:if>
							   </c:forEach>
							   
							     <c:if test="${ object.status != 'CLOSE'}">
								         &nbsp;&nbsp;| <a onclick="cancelOrder(${ object.id})">取消</a>
							        </c:if>
							        
							  
							  </td>
					        </tr>
				        </c:forEach>
				      </tbody>
				      <tfoot>
				        <tr>
				        	<th colspan="8">
				      		<jsp:include page="/layout/pagination.jsp"></jsp:include>
				      		</th>
				      	</tr>
				      </tfoot>
				    </table>
				
			</div>
		</div>
	</div>

</div>



<script type="text/javascript">

	this.toExpressActionUrl = "/user/toExpress"
	this.toOrderInfoActionUrl = "/user/toOrderInfo"
	this.cancelOrderActionUrl = "/user/cancelOrder"
	this.toOrderCommentActionUrl = "/user/toOrderComment"
		
	$(document).ready(function() {
	
	})
	
	//取消订单
	function cancelOrder(id){
		
		if(window.confirm('你确定要取消交易吗？')){ 
			var actionParams = {"id":id};
			standardPost(this.cancelOrderActionUrl,actionParams)
			return true; 
			}else{ 
			return false; 
			} 
		
	}
	
	//跳转到发货页面
	function toExpress(id){
		var actionParams = {"id":id};
		standardPost(this.toExpressActionUrl,actionParams)
	}
	
	//跳转到查看订单信息页面
	function toOrderInfo(id){
		var actionParams = {"id":id};
		standardPost(this.toOrderInfoActionUrl,actionParams);
	}
	//跳转到订单评价详情页面
	function toOrderComment(id){
		var actionParams = {"id":id};
		standardPost(this.toOrderCommentActionUrl,actionParams);
	}
</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>