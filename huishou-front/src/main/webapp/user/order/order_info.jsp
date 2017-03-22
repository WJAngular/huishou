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
				  <p>${orderInfo.remark}</p>
				  <h2 class="ui dividing header"></h2>
				
				  <c:if test="${orderInfo.recycleType == 'express' }">
					  <h3>物流信息</h3>
					  <p>物流公司：
					  	  <c:forEach items="${ express}" var="express">
					  	  	<c:if test="${orderInfo.recycleExpress == express.paramCode}">
					  	  		${ express.paramDesc}
					  	  	</c:if>
					   	  </c:forEach>
					  </p>
					  <p>运单号码：${orderInfo.recycleExpressCode }</p>
					  <p>物流跟踪：请上 网站 进行查询</p>
				  </c:if>
				  
				  <c:if test="${orderInfo.recycleType == 'facetoface' }">
					  <h3>上门交易</h3>
					  <p>地址：
					  	  <c:forEach items="${ recycleTradeAddressCity}" var="recycleTradeAddressCity">
					  	  	<c:if test="${orderInfo.recycleTradeAddressCity == recycleTradeAddressCity.paramCode}">
					  	  		${ recycleTradeAddressCity.paramDesc} ${orderInfo. recycleTradeAddress}
					  	  	</c:if>
					   	  </c:forEach>
					  </p>
					  <p>交易时间：<fmt:formatDate value='${orderInfo.recycleTradeTime}' pattern='yyyy-MM-dd' /></p>
				  </c:if>
				  
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
</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>