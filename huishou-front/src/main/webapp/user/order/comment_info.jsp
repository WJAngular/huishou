<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				  	<h2 class="ui dividing header"></h2>
				  	<form class="ui form" id="submitForm" action="<%=request.getContextPath()%>/user/saveComment" method="post">
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
					  <div class="inline fields">
					      <label style="width:7%;">评价晒单</label>
					      <textarea placeholder="服务是否给力？快分享你的心得吧~" name="object.content">${object.content }</textarea>
					  </div>
					  <div class="inline fields" >
					      <button class="ui button red" style="margin:0 45% 0 45%;" onclick="saveComment()" type="button" ${object.content == null ?"":"disabled" }>${object.content == null ?"提交":"已提交" }</button>
					  </div>
					  <div class="ui error message"></div>
					  <input type="hidden" name="object.userName" value="${orderInfo.userName }" />
					  <input type="hidden" name="object.contactTel" value="${orderInfo.contactTel }" />
					  <input type="hidden" name="object.orderId" value="${orderInfo.orderId }" />
					  <input type="hidden" name="object.recycleType" value="${orderInfo.recycleType }" />
					  <input type="hidden" name="object.recycleTradeAddress" value="${orderInfo.recycleTradeAddress }" />
					  <input type="hidden" name="object.prdProductId" value="${orderInfo.prdProductId }" />
					  <input type="hidden" name="object.prdProductName" value="${orderInfo.prdProductName }" />
					  <input type="hidden" name="object.recycleTradeAddressCity" value="${orderInfo.recycleTradeAddressCity }" />
					  <input type="hidden" name="object.tradePrice" value="${orderInfo.tradePrice }" />
					  <input type="hidden" name="object.assessPrice" value="${orderInfo.assessPrice }" />
					</form>
				</div>

				<jsp:include page="detail.jsp"></jsp:include>
				
			</div>
		</div>
	</div>

</div>


<script type="text/javascript">

	$(document).ready(function() {
	
	})
	function saveComment(){
		//先验证表单
		 if(!$('#submitForm').form("validate form")){
				return;
		}
		 $('#submitForm').submit();
	}
	
	//表单验证器
	$('#submitForm')
		  .form({
		    fields: {
		      content: {
			        identifier: 'object.content',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '请填写评价晒单内容'
			          }
			        ]
			      }
		    }
		  })
		;
</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>