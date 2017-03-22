<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="/favicon.ico" mce_href="/favicon.ico" rel="bookmark" type="image/x-icon" />
    <link href="/favicon.ico" mce_href="/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="/favicon.ico" mce_href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    
    
<!-- Site Properities -->
<meta name="generator" content="DocPad v6.78.5" />
<title>安特回收管理后台</title>


<link rel="stylesheet" type="text/css" class="ui" href="semantic/semantic.css">
<script src="js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/util.js"></script>
<script src="semantic/semantic.js"></script>
<style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    
    .column {
      max-width: 450px;
    }
  </style>


</head>
<body style="
    /* height: auto; */
    font-size: 14px;
    background: url(images/bg.jpg) center 0px;
    background-attachment: fixed;
    background-size: cover;
">

<div class="ui middle aligned center aligned grid ">
<!-- <div class="two column ui grid celled "> -->
  <div class=" column four wide" style="background: url(images/bg_main.png) repeat;border-radius: .5em;-webkit-border-radius: .5em;padding: 10px;">
    <h2 class="ui teal image header" style=" margin-top: 20px;">
      <div class="content">
        	登录安特回收管理后台
      </div>
    </h2>
    <form class="ui  form" id="editForm">
    	<div class="ui error message "></div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="username" placeholder="请输入账号" value="admin1">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="请输入密码" value="123456">
          </div>
        </div>
        <div class="field">
        	<div class="ui  icon input">
        		<input type="text"  placeholder="输入验证码" id="code" name="code">
        		<img id="codeImg" src="<%=request.getContextPath()%>/system/randomCode" class="ui image" onclick="javascript:this.src='<%=request.getContextPath()%>/system/randomCode?' + new Date().getTime();">
        	</div>
        </div>
        
          <div class="field">
        	<a class="ui fluid large teal button" onclick="login()" id="loginBtn" type="button">登录</a>
		  </div>

    </form>




    <div class="ui message">
      	此处登录操作员或者加盟商
    </div>
  </div>
</div>






</body>
</html>

	
<script type="text/javascript">


	var actionUrl = "/system/login";
	this.CONTEXT_PATH = '<%=request.getContextPath()%>';	
	this.path = CONTEXT_PATH;

	
		
	function login(){
		console.log("login_")
		if($("input[name=username]").val() == ''){
			$("#editForm").form('add errors', { error: "请输入账号" });
			return;
		}
		if($("input[name=password]").val() == ''){
			$("#editForm").form('add errors', { error: "请输入密码" });
			return;
		}
		if($("input[name=code]").val() == ''){
			$("#editForm").form('add errors', { error: "请输入验证码" });
			return;
		}
		
		$("#loginBtn").attr("disabled", "disabled");
		$("#loginBtn").text("登录中....");
		var paramArray = $('#editForm').serializeArray();
		console.log("to:"+CONTEXT_PATH + actionUrl)
		jQuery.ajax({
			type:'post',
			url : CONTEXT_PATH + actionUrl,
			data: paramArray,
			success : function(retData) {
				
				console.log("back:"+retData.status+":"+retData.message)
				$("#loginBtn").removeAttr("disabled");
				$("#loginBtn").text("登录");
				if(retData.status == "success"){
			  		location.href=CONTEXT_PATH;
			  	}
			  	else{
			  		if(retData.message == "CODE_ERROR"){
			  			$("#editForm").form('add errors', { error: "验证码错误" });
			  			 $("#codeImg").click();
						  $("#code").val("");
			  		}
			  		else if(retData.message == "LOCK"){
			  			$("#editForm").form('add errors', { error: "该账号被锁" });
			  		}
			  		else if(retData.message == "LOGIN_FAILD"){
			  			$("#editForm").form('add errors', { error: "账号密码错误" });
			  		}else{
			  			$("#editForm").form('add errors', { error: "登录异常，请刷新页面" });
			  		}
			  		
			  	}
	    			
			}
		});
		
	};

	
		
	
</script>