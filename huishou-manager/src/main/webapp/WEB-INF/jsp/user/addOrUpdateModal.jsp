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
		    		更新
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增
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
			 	
			 	<div class="ui error message"></div>
			 	<div class="ui blue button" id="saveBtn">保存</div>
			</form>
		  </div>
		  <div class="actions">
		    <div class="ui black deny button">
		     	取消
		    </div>
		  </div>
		  
