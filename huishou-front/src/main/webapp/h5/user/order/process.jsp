<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

				
				
				<div class="ui grid "  style="margin-top: 3.6em;">
		
					<div class="row">
						<div class="sixteen wide column">
							<h4 class="ui horizontal divider blue header">
							  <i class="tag icon"></i>
							   	流程
							</h4>
						</div>
					</div>
				</div>
				
				<div class="ui grid container"  >
					<div class="row">
						<div class="sixteen wide column">
							<p>订单号:${orderInfo.orderId }</p>
						</div>
					</div>
					<div class="row">
						<div class="sixteen wide column">
							<div class="ui bulleted list" id="processItem">
							  <div class="item step_ " id="START">提交订单 </div>
							  
							  <div class="item step_ expressStep" id="WAIT_EXPRESS" style="display: none">用户发货</div>
							  <div class="item step_ expressStep" id="WAIT_TAKE" style="display: none">等待收货</div>
							  <div class="item step_ expressStep" id="HAS_RECEIVE" style="display: none">收货检验</div>
							  <div class="item step_ expressStep" id="PAYING" style="display: none">放款</div>
							  
							  <div class="item step_ facetofaceStep"  id="WAIT_CONFIRM" style="display: none">等待回收人员确认</div>
							  <div class="item step_ facetofaceStep" id="HAS_CONFIRM" style="display: none">等待交易</div>
							  
							  <div class="item step_" id="FINISH">交易成功</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
<script type="text/javascript">

		$(document).ready(function() {
			
			var status = '${orderInfo.status}'
			var recycleType = '${orderInfo.recycleType}'
			if(recycleType == 'express'){
				
				$(".expressStep").css("display","flex");
				
				if(status == 'WAIT_EXPRESS'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_EXPRESS").removeClass("disabled").css("color","red")
				}
				else if(status == 'WAIT_TAKE'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_EXPRESS").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_TAKE").removeClass("disabled").css("color","red")
					
				}else if(status == 'HAS_RECEIVE'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_EXPRESS").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_TAKE").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#HAS_RECEIVE").removeClass("disabled").css("color","red")
				}
				else if(status == 'PAYING'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_EXPRESS").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_TAKE").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#HAS_RECEIVE").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#PAYING").removeClass("disabled").css("color","red")
				}
				else if(status == 'FINISH'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_EXPRESS").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_TAKE").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#HAS_RECEIVE").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#PAYING").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#FINISH").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
				}else if(status == 'CLOSE'){
					$(".step_").css("display","none");
					$("#processItem").append('<div class="item" style="color:red">订单已取消 </div>')
				}
				
			}else{
				$(".facetofaceStep").css("display","flex");
				
				if(status == 'WAIT_CONFIRM'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_CONFIRM").removeClass("disabled").css("color","red")
				}
				else if(status == 'HAS_CONFIRM'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_CONFIRM").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#HAS_CONFIRM").removeClass("disabled").css("color","red")
				}
				else if(status == 'FINISH'){
					$(".step_").addClass("disabled");
					$("#START").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#WAIT_CONFIRM").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#HAS_CONFIRM").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
					$("#FINISH").removeClass("disabled").css("color","green").append('<i class="green check icon"></i>')
				}else if(status == 'CLOSE'){
					$(".step_").css("display","none");
					$("#processItem").append('<div class="item" style="color:red">订单已取消 </div>')
				}
				
			}
			
			
	})
	
</script>
				