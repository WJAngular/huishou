<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>


	
	<jsp:include page="/h5/header-nav.jsp?title=我要加盟&noback=true"></jsp:include>	

	<div class="ui grid container" style="margin-top: 2.6em;">
		
		<div class="row">
			<div class="sixteen wide column" >
					<div class="ui centered grid">
							<div class="row">
									<h2 class="ui header">回收商加盟申请</h2>
							</div>
							<div class="row">
								<div class="sixteen wide column">
									<form class="ui form  " id="editForm">
									  <div class="field ">
									    <label>联系人</label>
									    <input type="text" name="object.contact" >
									  </div>
									  <div class="field">
									    <label>联系电话</label>
									    <input type="text" name="object.tel" >
									  </div>
									  <div class="field">
									    <label>所在地址</label>
									    <input type="text" name="object.address" >
									  </div>
									  <div class="field">
									    <label>加盟理由</label>
									    <textarea  name="object.remark"></textarea>
									  </div>
									  <a class="ui button blue" type="button" onclick="submit()">提交</a>
									</form>	
								</div>
							</div>			
						</div>
			</div>	
		</div>
	</div>
	
	
	
<script type="text/javascript">

	//验证图片验证码
	var addActionUrl = "/other/addJoin";

	function submit(){
		console.log("submit")
		if(!$('#editForm').form("validate form")){
			return;
		}
		console.log("submit2")
		var paramArray = $('#editForm').serializeArray();
		var retData = actionPost(this.addActionUrl,paramArray);
		  if(retData.status == "success"){
			  to_page("/")
		  }
		  else{
			 alert("提交失败!");
		  }
	}
		
	//表单验证器
	$('#editForm')
		  .form({
		      inline: true,
			  fields: {
		    	contact: {
		        identifier: 'object.contact',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '联系人不能为空'
		          }
		        ]
		      },
		 
		      tel: {
			        identifier: 'object.tel',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '联系电话不能为空'
			          }
			        ]
			      },
			      
			      address: {
				        identifier: 'object.address',
				        rules: [
				          {
				            type   : 'empty',
				            prompt : '所在地址不能为空'
				          }
				        ]
				      },
				      
				      remark: {
					        identifier: 'object.remark',
					        rules: [
					          {
					            type   : 'empty',
					            prompt : '加盟理由不能为空'
					          }
					        ]
					      }
		    }
		  })
		;
</script>
 		
