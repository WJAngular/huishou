<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript">
	
	var orderInfoActionUrl = "/orderInfo";
	
	$('.ui.selection.dropdown').dropdown();
	
	//自适应框框
	$('#addOrUpdateModal').modal('refresh');
	
	var addOrUpdate = "${addOrUpdate}";
	
	//保存
	$("#saveBtn").on("click",function(){
		if(!$('#editForm').form("validate form")){
			return;
		}
		var paramArray = $('#editForm').serializeArray();
		if(addOrUpdate == 'update'){
			console.log(orderInfoActionUrl)
			submitForm(updateActionUrl,paramArray,orderInfoActionUrl,'editForm','addOrUpdateModal');
		}
		else if (addOrUpdate == 'add'){
			submitForm(addActionUrl,paramArray,actionUrl,'editForm','addOrUpdateModal');
		}
		
		
	});

	
	//表单验证器
	$('#editForm')
		  .form({
		    fields: {
		    userName: {
		        identifier: 'object.userName',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '会员号不能为空'
		          },
		          {
			            type   : 'maxLength[11]',
			            prompt : '会员号不能超过{ruleValue}位'
			      }
		        ]
		      },
		      contactName: {
			        identifier: 'object.contactName',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '联系人名字不能为空'
			          }
			        ]
			      }, 
			  contactTel: {
				        identifier: 'object.contactTel',
				        rules: [
				          {
				            type   : 'empty',
				            prompt : '联系电话不能为空'
				          },
				          {
					            type   : 'maxLength[11]',
					            prompt : '联系电话不能超过{ruleValue}位'
					      }
				        ]
				   },  
				   status: {
				        identifier: 'object.status',
				        rules: [
				          {
				            type   : 'empty',
				            prompt : '订单状态不能为空'
				          }
				        ]
				   } 
		      
		    }
		  })
		;
	
	$(document).ready(function(){
		changePayType('${object.payType}')
		changeRecycleType('${object.recycleType}')
	});
	
	
	//判断选择的转账方式
	function changePayType(b){
		if(b == 'alipay'){
			$(".payTypeField").css("display","none");	
			$("#alipayField").css("display","block");
		}
		
		if(b == 'wx'){
			$(".payTypeField").css("display","none");	
			$("#wxField").css("display","block");
		}
		
		
		if(b == 'bank'){
			$(".payTypeField").css("display","none");	
			$("#bankField").css("display","block");
		}
		
		if(b == 'cash'){
			$(".payTypeField").css("display","none");	
		}
	}
	
	//选择回收方式
	function changeRecycleType(b){
		if(b == 'express'){
			$(".recycleTypeField").css("display","none");	
			$("#expressField").css("display","block");
			$("#paycash").css("display","none");
		}
		if(b == 'facetoface'){
			$(".recycleTypeField").css("display","none");	
			$("#facetofaceField").css("display","block");
			$("#paycash").css("display","block");
		}
		
	}
	
	//选择备注模板
	function chooseOrderDesc(){
		
		var choose = $("#orderDescSel").find('option:selected').text().trim();
		
		$("#remarkTextArea").val($("#remarkTextArea").val() + "\r\n<br>" + choose);
		
	}
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新订单
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		查看订单
		    	</c:if>
		  </div>
		  <div class=" content">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
						
					    <div class=" field ">
					      <label>订单号</label>
					      <input placeholder="订单号" type="text" name="object.orderId" value="${object.orderId }"  disabled >
					    </div>
					    <div class=" field ">
					      <label>产品名称</label>
					      <input placeholder="产品名称" type="text" name="object.prdProductName" value="${object.prdProductName }" disabled>
					    </div>
					    <div class=" field ">
					      <label>评估价格</label>
					      <input placeholder="评估价格" type="text" name="object.assessPrice" value="${object.assessPrice }" >
					    </div>
					    <div class=" field ">
					      <label>最终成交价格</label>
					      <input placeholder="最终成交价格" type="text" name="object.tradePrice" value="${object.tradePrice }" >
					    </div>
					 	<div class=" field ">
					      <label>会员号</label>
					      <input placeholder="会员号" type="text" name="object.userName" value="${object.userName }" >
					    </div>
						<div class=" field ">
					      <label>联系名字</label>
					      <input placeholder="联系名字" type="text" name="object.contactName" value="${object.contactName }" >
					    </div>		 
					    <div class=" field ">
					      <label>联系电话</label>
					      <input placeholder="联系电话" type="text" name="object.contactTel" value="${object.contactTel }" >
					    </div>	
					    
					    
					     <!-- 回收方式 -->
					    <div  class="ui raised segment teal" >
					    <div class="inline fields">
							    <label for="fruit">回收:</label>
							    
							    <c:if test="${sysAdmin.type == '1' }">
								    <div class="field">
								      <div class="ui radio checkbox paymethod">
								        <input onchange="changeRecycleType('express')" type="radio" name="object.recycleType" value="express" tabindex="0" class="fruit1"  ${object.recycleType == 'express' ? 'checked' :'' }>
								        <label>邮寄</label>
								      </div>
								    </div>
							    </c:if>
							    
							    <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changeRecycleType('facetoface')" type="radio" name="object.recycleType" value="facetoface" tabindex="0" class="fruit1" ${object.recycleType == 'facetoface' ? 'checked' :'' }>
							        <label>当面交易</label>
							      </div>
							    </div>
						</div>
						
						<!-- 邮寄 -->
						<div class="recycleTypeField" id="expressField" style="display: none">
							<div class="field ">
					      		<label>快递单号</label>
					      		<input placeholder="快递单号" type="text" name="object.recycleExpressCode" value="${object.recycleExpressCode }" >
					    	</div>	
					    	
					    	<div class="field ">
					    	  <select class="ui  dropdown"  name="object.recycleExpress">
					       	   <option value="" selected>请选择快递公司</option>
								  <c:forEach items="${ express}" var="express">
							   			 <option value="${ express.paramCode}" ${object.recycleExpress ==  express.paramCode ? 'selected':''}>${ express.paramDesc}</option>
						   		  </c:forEach>
								</select>
							</div>
						</div>
						
						<!-- 当面交易 -->
						<div class="recycleTypeField" id="facetofaceField" style="display: none">
							
							 <div class="field">
							      <label>交易城市</label>
							      <select class="ui fluid dropdown" name="object.recycleTradeAddressCity" ${sysAdmin.type == '2' ? 'disabled' : ''}>
							        <option value="">请选择</option>
									<c:forEach items="${ recycleTradeAddressCity}" var="recycleTradeAddressCity">
								   	 	<option value="${recycleTradeAddressCity.paramCode }"  ${object.recycleTradeAddressCity ==  recycleTradeAddressCity.paramCode ? 'selected':''}>
								   	 		${recycleTradeAddressCity.paramDesc }
								   	 	</option>
									</c:forEach>	
    							  </select>
    						</div>
    						
    						<div class="field ">
					      		<label>详细地址</label>
					      		<input placeholder="详细地址" type="text" name="object.recycleTradeAddress" value="${object.recycleTradeAddress }" >
					    	</div>	
					    	
					    	<div class=" field" id="tradetime">
							   		<label>交易时间</label>
							    <input  type="date" name="object.recycleTradeTime" value="<fmt:formatDate value='${object.recycleTradeTime}' pattern='yyyy-MM-dd' />" />
							  </div>
						</div>
						</div> <!-- 回收方式 -->
						
						
						
					    <!-- 支付方式 -->
					    <div  class="ui raised segment teal" >
					    <div class="inline fields">
							    <label for="fruit">收款方式:</label>
							    <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('alipay')" type="radio" name="object.payType" value="alipay" tabindex="0" class="fruit1" ${object.payType == 'alipay' ? 'checked' :'' }>
							        <label>支付宝转账</label>
							      </div>
							    </div>
							      <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('wx')" type="radio" name="object.payType" value="wx" tabindex="0" class="fruit1" ${object.payType == 'wx' ? 'checked' :'' }>
							        <label>微信转账</label>
							      </div>
							    </div>
							    <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('bank')" type="radio" name="object.payType" value="bank" tabindex="0" class="fruit1" ${object.payType == 'bank' ? 'checked' :'' }>
							        <label>网银转账</label>
							      </div>
							    </div>
							    <div class="field" id="paycash">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('cash')" type="radio" name="object.payType" value="cash" tabindex="0" class="fruit1" ${object.payType == 'cash' ? 'checked' :'' }>
							        <label>现金收款</label>
							      </div>
							    </div>
						</div>
					 
						<!--网银转账方式 -->
					 	  <div class="payTypeField field" id="bankField" style="display: none">
							    <div class="two fields">
							      <div class="field">
							        <select class="ui search dropdown" name="object.payBankCode" >
									  <option value="">开户银行</option>
									 <c:forEach items="${ payBankCode}" var="payBankCode">
								   	 	<option value="${payBankCode.paramCode }"  ${object.payBankCode ==  payBankCode.paramCode ? 'selected':''}>
								   	 		${payBankCode.paramDesc }
								   	 	</option>
									</c:forEach>	
									 </select>
							      </div>
							      <div class="field">
							        <input type="text" name="object.payBankAccountName" value="${object.payBankAccountName}" placeholder="开户姓名">
							      </div>
							       <div class="field">
							        <input type="text" name="object.payBankAccountNum" value="${object.payBankAccountNum}" placeholder="卡号">
							      </div>
							    </div>
						 </div>
					 
					 	<!-- 支付宝转账 -->
					 	<div class="payTypeField field"  id="alipayField" style="display: none">
					      <label>支付宝账号</label>
					      <input placeholder="支付宝账号" type="text" name="object.payOtherAccount" value="${object.payOtherAccount }" >
					    </div>	
					 
					 	<!-- 微信转账 -->
					 	<div class="payTypeField field"  id="wxField" style="display: none">
					      <label>微信账号</label>
					      <input placeholder="微信账号" type="text" name="object.payOtherAccount" value="${object.payOtherAccount }" >
					    </div>	
					    
					  
					 	</div><!-- 支付方式 -->
					 	
					 	
					 	 <div class=" field"  >
					      <label>机器密码</label>
					      <input placeholder="机器密码" type="text" name="object.machinePassword" value="${object.machinePassword }" >
					    </div>
					    
					    <div class="inline fields" >
							   	  <label>状态</label>
							      <div class="field">
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
					 
					 	
					
					 
					     <div class=" field">
					      <label>备注</label>
					      <textarea  type="text" name="object.remark" id="remarkTextArea">${object.remark }</textarea>
					     </div>
				    
				    	<div class=" field">
				    	   <label>备注模板</label>
				    	  <select class="ui dropdown" onchange="chooseOrderDesc()" id="orderDescSel">
								  <option value="">请选择</option>
								   <c:forEach items="${ orderDesc}" var="orderDesc">
							   	 	<option value="${orderDesc.paramCode }">
							   	 		${orderDesc.paramDesc }
							   	 	</option>
									</c:forEach>	
						  </select>
						</div>
									 
						<div class=" field">
					      <label>订单的产品详情</label>
					      <textarea  type="text" name="object.detail" >${object.detail }</textarea>
					    </div>
			 	
			 	<div class="ui error message"></div>
			 	<div class="ui blue button" id="saveBtn">保存</div>
			</form>
		  </div>
		  <div class="actions">
		    <div class="ui black deny button">
		     	取消
		    </div>
		  </div>
		  
