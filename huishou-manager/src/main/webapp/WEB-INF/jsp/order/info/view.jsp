<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="<%=request.getContextPath()%>/js/checkbox.js"></script>
		<!-- main -->
		<div class="ui grid  internally celled  ">
			<!-- 头部导航 -->
			<div class="row">
				<div class="column">
					<div class="ui mini breadcrumb">
					  <a class="section">首页</a>
					  <i class="right chevron icon divider"></i>
					  <a class="section">订单模块</a>
					  <i class="right chevron icon divider"></i>
					  <div class="active section">订单管理</div>
					</div>
				</div>
			</div><!-- 头部导航 -->
			
			
			<!-- 查询框 -->
			<div class="row">
				<div class=" column">
					
					<div class=" ui form" >
						<div class="fields">
							<div class="field">
<!-- 								<button id="addBtn" class="ui teal basic button" onclick="openAddModal()"><i class="add user icon"></i> -->
<!-- 									新增 -->
<!-- 								</button> -->
							</div>
							
							<div class=" twelve wide field">
								<form class=" ui form" id="searchForm" >
									
									 <div class="three fields">
								      <div class="field">
								      	  <label>订单号</label>
								        <input type="text" name="object.orderId" placeholder="订单号" value="${object.orderId }">
								      </div>
								      <div class="field">
								        <label>会员号</label>
								        <input type="text" name="object.userName" placeholder="会员号" value="${object.userName }">
								      </div>
								       <div class="field">
								        <label>商品名称</label>
								        <input type="text" name="object.prdProductName" placeholder="商品名称" value="${object.prdProductName }">
								      </div>
								    </div>
									
									<div class="three fields">
								      <div class="field">
								      	  <label>回收方式</label>
									        <select class="ui dropdown" name="object.recycleType">
												  <option value="">请选择</option>
												  <option value="express" ${object.recycleType ==  'express' ? 'selected':''}>快递</option>
												  <option value="facetoface" ${object.recycleType ==  'facetoface' ? 'selected':''}>当面回收</option>
										 	</select>
								      </div>
								      <div class="field">
								        <label>支付方式</label>
								        <select class="ui dropdown" name="object.payType">
											  <option value="">请选择</option>
											  <option value="alipay" ${object.payType ==  'alipay' ? 'selected':''}>支付宝</option>
											   <option value="wx" ${object.payType ==  'wx' ? 'selected':''}>微信</option>
											  <option value="bank" ${object.payType ==  'bank' ? 'selected':''}>网银转账</option>
											  <option value="cash" ${object.payType ==  'cash' ? 'selected':''}>现金</option>
									 	</select>
								      </div>
								       <div class="field">
								        <label>订单状态</label>
								         <select class="ui dropdown" name="object.status">
											  <option value="">请选择</option>
											   <c:forEach items="${ orderStatus}" var="orderStatus">
										   	 	<option value="${orderStatus.paramCode }"  ${object.status ==  orderStatus.paramCode ? 'selected':''}>
										   	 		${orderStatus.paramDesc }
										   	 	</option>
												</c:forEach>	
									 	</select>
								      </div>
								    </div>
								    
								 	<div class="one fields">
								      <div class="field">
								      	  <div class="ui  button " onclick="search()">搜索</div>
								      </div>
								    </div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 查询框 -->
			
			
			
			<!-- 表格内容 -->
			<div class="row">
				<div class="column">
					<table class="ui  green very compact table selectable small">
						<thead>
							<tr>
								<th>    <div class="ui fitted  checkbox all">
										          <input type="checkbox">
										           <label></label>
										 </div></th>
								<th>订单号</th>
								<th>会员号</th>
								<th>交易城市</th>
								<th>回收方式</th>		
								<th>回收商品</th>
								<th>评估价格</th>
								<th>最终价格</th>
								<th>订单状态</th>
								<th>操作 </th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${objectPage.getList() }" var="object">
									<tr  id="tr${object.id}"  ondblclick="openUpdateModal('${object.id}')">
										 <td class="collapsing">
									        <div class="ui fitted  checkbox single" data-method="${object.id}">
										          <input type="checkbox" data-method="${object.id}"> <label></label>
										        </div>
										</td>
										<td>
											${ object.orderId}
											
										</td>
										<td>${ object.userName}</td>
										<td>
											<c:forEach items="${ recycleTradeAddressCity}" var="recycleTradeAddressCity">
												<c:if test="${object.recycleTradeAddressCity ==  recycleTradeAddressCity.paramCode}">
													${recycleTradeAddressCity.paramDesc }
												</c:if>
											</c:forEach>											
										</td>
										<td>
											${ object.recycleType == 'express' ? '快递' : '当面交易'}
										</td>
										<td>${ object.prdProductName}</td>
										<td>${ object.assessPrice}元</td>
										<td>${ object.tradePrice}</td>
										
										
										<td>
											 <select class="ui dropdown"  onchange="changeOrderStatus(${ object.id})" id="orderStatusSelect${ object.id}">
											   <c:forEach items="${ orderStatus}" var="orderStatus">
										   	 	<option value="${orderStatus.paramCode }"  ${object.status ==  orderStatus.paramCode ? 'selected':''}>
										   	 		${orderStatus.paramDesc }
										   	 	</option>
												</c:forEach>	
											 </select>
										</td>
										
										<td >
											<div class="ui mini icon buttons">
											  <button class="ui blue basic button " onclick="openUpdateModal('${object.id}')">
											  	<i class="configure icon"></i>编辑
											  </button>
											  <button class="ui red basic button " onclick="deleteById('${object.id}')">
											  	<i class="remove user icon"></i>删除
											  </button>
											</div>
										</td>
									</tr>
							</c:forEach>
						</tbody>
						 <tfoot class="full-width">
						    <tr>
						    
						    	<!-- 删除所有 -->
							     <th colspan="1">
							        <div class="circular basic ui icon red button tiny" onclick="deleteAll()"> 
							        	<i class="remove  circle icon"></i>
							        </div>
							      </th> 
								<!--删除所有 -->
								
								<th colspan="11">
					     			<jsp:include page="/common/pagination.jsp"></jsp:include>
						     	</th>
						     	
						    </tr>
						  </tfoot>
					</table>
				</div>
			</div><!-- 表格内容 -->
			
			
		

		</div><!-- main -->
		


<script type="text/javascript">

	var actionUrl = "${actionUrl}";
	this.deleteActionUrl = actionUrl + "delete";
	this.toUpdateActionUrl = actionUrl + "toUpdate";
	this.updateActionUrl = actionUrl + "update";
	this.changeStatusActionUrl = actionUrl + "changeStatus";
	
	function changeOrderStatus(id){
		console.log($("#orderStatusSelect"+id).find('option:selected').val())
		var status = $("#orderStatusSelect"+id).find('option:selected').val();
		if(status == '') return false;
		var actionParamArray = {"id" : id,"status":status};
		 actionPost(changeStatusActionUrl,actionParamArray);
		
	}
</script>
