<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	
	<!-- 顶部菜单 -->
	<div class="ui tiny menu">
		<a class="item">深圳</a>
		<div class="right menu">
			
			<c:if test="${ empty user }">
				<a class="item" onclick="popLoginModal()">登陆</a> 
			</c:if>
			<c:if test="${not empty user }" >
				<a class="item" onclick="to_page('/user/home')">欢迎你: ${user.username }</a>
				<a class="item" onclick="logout()">退出</a> 
			</c:if>
			<a class="item" href="<%=request.getContextPath()%>/info/about/low.jsp">服务条款</a>
		</div>
	</div><!-- 顶部菜单 -->
	
	
	
    
	
	<div class="ui modal small" >
	  <i class="close icon"></i>
	  <div class="header">登陆订单中心</div>
	  <div class="content">
	  
	  		<div class="two column ui grid celled"> 
	  			<div class="eight wide column "> 
	  				    <form class="ui form mini" id="loginForm">
					      <div class="field" id="contactTelDiv">
					        <input type="text" id="tel" value="" name="tel" placeholder="输入提交订单的手机号">
					      </div>
						
					      <div class="field">
					     		<div class="ui mini icon input">
							    <input type="text" placeholder="请输入图片验证码" id="code" name="imgCode">
							    <img id="codeImg" src="<%=request.getContextPath()%>/system/randomCode" class="ui image" onclick="javascript:this.src='<%=request.getContextPath()%>/system/randomCode?' + new Date().getTime();">
							</div>
					      </div>
						      
					      <div class="field">
					        <div class="ui action input">
							  <input type="text" placeholder="输入短信验证码" name="smsCode" id="smsCode" value="">
							  <button class="ui button" id="sendMobileCodeBtn" onclick="validImageCode()" type="button">
									  		<a id="sendMobileCodeMsg">获取短信验证码</a>
							  </button>
							</div>
					      </div>
					      
					      <div class="ui error message"></div>
					      	
					       <div class="field">
							  <button class="ui button teal fluid " type="button" onclick="login()" id="loginBtn">登陆</button>
					      </div>
				    </form>
	  			</div>
	  			
	  			<div class="eight wide column center aligned"> 
	  				<img src="<%=request.getContextPath()%>/image/logo.png" class="ui  image"  style="margin-top: 30px">
	  			</div>
	  		</div>
	  		
	    
	  </div>
	</div>


	<script type="text/javascript">
	
	

	//验证图片验证码
	var validRandomCodeActionUrl = "/system/validRandomCode";
	//发送图片验证码
	var sendCodeActionUrl = "/system/sendCode"
	//登陆
	var loginActionUrl = "/system/login"
	//退出
	var logoutActionUrl = "/system/logout"
		
	//用户中心
	var userHomeActionUrl = "/user/home"
	
	
	
		$(document).ready(function(){
			
		})
		
		function logout(){
			standardPost(this.logoutActionUrl,"");
		}
	
		function login(){
		
			 if($("#smsCode").val() == ""){
				  fromError("请输入短信验证码!" );
			        return;
			    }
			
			 if($("#tel").val() == ""){
				 fromError("请输入手机号码!" );
			     return;
			 }
		  $("#loginBtn").attr("disabled", "disabled");
		  var actionParamArray = {"smsCode":$("#smsCode").val(),"tel":$("#tel").val()}
		  var retData = actionPost(this.loginActionUrl,actionParamArray);
		  if(retData.status == "success"){
			  to_page(userHomeActionUrl)
		  }
		  else{
			  fromError("短信验证码错误");
			  $("#loginBtn").removeAttr("disabled");
		  }
		
		}
		
		
		function popLoginModal(){
			
			$('.ui.modal').modal({
			    blurring: true
			  })
			  .modal('show')
			;
			$(".ui.error.message").html("");
// 			$("#tel").val("");
			$("#smsCode").val("");
			$("#code").val("");
	}
		
	function fromError(msg){
		$("#loginForm").form('add errors', { error: msg });
	}
	
		
		var delayTime = 60;
		var delayFlag = true;
		
		 //验证图形验证码
		function validImageCode(){
			 
			  if($("#code").val() == ""){
				  fromError("请输入图片验证码!" );
			        return;
			    }
			
			 if($("#tel").val() == ""){
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
		
		
		//发送短信验证码
		function sendMobileCode(){
			
			  if ($("#sendMobileCodeBtn").attr("disabled") || delayFlag == false) {
			        return;
			    }
			  
			  $("#sendMobileCodeBtn").attr("disabled", "disabled");
		      $("#sendMobileCodeMsg").html("60秒后重新获取");
		      $("#contactTelDiv").addClass("disabled");
		      setTimeout(countDown, 1000);
		        
			  
			  var sendCodeActionParamArray = {"mobile":$("#tel").val()}
			  var sendCodeRetData = actionPost(this.sendCodeActionUrl,sendCodeActionParamArray);
			  if(sendCodeRetData.status == "success"){
			  }else{
				  alert(sendCodeRetData.message);
			  }
			  
		}
		
		
		
	</script>