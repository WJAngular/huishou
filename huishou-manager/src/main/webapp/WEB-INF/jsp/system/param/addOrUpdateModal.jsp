<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	$('.ui.selection.dropdown').dropdown();
	
	var addOrUpdate = "${addOrUpdate}";
	
	//自适应框框
	$('#addOrUpdateModal').modal('refresh');
	
	//保存
	$("#saveBtn").on("click",function(){
		if(!$('#editForm').form("validate form")){
			return;
		}
		var paramArray = $('#editForm').serializeArray();
		if(addOrUpdate == 'update'){
			submitForm(updateActionUrl,paramArray,actionUrl,'editForm','addOrUpdateModal');
		}
		else if (addOrUpdate == 'add'){
			submitForm(addActionUrl,paramArray,actionUrl,'editForm','addOrUpdateModal');
		}
	});

	
	//表单验证器
	$('#editForm')
		  .form({
		    fields: {
		    	paramType: {
		        identifier: 'object.paramType',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '参数类型不能为空'
		          }
		        ]
		      },
		      paramCode: {
			        identifier: 'object.paramCode',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '参数代码不能为空'
			          }
			        ]
			   },
			   paramDesc: {
			        identifier: 'object.paramDesc',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '参数名称不能为空'
			          }
			        ]
			   },
			   status: {
			        identifier: 'object.status',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '状态不能为空'
			          }
			        ]
			   }
		    }
		  })
		;
	
	
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增
		    	</c:if>
		  </div>
		  <div class=" content">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
				  
				  
					<div class="field">
			      	    <label>参数类型</label>
				        <select class="ui dropdown" name="object.paramType">
							  <option value="">请选择</option>
							  <option value="expressAddress" ${object.paramType ==  'expressAddress' ? 'selected':''}>我司地址</option>
							  <option value="payBank" ${object.paramType ==  'payBank' ? 'selected':''}>银行代码</option>
							  <option value="express" ${object.paramType ==  'express' ? 'selected':''}>快递公司</option>
							  <option value="recycleTradeAddressCity" ${object.paramType ==  'recycleTradeAddressCity' ? 'selected':''}>区域</option>
							  <option value="orderDesc" ${object.paramType ==  'orderDesc' ? 'selected':''}>订单描述</option>
							  <option value="newOrderNotice" ${object.paramType ==  'newOrderNotice' ? 'selected':''}>短信通知</option>
					 	</select>
			      	 </div>
				    	
					      <div class="field ">
					      <label>参数代码</label>
					      <input placeholder="参数代码" type="text" name="object.paramCode" value="${object.paramCode }" >
						</div>
					     
					      <div class="field">
						    <label>参数名称</label>
						    <textarea  name="object.paramDesc" >${object.paramDesc }</textarea>
						  </div>
					      
				    	  <div class=" field">
					         <label>是否有效</label>
							    <div class="ui selection dropdown">
							      <div class="default text">Select</div>
							      <i class="dropdown icon"></i>
							      <input type="hidden" name="object.status" value="${object.status }">
							      <div class="menu">
							        <div class="item " data-value="1" >有效</div>
							        <div class="item" data-value="2">无效</div>
							      </div>
							    </div>
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
		  
