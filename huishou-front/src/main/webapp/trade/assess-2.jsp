<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/search.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<div class="ui grid " style="background-color: #F8F8F8;padding: 20px">
		<div class="row">
			<!-- 左边 -->
			<div class="twelve wide column">
					
					<div class="ui teal inverted segment" >
 						<div class="ui grid " style="padding: 10px">
							<div class=" four wide column">
								<h2 class="ui header">
								  <div class="content" style="color: white">￥${endPrice }
								  	<div class="sub header" style="color:wheat">回收商最高报价</div>
								  </div>
								</h2>
							</div>
								<div class="  four wide column"></div>
							<div class="  four wide column">
								<h3 class="ui header">
								  <i class="recycle icon"></i>
								  <div class="content" style="color: white">
								  	<div class="sub header" style="color:wheat">72小时价格保护</div>
								  </div>
								</h3>
							</div>
								<div class="  four wide column">
								<h3 class="ui header">
								  <i class="recycle icon"></i>
								  <div class="content" style="color: white">
								  	<div class="sub header" style="color:wheat">上门交易方便快捷</div>
								  </div>
								</h3>
							</div>
						</div>
					</div>
					
					<div class="ui teal  segment">
						
						<h2 class="ui dividing header">交易方式<a class="anchor" id="types"></a></h2>
						<img class="ui   image centered" src="../image/shangmen.png?1">
						<img class="ui   image centered" src="../image/kuaidi.png?2">
<!-- 						<img class="ui   image centered" src="../image/qubie.png"> -->
					
					</div>
					
					<div class="ui teal  segment">
						<h2 class="ui dividing header">隐私保护<a style="float:right;font-size:8px">所有机器都会使用360安全卫士，删除您的所有私人数据</a></h2>
						<img class="ui   image centered" src="../image/siyin.png?3">
					</div>
					
<!-- 					<div class="ui teal  segment"> -->
<!-- 						<h2 class="ui dividing header">品牌保证<a style="float:right;font-size:8px">我们让回收变成一件很简单的事</a></h2> -->
<!-- 						<h4 class="ui center aligned header">安特回收网是世界银行旗下网站，成立于2010年3月，是国内首家把传统回收互联网化的公司。采用O2O+C2B的模式，打造全国专业的数码产品交易平台。</h4> -->
<!-- 						<img class="ui   image centered" src="../image/pinpaibaozheng.png"> -->
<!-- 					</div> -->
					
						
					<div class="ui teal  segment" id="example1">
						<h2 class="ui dividing header">常见问题</h2>
						<img class="ui   image centered" src="../image/problem.png?4">
					</div>
					
					
					
			</div><!-- 左边 -->
			
			<!-- 右边 -->
			<div class="four wide column ">
					<div class="ui rail">
					  <div class="ui sticky">
					   <div class="ui clearing segment center aligned">
								<h3 class="ui dividing header">${object.name }</h3>
									<div class="ui inverted green  segment">
									  <h2 class="ui inverted header">
									           ￥${endPrice }
									    <div class="sub header">评估价</div>
									  </h2>
									</div>
								<p>
									<a class="ui button teal" onclick="to_apply()">马上去换钱</a>
									<button class="ui button teal basic" onclick="product(${object.id })">重新估价</button>
								</p>
								<a>服务承诺：深圳 最快明天可以完成交易 <br>
								交易方式：上门回收 快递回收</a>
						</div>
					  </div>
					</div>
			</div><!-- 右边 -->
			
		</div>

</div>

<script type="text/javascript">
	
	var actionUrl = "${actionUrl}";
	this.applyPageUrl = actionUrl + "apply";
	this.productPageUrl = actionUrl + "product";
	
	function to_apply(){
		to_page(applyPageUrl)
	}

	function choose(object){
		$(".pkg").removeClass("active")
		$("#"+object).addClass("active")
	}

	
	
	function product(id){
		var actionParams = {"id":id};
		standardPost(productPageUrl,actionParams)	;
	}
	
	
	$(document).ready(function(){
		$('.ui.sticky') .sticky({
		    context: '#example1'
		  })
		;
	})
	
	
	
</script>



<jsp:include page="../layout/footer.jsp"></jsp:include>