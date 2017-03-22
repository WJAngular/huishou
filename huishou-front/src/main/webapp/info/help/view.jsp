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
					<h2 class="ui dividing header">帮助中心<a class="anchor" id="content"></a></h2>
					<div class="ui ordered list">
					  <a class="item" href="#pro1">没有我的型号</a>
					  <a class="item" href="#pro2">提交订单以后</a>
				 	  <a class="item" href="#pro3">保障交易安全</a>
				 	  <a class="item" href="#pro4">保护用户隐私</a>
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
								<h2 class="ui dividing header">没有我的型号<a class="anchor" ></a></h2>
								<div class="con_con"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>网站没有我要评估的机器型号怎么办？</strong></p>

									<p>&nbsp; &nbsp; &nbsp; 方法一：请通过以下链接页面提交您的物品信息，网站系统会以短信形式给您报价。<span style="color:#FF0000">推荐&nbsp;</span></p>
									
									<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;提交地址：<a href="http://www.anthuishou.com/other/newproduct/view.jsp"><span style="color:#0000CD">http://www.anthuishou.com/other/newproduct/view.jsp</span></a></p>
									
									<p>&nbsp; &nbsp; &nbsp;</p>
									
									<p>&nbsp; &nbsp; &nbsp; 方法二：您可以通过安特回收网在线客服QQ（1552107066）进行询价，我们的在线客服会及时为您报价。</p>
									<p>&nbsp; &nbsp; &nbsp;<strong><span style="color:rgb(0, 0, 0)">报价服务时间：周一至周六 每天9:30——18:00</span></strong>
									</p>
									
									</div>
								</div>
							</div>
							<div class="row"  id="pro2">
								<div class="column">
								<h2 class="ui dividing header">提交订单以后<a class="anchor" ></a></h2>
								<div class="con_con"><p>&nbsp; &nbsp; &nbsp; &nbsp; 上门回收：提交订单后，请耐心等待我们的工作人员联系您上门回收。</p>

									<p><span style="font-family:宋体">&nbsp; &nbsp; &nbsp; &nbsp; 邮寄回收：提交订单后，请尽快联系顺丰快递发货，安特回收网会在收到货后24小时内给您确认检测情况并付款。</span></p>
									
									<p><span style="font-family:宋体">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;淘宝担保：提交订单后，请及时联系安特回收在线客服以便尽快给您付款拍下。</span></p>
									
									</div>
								</div>
							</div>	
							<div class="row"  id="pro3">
								<div class="column">
									<h2 class="ui dividing header">保障交易安全<a class="anchor" ></a></h2>	
									<div class="con_con"><p>&nbsp; 安特回收网于2013年经工商局注册成立，相关资料都有备案（ICP备案：粤ICP备16097252号-1）有据可查。此外，安特回收网也支持多城市上门回收，当面付款。</p>
									</div>
								</div>
							</div>	
							<div class="row"  id="pro4">
								<div class="column">
									<h2 class="ui dividing header">保护用户隐私<a class="anchor" ></a></h2>	
									<div class="con_con"><div>&nbsp;&nbsp;&nbsp; 安特回收网对于用户回收过程中的全部资料均有严格保密措施。所有一经确认回收的机器，我们将会再次进行深度数据清除，确保个人隐私不外泄。</div>

									</div>
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
	
	.con_con{
		padding: 20px
	}
	
</style>

<jsp:include page="/layout/footer.jsp"></jsp:include>