<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/layout/header.jsp"></jsp:include>
<jsp:include page="/layout/topmenu.jsp"></jsp:include>
<jsp:include page="/layout/search.jsp"></jsp:include>
<jsp:include page="/layout/nav.jsp"></jsp:include>




<div class="ui grid  " style="background-color: #F8F8F8; padding: 20px">
	<div class="row">
		<div class=" one wide column"></div>
		<div class=" fourteen wide column">
			<div class="ui teal segment"  style="padding: 20px">
				
				<jsp:include page="process.jsp"></jsp:include>
				
				<div class="ui attached segment">
				  <p>1.请您尽快把物品通过快递到付方式寄到以下地址：${expressAddress.paramDesc}</p>
				  <p>2.取货成功以后，您可以在下面的物流信息里查看物品的运送情况。</p>
				  <h2 class="ui dividing header"></h2>
				  <form class="ui form" id="submitForm" action="<%=request.getContextPath()%>/user/express">
					  <div class="inline fields">
					    <div class="five wide field">
					      <label>填写快递单号</label>
					       <select class="ui  dropdown"  name="object.recycleExpress">
					       	   <option value="" selected>请选择快递公司</option>
							  <c:forEach items="${ express}" var="express">
						   			 <option value="${ express.paramCode}">${ express.paramDesc}</option>
					   		  </c:forEach>
							</select>
					    </div>
					    <div class="four wide field">
					      <input type="text" placeholder="快递单号" name="object.recycleExpressCode">
					    </div>
					    <div class="three wide field">
					      <button class="ui button tiny red" onclick="express()" type="button">发货</button>
					    </div>
					  </div>
					  <div class="ui error message"></div>
					</form>
				</div>

				<jsp:include page="detail.jsp"></jsp:include>
			</div>
		</div>
	</div>

</div>

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
<jsp:include page="/layout/footer.jsp"></jsp:include>