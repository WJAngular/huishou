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
					  <a class="item" href="#pro1">关于安特回收</a>
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
								
									
									<h4>1.安特回收是做什么的？</h4>
									<p>安特回收隶属于深圳市雀子网络科技有限公司，是一个专注于二手数码产品回收服务的网站。</p>
									<p>    目前主要业务有：</p>
									<p>（1） 手机回收</p>
									<p>（2） 笔记本回收</p>
									<p>（3） 平板电脑回收</p>
									<p>（4） 相机回收</p>
									<p>（5） 游戏机回收</p>
									
									<h4>2.我们支持哪些数码产品回收？</h4>
									
									<p>手机回收品牌：苹果、三星、步步高、中兴、华为、诺基亚、摩托罗拉、索尼、LG、HTC、酷派、黑莓、oppo、酷派、等。</p>
									<p>数码相机品牌：索尼、佳能、三星、尼康、理光、富士松下、卡西欧爱国者宾得、奥林巴斯、徕卡等。</p>
									<p>平板电脑品牌：ipad、联想、三星、华硕 、索尼等。</p>
									<p>笔记本回收品牌：联想、华硕、惠普、戴尔、苹果、索尼、东芝、三星、宏基、Thinkliad、神舟等各类品牌笔记本电脑。</p>
									<p>游戏机回收品牌：索尼PSP、NDS、索尼PS、Xbox、任天堂WII等。</p>
									
									<h4>3.我们的回收服务流程？</h4>
									
									<p>A.上门回收（目前可支持深圳市）</p>
									<p>◇评估价格，提交订单。</p>
									<p>◇安特回收专员上门回收，当面付款。</p>
									<p>B.快递邮寄（全国范围可快递邮寄）</p>
									<p>◇评估价格，提交订单。</p>
									<p>◇用户邮寄物品到安特回收网。</p>
									<p>◇安特回收检测后付款。</p>


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