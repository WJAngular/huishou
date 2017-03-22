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
		    name: {
		        identifier: 'object.username',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '账号不能为空'
		          },
		          {
			            type   : 'minLength[6]',
			            prompt : '账号不能少于{ruleValue}位'
			      }
		        ]
		      },
		      status: {
			        identifier: 'object.status',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '请选择有效状态'
			          }
			        ]
			   },
		      password: {
			        identifier: 'object.password',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '密码不能为空'
			          },
			          {
				            type   : 'minLength[8]',
				            prompt : '密码不能少于{ruleValue}位'
				      }
			        ]
			   }
		    }
		  })
		;
	
	
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新人员
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增人员
		    	</c:if>
		  </div>
		  <div class=" content">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
				  	<div class="two  fields">
					    <div class=" field ">
					      <label>账号</label>
					      <input placeholder="账号" type="text" name="object.username" value="${object.username }"  ${ addOrUpdate == 'update' ? 'disabled':'' }>
					    </div>
					     <div class=" field">
					      <label>密码</label>
					      <input placeholder="密码" type="password" name="object.password" value="${object.password }">
					    </div>
					   
				    </div>
				    <div class="two  fields">
				    	  <div class=" field">
					         <label>类型</label>
							    <div class="ui selection dropdown">
							      <div class="default text">Select</div>
							      <i class="dropdown icon"></i>
							      <input type="hidden" name="object.type" value="${object.type}">
							      <div class="menu">
							        <div class="item " data-value="2" >加盟商</div>
							        <div class="item" data-value="1">操作员</div>
							      </div>
							    </div>
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
				    </div>
			 	
			 	
			 		 <div class="field">
					      <label>区域</label>
					      <select class="ui fluid dropdown" name="object.zone" >
					        <option value="">请选择</option>
							<c:forEach items="${ recycleTradeAddressCity}" var="recycleTradeAddressCity">
						   	 	<option value="${recycleTradeAddressCity.paramCode }"  ${object.zone ==  recycleTradeAddressCity.paramCode ? 'selected':''}>
						   	 		${recycleTradeAddressCity.paramDesc }
						   	 	</option>
							</c:forEach>	
  							  </select>
    				</div>
					      
			 	
			 		<div class="field ">
					      <label>联系人</label>
					      <input placeholder="联系人或公司" type="text" name="object.contact" value="${object.contact }" >
					</div>	
			 	
			 		<div class="field ">
					      <label>联系电话</label>
					      <input placeholder="联系电话" type="text" name="object.tel" value="${object.tel}" >
					</div>	
			 	
			 		<div class="field ">
					      <label>联系地址</label>
					      <input placeholder="联系地址" type="text" name="object.address" value="${object.address}" >
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
		  
