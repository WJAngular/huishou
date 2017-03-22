<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>


	
	<jsp:include page="/h5/header-nav.jsp?title=关于我们&noback=true"></jsp:include>	

	<div class="ui grid container" style="margin-top: 2.6em;">
		
		<div class="row">
			<div class="sixteen wide column" >
					<div class="ui centered grid">
							<div class="row">
									<h2 class="ui header">联系我们</h2>
							</div>
							<div class="row">
								<div class="sixteen wide column">
										<p>客服QQ ： 1552107066</p>
									<p>客服热线 : 0755-23088052</p>
									<p>邮寄地址 : 广东省深圳市宝安区沙井街道宝安大道8216号荣泰园b2栋10楼  </p>
									<p>收件人 : 安特回收网(李先生)</p>
									<p>电话 : 0755-23088052</p>
									<p>服务时间： 周一至周六（9：00—18：00）</p>
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
 		
