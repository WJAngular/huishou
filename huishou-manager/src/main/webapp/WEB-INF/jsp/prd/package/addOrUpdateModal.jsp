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
		        identifier: 'object.name',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '描述包名称不能为空'
		          },
		          {
			            type   : 'minLength[3]',
			            prompt : '描述包名称不能少于{ruleValue}位'
			      }
		        ]
		      }
		    }
		  })
		;
	
	
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新描述包
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增管理员
		    	</c:if>
		  </div>
		  <div class=" content">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
					    <div class=" field ">
					      <label>描述包名称</label>
					      <input placeholder="描述包名称" type="text" name="object.name" value="${object.name }"  >
					    </div>
					 
					     <div class=" field">
					      <label>备注</label>
					      <textarea  type="text" name="object.remark">${object.remark }</textarea>
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
		  
