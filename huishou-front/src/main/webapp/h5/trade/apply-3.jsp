<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>


	
	<jsp:include page="/h5/header-nav.jsp?title=提交订单"></jsp:include>	
	
	<div class="ui bottom fixed two item inverted menu">
      <a class=" active orange item">合计回收金额:${orderInfo.assessPrice }元</a>
      <a class="active teal item" onclick="submit()">提交订单</a>
    </div>
    
	<div class="ui grid " style="margin-top: 3em;padding: 10px;">
		
		<div class="row">
			<div class="sixteen wide column">
					<h4 class="ui horizontal divider blue header"><i class="tag icon"></i>
					  	回收清单
					</h4>
					<div class="ui teal segment">
			<p>
				物品名称: ${orderInfo.prdProductName } <br>  回收价格：${orderInfo.assessPrice }元 
			</p>
		</div>
			</div>	
		</div>
		
		
		<div class="row">
			<div class="sixteen wide column">
					<h4 class="ui horizontal divider blue header"><i class="tag icon"></i>
					  	选择交易方式
					</h4>
			</div>	
		</div>
		
		<div class="row centered">
			<div class="sixteen wide column">
				<div class="recyclemethod ui  buttons big fluid ">
				  <button class="ui button teal" onclick="chooseRecyclyType('facetoface')">当面交易<br><br> 上门免收服务费</button>
				  <div class="or"></div>
				  <button class="ui button" onclick="chooseRecyclyType('express')">快递回收<br><br>包邮</button>
				</div>
			</div>	
			<div class="sixteen wide column" style="display: none" id="expressAddress">
				<div class="ui brown message">
					请快递到如下地址:${expressAddress.paramDesc }
				</div>
			</div>
		</div>
		
		
		<div class="row centered">
			<div class="sixteen wide column">
				
				<div class="ui grid container " >
					<div class="row">
						<form class="ui form" id="applyForm">
							
							<div class="ui error message"></div>
							
							 <div class="field">
							    <div class="two fields">
							      <div class="field">
							        <input type="text" name="object.contactName" placeholder="姓名">
							      </div>
							      <div class="field" id="contactTelDiv">
							        <input type="text" name="object.contactTel" id="contactTel" value="" placeholder="手机号码">
							      </div>
							    </div>
							  </div>
							  
							  <div class="field">
							    <div class="two fields">
							      <div class="field">
							     		<div class="ui  icon input">
									  <input type="text" placeholder="请输入图片验证码" id="code" name="imgCode">
									   <img id="codeImg" src="<%=request.getContextPath()%>/system/randomCode" class="ui image" onclick="javascript:this.src='<%=request.getContextPath()%>/system/randomCode?' + new Date().getTime();">
									</div>
							      </div>
							      <div class="field">
							        <div class="ui action input">
									  <input type="text" placeholder="输入短信验证码" name="smsCode" id="smsCode">
									  <button class="ui button" id="sendMobileCodeBtn" onclick="validImageCode()" type="button">
									  		<a id="sendMobileCodeMsg">获取短信验证码</a>
									  </button>
									</div>
							      </div>
							    </div>
							  </div>
							  
							  <br>
							  
							  
							  
							  
							  <div id="address"> 
							   <div class="field">
							      <select class="ui fluid dropdown" name="object.recycleTradeAddressCity" >
							        <option value="">选择 交易城市</option>
									<c:forEach items="${ recycleTradeAddressCity}" var="recycleTradeAddressCity">
								   	 	<option value="${recycleTradeAddressCity.paramCode }"  >
								   	 		${recycleTradeAddressCity.paramDesc }
								   	 	</option>
									</c:forEach>	
    							  </select>
    							</div>
    							
							 <div class=" field" >
							      <div class="field ">
							        <input type="text" name="object.recycleTradeAddress" placeholder="请输入详细交货地址">
							      </div>
							  </div>
							  </div>
							 
    						
    						
    						
								<h4 class="ui horizontal divider blue header"><i class="tag icon"></i>
					  				收款方式
								</h4>							  
							    <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('alipay')" type="radio" name="object.payType" value="alipay" tabindex="0" class="fruit1">
							        <label>支付宝转账</label>
							      </div>
							    </div>
							    
							      <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('wx')" type="radio" name="object.payType" value="wx" tabindex="0" class="fruit1">
							        <label>微信转账</label>
							      </div>
							    </div>
							    
							    
							    <div class="field">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('bank')" type="radio" name="object.payType" value="bank" tabindex="0" class="fruit1">
							        <label>网银转账</label>
							      </div>
							    </div>
							    <div class="field" id="paycash">
							      <div class="ui radio checkbox paymethod">
							        <input onchange="changePayType('cash')" type="radio" name="object.payType" value="cash" tabindex="0" class="fruit1">
							        <label>现金收款</label>
							      </div>
							    </div>
							  
							  
									<!--网银转账方式 -->
							 	  <div class="payTypeField field" id="bankField" style="display: none">
									    <div class="two fields">
									      <div class="field">
									        <select class="ui search dropdown" name="object.payBankCode">
											  <option value="">请选择</option>
											 <c:forEach items="${ payBankCode}" var="payBankCode">
										   	 	<option value="${payBankCode.paramCode }" >
										   	 		${payBankCode.paramDesc }
										   	 	</option>
											</c:forEach>	
											 </select>
									      </div>
									      <div class="field">
									        <input type="text" name="object.payBankAccountName"  placeholder="开户姓名">
									      </div>
									       <div class="field">
									        <input type="text" name="object.payBankAccountNum"  placeholder="卡号">
									      </div>
									    </div>
								 </div>		<!--网银转账方式 -->	
										
									<!-- 支付宝转账 -->
							 	<div class="payTypeField field"  id="alipayField" style="display: none">
							      <label>支付宝账号</label>
							      <input placeholder="支付宝账号" type="text" name="object.payOtherAccount"  >
							    </div>	<!-- 支付宝转账 -->
					    	
					    		<!-- 微信转账 -->
							 	<div class="payTypeField field"  id="wxField" style="display: none">
							      <label>微信账号</label>
							      <input placeholder="微信账号" type="text" name="object.payOtherAccount"  >
							    </div>	<!-- 微信转账 -->
							    
											
														  
							  
							  <div id="tradetime" >
							  <h4 class="ui horizontal divider blue header"><i class="tag icon"></i>
							  			交易时间
								</h4>
							      <div class="field">
							        <select class="ui  dropdown" name="object.recycleTradeTime">
									  <option value="">请选择</option>
									 	<c:forEach items="${recycleTradeTime }" var="recycleTradeTime">
									 		 <option value="${recycleTradeTime}">${recycleTradeTime}</option>
									 	</c:forEach> 
									 </select>
							      </div>
							       <div class="field">
							       			<label>最近3天有效</label>
							       </div>
							  </div>
							  
							  	<div class="field"  >
							      <input placeholder="机器备注 苹果有锁，请备注开机密码以及icloud账号,其他机器输入开机密码" type="text" name="object.machinePassword"  >
							    </div>	
							    
							    <div class="field">
								    <div class="ui checkbox">
								      <input type="checkbox" tabindex="0"  name="hasRead">
								      <label>我已阅读安特回收服务条款</label>
								    </div>
								  </div>
							  
							</form>	
					</div>
					
					
					<div class="row">
						
						 
								
								
						
					</div>
					
				</div>
						
			</div>
		</div>
		
	</div>
	
	
	
