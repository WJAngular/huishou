<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">

	//自适应框框
 	//$('#addOrUpdateLargeModal').modal('refresh');

	$('.ui.clazzBrand.dropdown').dropdown();
	
	var addOrUpdate = "${addOrUpdate}";

	$(document).ready(function(){
		//初始化图片
		uploadImage();
		showUeditor();
	});
	
	$(function(){
		showOrHideElement();
		$("select[id='newsType']").unbind('click').bind('click',function(){
			var type = $("select[id='newsType']").find('option:selected').val();
			if(type=="1" || type == ""){
				$("#newsUrl").hide();
				$("#ueditorDiv").show();
			}else{
				$("#newsUrl").show();
				$("#ueditorDiv").hide();
			}
		});
	});
	function showOrHideElement(){
		var type = $("select[id='newsType']").find('option:selected').val();
		if(type=="1" || type==""){
			$("#newsUrl").hide();
			$("#ueditorDiv").show();
		}else{
			$("#newsUrl").show();
			$("#ueditorDiv").hide();
		}
	};
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
		
		//防止第二次加载时不显示，所以每次加载之后，必须销毁
		UE.getEditor('editor').destroy();
	});

	//取消
	$("#cancelBtn").on("click",function(){
		//防止第二次加载时不显示，所以每次加载之后，必须销毁
		UE.getEditor('editor').destroy();
	});
	//表单验证器
	$('#editForm')
		  .form({
		    fields: {
		    title: {
		        identifier: 'object.title',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '新闻标题不能为空'
		          }
		        ]
		      },
		   type: {
		        identifier: 'object.type',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '请选择类别'
		          }
		        ]
		      },
		      summary: {
			        identifier: 'object.summary',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '摘要不能为空'
			          }
			        ]
			      },
		      iconUrl: {
			        identifier: 'object.iconUrl',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '图片不能为空'
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
	
	function showUeditor(){
		var html = "${object.content}";
  		//实例化编辑器
		var ue = UE.getEditor('editor');
	};
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新新闻
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增新闻
		    	</c:if>
		  </div>
		  <div class=" content">
		  	<div  class="ui raised segment teal clearing">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
					   
					    <div class=" inline field ">
					      <label>类别</label>
					      <select class="ui dropdown" name="object.type" id="newsType">
							  <option value="" ${object.type == '' ? 'selected':'' }>请选择</option>
							  <option value="1" ${object.type == '1' ? 'selected':'' }>内部新闻</option>
							  <option value="2" ${object.type == '2' ? 'selected':'' }>外部新闻</option>
					 		</select>
					    </div>
					    
					    <div class="inline field ">
					      <label>新闻标题</label>
					      <input class="field twelve wide" placeholder="新闻标题" type="text" name="object.title" value="${object.title }"  >
					    </div>
					    
					    <div class="inline field " id="newsUrl">
					      <label>新闻地址</label>
					      <input class="field twelve wide" placeholder="新闻地址" type="text" name="object.newsUrl" value="${object.newsUrl}"  >
					    </div>
					    
					    <div class=" inline field ">
					      <label>新闻摘要</label>
					      <textarea name="object.summary">${object.summary }</textarea>
					    </div>
					    
				    	<div class="inline fields">
				    		<label>新闻图片</label>
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
							  <input id="isHot" type="checkbox" name="object.status"   value="Y" ${object.status == 'Y' ? 'checked' :'' }>
							  <label>是否有效</label>
							</div>
				    	</div>
				    	
				    	<div class="inline field" id="ueditorDiv">
				    		 <script id="editor" type="text/plain" name="object.content" style="width:100%;height:320px;">${object.content}</script>
				    	</div>
				    	
			 	<div class="ui error message"></div>
			 	<div class="ui blue button right floated big" id="saveBtn">保存</div>
			</form>
			</div>
		  </div>
		  <div class="actions">
		    <div class="ui black deny button" id="cancelBtn">
		     	取消
		    </div>
		  </div>
