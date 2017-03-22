<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/layout/header.jsp"></jsp:include>
<jsp:include page="/layout/search.jsp"></jsp:include>
<jsp:include page="/layout/nav.jsp"></jsp:include>

<div class="ui grid  " style="background-color: #F8F8F8; padding: 20px">
	<div class="row">
	
		<!-- 导航 -->
		<div class=" four wide column">
				
				<div class="ui rail">
				<div class="ui sticky">
				<div class="ui teal   segment"  >
					<h2 class="ui dividing header">关于我们<a class="anchor" id="content"></a></h2>
					<div class="ui ordered list">
					  <a class="item" href="#pro1">联系我们</a>
					</div>
				</div>
				</div>
				</div>
		</div>
		<div class=" twelve wide column">
			
			<div class="ui teal   segment"  >
						
						<div class="ui centered grid">
							<div class="row"  id="pro1">
								<div class="column">
								<h2 class="ui dividing header">联系我们<a class="anchor" ></a></h2>
								
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

</div>

<script type="text/javascript">

$(document).ready(function(){
	$('.ui.sticky') .sticky({
	    context: '#pro4'
	  })
	;
})


</script>
<style>
	

</style>

<jsp:include page="/layout/footer.jsp"></jsp:include>