<script type="text/javascript">

	//验证图片验证码
	var validRandomCodeActionUrl = "/system/validRandomCode";
	//发送图片验证码
	var sendCodeActionUrl = "/system/sendCode"
	//提交表单
	var submitSettleActionUrl = "/trade/settle";
	//提交到成功页面
	var successActionUrl = "/trade/success";
	

	$(document).ready(function() {
		
		//初始化单选按钮
		$('.checkbox').checkbox();
		
		//初始化下拉菜单
		$('.ui.dropdown')
		  .dropdown({
		    useLabels: false,
		    maxSelections: 3
		  })
		;
		
		//初始化按钮组
		  var
		    $buttons         = $('.recyclemethod.ui.buttons .button'),
		    // alias
		    handler = {
		      activate: function() {
		        $(this)
		          .addClass('teal')
		          .siblings()
		          .removeClass('teal')
		        ;
		      }

		    }
		  ;
		  $buttons
		    .on('click', handler.activate)
		  ;
	})
	
	var recycleType = "facetoface";
	//回收方式选择
	function chooseRecyclyType(type){
		
		recycleType = type;
		if(type == 'express'){
			$("#address").css("display","none");
			$("#paycash").css("display","none");
			$("#tradetime").css("display","none");
			$("#expressAddress").css("display","block");
		}else{
			$("#expressAddress").css("display","none");
			$("#address").css("display","block");
			$("#paycash").css("display","flex");
			$("#tradetime").css("display","block");
		}
		
	}
	
	var payType = "";
	//判断选择的转账方式
	function changePayType(b){
		payType = b;
		if(b == 'alipay'){
			$(".payTypeField").css("display","none");	
			$("#alipayField").css("display","block");
		}
		
		else if(b == 'wx'){
			$(".payTypeField").css("display","none");	
			$("#wxField").css("display","block");
		}
		
		else if(b == 'bank'){
			$(".payTypeField").css("display","none");	
			$("#bankField").css("display","block");
		}
		
		else if(b == 'cash'){
			$(".payTypeField").css("display","none");	
		}
	}
	
	var delayTime = 60;
	var delayFlag = true;
	
	 //验证图形验证码
	function validImageCode(){
		
		  if($("#code").val() == ""){
			  fromError("请输入图片验证码!" );
		        return;
		    }
		
		 if($("#contactTel").val() == ""){
			 fromError("请输入手机号码!" );
		     return;
		 }
		  
		  //验证图形验证码
		  var actionParamArray = {"code":$("#code").val()}
		  var retData = actionPost(this.validRandomCodeActionUrl,actionParamArray);
		  
		  //图形验证码正确
		  if(retData.status == "success"){
			  //发送短信验证码
			  sendMobileCode();
		  }
		  //图形验证码错误
		  else{
			  $("#codeImg").click();
			  $("#code").val("");
			  fromError("图片验证码有误!" );
		  }
	}
	
	 
	//发送短信验证码
	function sendMobileCode(){
		
		  if ($("#sendMobileCodeBtn").attr("disabled") || delayFlag == false) {
		        return;
		    }
		  
		  $("#sendMobileCodeBtn").attr("disabled", "disabled");
	      $("#sendMobileCodeMsg").html("60秒后重新获取");
	      $("#contactTelDiv").addClass("disabled");
	      setTimeout(countDown, 1000);
	        
		  
		  var sendCodeActionParamArray = {"mobile":$("#contactTel").val()}
		  var sendCodeRetData = actionPost(this.sendCodeActionUrl,sendCodeActionParamArray);
		  if(sendCodeRetData.status == "success"){
			  
		  }else{
			  alert(sendCodeRetData.message);
		  }
		  
	}
	
	//计数器
	function countDown() {
	    delayTime--;  
	    $("#sendMobileCodeBtn").attr("disabled", "disabled");
	    $("#sendMobileCodeMsg").html(delayTime + '秒后重新获取');
	    if (delayTime == 1) {
	        delayTime = 60;
	        $("#sendMobileCodeMsg").html("获取短信验证码");
	        $("#sendMobileCodeBtn").removeAttr("disabled");
	        $("#contactTelDiv").removeClass("disabled");
	        $("#mobileCode_error").hide();
	        delayFlag = true;
	    } else {
	        delayFlag = false;
	        setTimeout(countDown, 1000);
	    }
	}
	
	function fromError(msg){
		$("#applyForm").form('add errors', { error: msg });
	}
	
	function submit(){
		
		//先验证表单
		 if(!$('#applyForm').form("validate form")){
				return;
		}
		 
		//手工校验
		if(payType == 'alipay'){
			if($("input[name='object.payOtherAccount']").val() == ""){
				fromError("请输入支付宝账号");
				return;
			}
		}
		
		//手工校验
		if(payType == 'wx'){
			if($("input[name='object.payOtherAccount']").val() == ""){
				fromError("请输入微信账号");
				return;
			}
		}
		
		if(payType == 'bank'){
			if($("input[name='object.payBankCode']").val() == ""){
				fromError("请选择银行" );
				return;
			}
			if($("input[name='object.payBankAccountName']").val() == ""){
				fromError("请输入银行账户名称" );
				return;
			}
			if($("input[name='object.payBankAccountNum']").val() == ""){
				fromError("请输入银行卡号" );
				return;
			}
		}
		if(recycleType == 'facetoface'){
			if($("input[name='object.recycleTradeAddress']").val() == ""){
				fromError("请输入取货地址" );
				return;
			}
			if($("select[name='object.recycleTradeAddressCity']").val() == ""){
				fromError( "请输入取货城市" );
				return;
			}
			if($("select[name='object.recycleTradeTime']").val() == ""){
				fromError("请输入取货时间" );
				return;
			}
		}
		
		
		
		
		var paramArray = $('#applyForm').serializeArray();
		paramArray.push({
		    "name": "object.recycleType",
		    "value": recycleType
		});
		
		//打印需要提交的东西
		 $.each(paramArray, function(i, field){
			 console.log("提交:"+field.name + ":" + field.value + " ");
		});
		
		
		 var submitRetData = actionPost(this.submitSettleActionUrl,paramArray);
		 if(submitRetData.status == "success"){
			 standardPost(successActionUrl,"");
		 }else{
			 if(submitRetData.code == "CODE_ERROR"){
				 $("#smsCode").val("");
				 fromError("短信验证码错误" );
			 }else{
				 error();
			 }
		 }
		
		
	}
	
	
	//表单验证器
	$('#applyForm')
		  .form({
		    fields: {
		    	imgCode: {
		        identifier: 'imgCode',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '请输入图片验证码'
		          }
		        ]
		      },
		      contactName: {
			        identifier: 'object.contactName',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '联系人名字不能为空'
			          }
			        ]
			      }, 
			  contactTel: {
				        identifier: 'object.contactTel',
				        rules: [
				          {
				            type   : 'exactLength[11]',
				            prompt : '联系电话格式有误'
				          }
				        ]
				   },  
				   smsCode: {
				        identifier: 'smsCode',
				        rules: [
				          {
				            type   : 'empty',
				            prompt : '短信验证码有误'
				          }
				        ]
				   } 
				   ,  
				   payType: {
				        identifier: 'object.payType',
				        rules: [
				          {
				            type   : 'checked',
				            prompt : '请选择支付方式'
				          }
				        ]
				   } ,
				   hasRead: {
				        identifier: 'hasRead',
				        rules: [
				          {
				            type   : 'checked',
				            prompt : '请阅读服务条款'
				          }
				        ]
				   }
		      
				   
				   
				   
				   
		    }
		  })
		;
</script>
 		
