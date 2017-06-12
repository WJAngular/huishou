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
		    linkName: {
		        identifier: 'object.linkName',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '链接名称不能为空'
		          }
		        ]
		      },
		      linkType: {
		        identifier: 'object.linkType',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '请选择类别'
		          }
		        ]
		      },
		      linkUrl: {
			        identifier: 'object.linkUrl',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '链接地址不能为空'
			          }
			        ]
			      }     
			      
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
					      <label>类别</label>
					      <select class="ui dropdown" name="object.linkType" id="linkType">
							  <option value="" ${object.linkType == '' ? 'selected':'' }>请选择</option>
							  <option value="1" ${object.linkType == '1' ? 'selected':'' }>门户网站</option>
							  <option value="2" ${object.linkType == '2' ? 'selected':'' }>论坛博客</option>
					 		</select>
					    </div>
					    
					    <div class="inline field ">
					      <label>链接名称</label>
					      <input class="field twelve wide" placeholder="链接名称" type="text" name="object.linkName" value="${object.linkName }"  >
					    </div>
					    
					    <div class="inline field ">
					      <label>链接地址</label>
					      <input class="field twelve wide" placeholder="链接地址" type="text" name="object.linkUrl" value="${object.linkUrl}"  >
					    </div>
					    
				    	<div class="inline fields">
				    		<label>链接图片</label>
				    		<div class="field twelve wide">
				    		 	<input placeholder="图片地址" type="text" name="object.iconUrl" value="${object.iconUrl}"  id="imageSrc">
				    		 </div>
				    		 <div class="ui button" onclick="uploadImage()">上传</div>
				    	</div>
			 			<div class="inline fields">
			 				<label>确认图片</label>
				    		<img alt="" src="" id="imageObject" class="ui image small ">
				    	</div>
			 			
			 			<div class="inline field">
			 				<div class="ui toggle checkbox">
							  <input id="isHot" type="checkbox" name="object.isvalid"   value="Y" ${object.isvalid == 'Y' ? 'checked' :'' }>
							  <label>是否有效</label>
							</div>
				    	</div>
				    	
				    	<div class="inline field ">
					      <label>排序</label>
					      <input placeholder="排序" type="text" name="object.orderby" value="${object.orderby}"  >
					    </div>
					    
			    	    <div class=" inline field ">
					      <label>备注</label>
					      <textarea name="object.remark">${object.remark }</textarea>
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
