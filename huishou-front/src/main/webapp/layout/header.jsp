<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Standard Meta -->


    
     <title>${title }</title>
    <meta name="keywords" content="${keywords }"/>
    <meta name="description" content="${description}"/> 
    
    
    <meta charset="utf-8"/>
    <meta name="baidu-site-verification" content="uWMOGrak5D" />
    <meta name="360-site-verification" content="a0e2045163c2bf8a2ca8cf8a86f210f4" />
   <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <link href="/favicon.ico" mce_href="/favicon.ico" rel="bookmark" type="image/x-icon" />
    <link href="/favicon.ico" mce_href="/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="/favicon.ico" mce_href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />





<!-- Site Properities -->
<meta name="generator" content="DocPad v6.78.5" />

<link rel="stylesheet" type="text/css" class="ui" href="<%=request.getContextPath()%>/semantic/semantic.css?ss">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/docs.css">
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/semantic/semantic.js"></script>
<script src="<%=request.getContextPath()%>/semantic/highlight.min.js"></script>
<script src="<%=request.getContextPath()%>/semantic/docs.js"></script>
<script src="<%=request.getContextPath()%>/semantic/menu.js"></script>
<script src="<%=request.getContextPath()%>/semantic/less.min.js"></script>
<script src="<%=request.getContextPath()%>/js/shape.js"></script>
<script type="text/javascript">

	this.CONTEXT_PATH = '<%=request.getContextPath()%>';	
	this.path = CONTEXT_PATH;

	$('.shape').shape("height ","next");	  
	
	
	
	
	
	function next(){
		$('.shape').shape('flip up');
	}
	
	function to_page(url,data){
		url = url+(url.indexOf("?") == -1?'?':'&')+'rand='+Math.random();
		location.href=CONTEXT_PATH +url;
		if (window.event) window.event.returnValue = false;
	
	}
	
	function error(){
		to_page("/500.jsp");
	}
	
	//提交的公共方法
	function actionPost(actionUrl,actionParamArray){
		var retData;
		jQuery.ajax({
			type:'post',
			async: false, 
			url : CONTEXT_PATH + actionUrl,
			data: actionParamArray,
			success : function(data) {
				retData = data;
// 	    		data.status == "success"
			}
		});
		return retData;
	}
	
	
	
	//通过jq用表单方式提交以及跳转页面
	function standardPost(url,args) 
    {
        var form = $("<form method='post'></form>");
        form.attr({"action":CONTEXT_PATH +url });
        //HTML标准规定如果form表单没有被添加到document里，那么form表单提交将会被终止。
        //在Chrome56之前的版本是不符合标准的，Chrome56修复了这个问题，让form表单提交符合标准要求：
        //解决方法
		//解决方法就是把form表单添加到document后再提交:
        $(document.body).append(form);
        
        
        for (arg in args)
        {
            var input = $("<input type='hidden'>");
            input.attr({"name":arg});
            input.val(args[arg]);
            form.append(input);
        }
        form.submit();
    }
	
	
	$(document).ready(function(){
		$('#context1 .menu .item')
		  .tab({
		    context: $('#context1')
		  })
		;
		
		$('.ui.accordion')
		  .accordion()
		;
		
	})
	
</script>

<!-- 百度统计 -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?3b3ecddbcb6a8d597533fdcd20f71e0d";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>



<style type="text/css">
	.ui.steps .icon {
		color: #00B5AD
	}
	
	.clazzcontent{
		    margin-top: 12px;
    margin-bottom: 12px;
    margin-left: 10px;
     font-size: 12px;
    
	}
	.clazzheader{
	color: #00B5AD;
		 margin-right: 20px;
   		 font-size: 16px;
	}
	.clazzitem{
	color: #00B5AD;
		margin-right: 20px;
	}
	.clazzmore{
	
	}
	
	
</style>
</head>
<body id="example" class="main ui ">


    
    