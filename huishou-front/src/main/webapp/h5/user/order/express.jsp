<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/layout/header.jsp"></jsp:include>


	<jsp:include page="/h5/header-nav.jsp?title=发货"></jsp:include>	

	<jsp:include page="process.jsp"></jsp:include>
	
	<div class="ui grid "  >
					<div class="row">
						<div class="sixteen wide column">
							<h4 class="ui horizontal divider teal header">
							  <i class="tag icon"></i>
							   	 订单信息
							</h4>
						</div>
					</div>	
	</div>				
					
		<div class="ui grid container"  >
					<div class="row">
						<div class="sixteen wide column">
							<div class="ui padded ">
							  <p>1.请您尽快把物品通过快递到付方式寄到以下地址：${expressAddress.paramDesc}</p>
							  <p>2.取货成功以后，您可以在下面的物流信息里查看物品的运送情况。</p>
							  <h2 class="ui dividing header"></h2>
							  <form class="ui form" id="submitForm" action="<%=request.getContextPath()%>/user/express">
								    <div class=" field">
								       <select class="ui  dropdown"  name="object.recycleExpress">
								       	   <option value="" selected>请选择快递公司</option>
										  <c:forEach items="${ express}" var="express">
									   			 <option value="${ express.paramCode}">${ express.paramDesc}</option>
								   		  </c:forEach>
										</select>
								    </div>
								    <div class=" field">
								      <input type="text" placeholder="快递单号" name="object.recycleExpressCode">
								    </div>
								    <div class=" field">
								      <button class="ui button tiny red" onclick="express()" type="button">发货</button>
								    </div>
								  <div class="ui error message"></div>
								</form>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="sixteen wide column">
							
						</div>
					</div>
		</div>
	
	
	  <jsp:include page="detail.jsp"></jsp:include>
	

<script type="text/javascript">

	
	$(document).ready(function() {
		//初始化下拉菜单
		$('.ui.dropdown')
		  .dropdown({
		    useLabels: false
		  })
		;
	})
	
	function express(){
		//先验证表单
		 if(!$('#submitForm').form("validate form")){
				return;
		}
		 $('#submitForm').submit()
	}
	
	
	
	//表单验证器
	$('#submitForm')
		  .form({
		    fields: {
		    	recycleExpress: {
		        identifier: 'object.recycleExpress',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '请选择快递公司'
		          }
		        ]
		      },
		      recycleExpressCode: {
			        identifier: 'object.recycleExpressCode',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '请填写快递单号'
			          }
			        ]
			      }
		    }
		  })
		;
	
</script>
