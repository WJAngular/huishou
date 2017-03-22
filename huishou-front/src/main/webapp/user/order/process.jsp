<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

				
				<div class="ui grid">
					<div class="column center aligned">
						<div class="ui ordered steps tiny">
						  <div class="completed step">
						    <div class="content">
						      <div class="title">提交订单</div>
						      <div class="description">${orderInfo.createTime}</div>
						    </div>
						  </div>
						  
						  
							  <div class=" step step_ expressStep" id="WAIT_EXPRESS" style="display: none">
							    <div class="content">
							      <div class="title">用户发货</div>
							    </div>
							  </div>
							  <div class="  step step_ expressStep" id="WAIT_TAKE" style="display: none">
							    <div class="content">
							      <div class="title">等待收货</div>
							    </div>
							  </div>
							  <div class="  step step_ expressStep" id="HAS_RECEIVE" style="display: none">
							    <div class="content">
							      <div class="title">收货检验</div>
							    </div>
							  </div>
							  <div class="  step step_ expressStep" id="PAYING" style="display: none">
							    <div class="content">
							      <div class="title">放款</div>
							    </div>
							  </div>
						  
						  	  <div class=" step step_ facetofaceStep" id="WAIT_CONFIRM" style="display: none">
							    <div class="content">
							      <div class="title">等待回收人员确认</div>
							    </div>
							  </div>
							  <div class=" step step_ facetofaceStep" id="HAS_CONFIRM" style="display: none">
							    <div class="content">
							      <div class="title">等待交易</div>
							    </div>
							  </div>
						  
						   <div class="  step step_" id="FINISH">
						    <div class="content">
						      <div class="title">交易成功</div>
						    </div>
						  </div>
						</div>
					</div>
				</div>
				<div class="ui top attached info message">
				     订单状态： <c:forEach items="${ orderStatus}" var="orderStatus">
							   		<c:if test="${ orderInfo.status ==  orderStatus.paramCode}">
							   			${ orderStatus.paramDesc}
							   		</c:if>
					    </c:forEach>
				</div>
<script type="text/javascript">

	
	$(document).ready(function() {
		
		var status = '${orderInfo.status}'
		var recycleType = '${orderInfo.recycleType}'
		if(recycleType == 'express'){
			
			$(".expressStep").css("display","flex");
			
			if(status == 'WAIT_EXPRESS'){
				$(".step_").addClass("disabled");
				$("#WAIT_EXPRESS").addClass("active");
			}
			else if(status == 'WAIT_TAKE'){
				$(".step_").addClass("disabled");
				$("#WAIT_EXPRESS").addClass("completed");
				$("#WAIT_TAKE").addClass("active");
				
			}else if(status == 'HAS_RECEIVE'){
				$(".step_").addClass("disabled");
				$("#WAIT_EXPRESS").addClass("completed");
				$("#WAIT_TAKE").addClass("completed");
				$("#HAS_RECEIVE").addClass("active");
			}
			else if(status == 'PAYING'){
				$(".step_").addClass("disabled");
				$("#WAIT_EXPRESS").addClass("completed");
				$("#WAIT_TAKE").addClass("completed");
				$("#HAS_RECEIVE").addClass("completed");
				$("#PAYING").addClass("active");
			}
			else if(status == 'FINISH'){
				$(".step_").addClass("disabled");
				$("#WAIT_EXPRESS").addClass("completed");
				$("#WAIT_TAKE").addClass("completed");
				$("#HAS_RECEIVE").addClass("completed");
				$("#PAYING").addClass("completed");
				$("#FINISH").addClass("completed");
			}else if(status == 'CLOSE'){
				$(".step_").addClass("disabled");
			}
			
		}else{
			$(".facetofaceStep").css("display","flex");
			
			if(status == 'WAIT_CONFIRM'){
				$(".step_").addClass("disabled");
				$("#WAIT_CONFIRM").addClass("active");
			}
			else if(status == 'HAS_CONFIRM'){
				$(".step_").addClass("disabled");
				$("#WAIT_CONFIRM").addClass("completed");
				$("#HAS_CONFIRM").addClass("active");
			}
			else if(status == 'FINISH'){
				$(".step_").addClass("disabled");
				$("#WAIT_CONFIRM").addClass("completed");
				$("#HAS_CONFIRM").addClass("completed");
				$("#FINISH").addClass("completed");
			}else if(status == 'CLOSE'){
				$(".step_").addClass("disabled");
			}
			
		}
		
		
	})
	
</script>
				