<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">

	//自适应框框
//  	$('#addOrUpdateLargeModal').modal('refresh');

	$('.ui.clazzBrand.dropdown').dropdown();
	
	var addOrUpdate = "${addOrUpdate}";

	$(document).ready(function(){
		//初始化图片
// 		uploadImage();
	});
	
	//保存
	$("#saveBtn").on("click",function(){
		if(!$('#editForm').form("validate form")){
			return;
		}
		
		//新增提交的参数
		var paramArray = $('#editForm').serializeArray();
		//打印需要提交的东西
		 $.each(paramArray, function(i, field){
			 console.log("提交:"+field.name + ":" + field.value + " ");
		});
		
		
		if(addOrUpdate == 'update'){
			submitForm(updateActionUrl,paramArray,actionUrl,'editForm','addOrUpdateLargeModal');
		}
		else if (addOrUpdate == 'add'){
			submitForm(addActionUrl,paramArray,actionUrl,'editForm','addOrUpdateLargeModal');
		}
		
	});

	//表单验证器
	$('#editForm')
		  .form({
		    fields: {   
		    }
		  })
		;
	
	function uploadImage(){
		$("#imageObject").attr('src',$("#imageSrc").val());
		//自适应框框
		$('#addOrUpdateLargeModal').modal('refresh');
	};
	
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新评价信息
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增评价信息
		    	</c:if>
		  </div>
		  <div class=" content">
		  	<div  class="ui raised segment teal clearing">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
					   
					    <div class=" inline field ">
					      	<label>用户</label>
					      	<input placeholder="用户" type="text" name="object.userName" value="${object.userName }" />
					    </div>
					    
					    <div class="inline field ">
					      <label>产品名称</label>
					      <input type="text" placeholder="产品名称" name="object.prdProductName" value="${object.prdProductName }" />
					    </div>
					    
					    <div class="inline field ">
					      <label>城市</label>
					      <input class="field twelve wide" placeholder="城市" type="text" name="object.recycleTradeAddressCity" value="${object.recycleTradeAddressCity }" />
					    </div>
					    
					    <div class="inline field ">
					      <label>地址</label>
					      <input class="field twelve wide" placeholder="地址" type="text" name="object.recycleTradeAddress" value="${object.recycleTradeAddress}"  >
					    </div>
					    
					    <div class="inline fields">
						      <label>回收满意度</label>
						      <div class="field">
							      <div class="ui radio checkbox">
							        <input type="radio" name="object.score" value="1" ${object.score=="1" or object.score == null?'checked':'' }>
							        <label>好评</label>
							      </div>
						    </div>
						    <div class="field">
							      <div class="ui radio checkbox">
							        <input type="radio" name="object.score" value="2" ${object.score=="2"?'checked':'' }>
							        <label>中评</label>
							      </div>
						    </div>
						    <div class="field">
							      <div class="ui radio checkbox">
							        <input type="radio" name="object.score" value="3" ${object.score=="3"?'checked':'' }>
							        <label>差评</label>
							      </div>
						    </div>
						  </div>
			    	    <div class=" inline field ">
					      <label>评价心得</label>
					      <textarea name="object.content">${object.content }</textarea>
					    </div>
			 	<div class="ui error message"></div>
			 	<div class="ui blue button right floated big" id="saveBtn">保存</div>
			</form>
			</div>
		  </div>
		  <div class="actions">
		    <div class="ui black deny button">
		     	取消
		    </div>
		  </div>
