<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Standard Meta -->
    <title></title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/> 
    
    
    <meta charset=utf-8"utf-8"/>
    <meta name="baidu-site-verification" content="uWMOGrak5D" />
    <meta name="360-site-verification" content="a0e2045163c2bf8a2ca8cf8a86f210f4" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <link href="../../favicon.ico" tppabs="http://www.anthuishou.com/favicon.ico" mce_href="/favicon.ico" rel="bookmark" type="image/x-icon" />
    <link href="../../favicon.ico" tppabs="http://www.anthuishou.com/favicon.ico" mce_href="/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="../../favicon.ico" tppabs="http://www.anthuishou.com/favicon.ico" mce_href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />





<!-- Site Properities -->
<meta name="generator" content="DocPad v6.78.5" />

<link rel="stylesheet" type="text/css" class="ui" href="../../semantic/semantic.css-ss.css" tppabs="http://www.anthuishou.com/semantic/semantic.css?ss">
<link rel="stylesheet" type="text/css" href="../../semantic/docs.css" tppabs="http://www.anthuishou.com/semantic/docs.css">
<script src="../../js/jquery.min.js" tppabs="http://www.anthuishou.com/js/jquery.min.js"></script>
<script src="../../semantic/semantic.js" tppabs="http://www.anthuishou.com/semantic/semantic.js"></script>
<script src="../../semantic/highlight.min.js" tppabs="http://www.anthuishou.com/semantic/highlight.min.js"></script>
<script src="../../semantic/docs.js" tppabs="http://www.anthuishou.com/semantic/docs.js"></script>
<script src="../../semantic/menu.js" tppabs="http://www.anthuishou.com/semantic/menu.js"></script>
<script src="../../semantic/less.min.js" tppabs="http://www.anthuishou.com/semantic/less.min.js"></script>
<script src="../../js/shape.js" tppabs="http://www.anthuishou.com/js/shape.js"></script>
<script type="text/javascript">

	this.CONTEXT_PATH = '';	
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
		to_page("../../500.jsp.htm"/*tpa=http://www.anthuishou.com/500.jsp*/);
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
  hm.src = "../../../hm.baidu.com/hm.js-3b3ecddbcb6a8d597533fdcd20f71e0d"/*tpa=https://hm.baidu.com/hm.js?3b3ecddbcb6a8d597533fdcd20f71e0d*/;
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


    
    


	
	
	
	<!-- LOGO 导航条 -->
	<div class="ui grid ">
		<div class="left floated left aligned six wide column" style="margin-left: 2.5%">
			<h3 class="ui  image header">
				<img src="../../image/logo.png" tppabs="http://www.anthuishou.com/image/logo.png" class="ui  image" style="width: 220px" onclick="to_page('/')">
				<div class="content" style="color: gray;">手机回收一站式平台</div>
			</h3>

		</div>

		<div class="right floated right aligned six wide column">
			<div class="ui big icon input fluid" style="color:#00B5AD ">
				<input type="text" placeholder="请输入产品型号" id="name"  value="" style="  border: 2px solid #00B5AD ;"> 
				<i class="inverted circular search link icon teal" onclick="searchProduct()"></i>
			</div>
		</div>
	</div>
		
		
		
	<!-- LOGO 查询框-->

	
<script type="text/javascript">

	this.clazzActionUrl = "/clazz"
	
	function searchProduct(){
		var name = $("#name").val();
		var actionParams = {"name":name};
		standardPost(clazzActionUrl,actionParams)	;
	}
	
</script>



	
	
	<!-- 在线客服 -->
	<div id="kefu" style=" width: 80px;height: 230px;position: fixed;top: 70%;right: 20px;z-index: 1002;">
		<div class="ui grid">
				<div class=" column  ">
				  <button class="ui fluid  button blue large  "  onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=1552107066&site=qq&menu=yes')">
				  <i class="icon smile" style="font-size: 2.4em" ></i>
				  <br>
				 客服
				</button>
				</div>
		</div>
    </div>
    <!-- 在线客服 -->
	<!-- 导航条 -->
	<div class="ui secondary menu pointing massive" >
		  <a class="item " style="margin-left: 0px;" >
		  </a>
		  <a class="item " style="width: 209px;display: block;text-align: center;" onclick="to_page('/clazz')">
		    	旧机回收
		  </a>
		  <a class="item " style="margin-left: 100px;display: block;text-align: center;" onclick="to_page('../newproduct/view.jsp-curNav=newproduct.htm'/*tpa=http://www.anthuishou.com/other/newproduct/view.jsp?curNav=newproduct*/)">
		    	提交型号 
		  </a>
		  <a class="item "  style="margin-left: 100px;display: block;text-align: center;" onclick="to_page('../bigrecycle/view.jsp-curNav=bigrecycle.htm'/*tpa=http://www.anthuishou.com/other/bigrecycle/view.jsp?curNav=bigrecycle*/)">
		    	量大回收
		  </a>
		  <a class="item"  style="margin-left: 100px;display: block;text-align: center;" onclick="to_page('view.jsp-curNav=join.htm'/*tpa=http://www.anthuishou.com/other/join/view.jsp?curNav=join*/)">
		    	我要加盟
		  </a>
		 
		  <div class="right menu">
		    <a class="ui item">
		    </a>
		  </div>
	</div><!-- 导航条 -->


<div class="ui grid  " style="background-color: #F8F8F8; padding: 20px">
	
		<div class=" one wide column"></div>
		
		<div class=" fourteen wide column">
			<div class="ui raised segment">
				
             <div class="row">
			<h2 class="ui header">提交新产品</h2>
			<div class="ui label"><i class="user icon"></i> 小蚂蚁编辑 </div>
			<div class="ui label"><i class="calendar icon"></i> 2017-08-15 </div>
			
			</div>   
	<div class="ui divider"></div>
	
	<div class="ui container">		
  <img class="ui centered medium image" src="../../../www.lehuiso.com/file/images/20128162136328872500.jpg">
  <p>Te eum doming eirmod, nominati pertinacia argumentum ad his. Ex eam alia facete scriptorem, est autem aliquip detraxit at. Usu ocurreret referrentur at, cu epicurei appellantur vix. Cum ea laoreet recteque electram, eos choro alterum definiebas in. Vim dolorum definiebas an. Mei ex natum rebum iisque.</p>
  <img class="ui small right floated image" src="../../../www.lehuiso.com/file/images/20128162136328872500.jpg">
  <p>Audiam quaerendum eu sea, pro omittam definiebas ex. Te est latine definitiones. Quot wisi nulla ex duo. Vis sint solet expetenda ne, his te phaedrum referrentur consectetuer. Id vix fabulas oporteat, ei quo vide phaedrum, vim vivendum maiestatis in.</p>
   <p>Eu quo homero blandit intellegebat. Incorrupte consequuntur mei id. Mei ut facer dolores adolescens, no illum aperiri quo, usu odio brute at. Qui te porro electram, ea dico facete utroque quo. Populo quodsi te eam, wisi everti eos ex, eum elitr altera utamur at. Quodsi convenire mnesarchum eu per, quas minimum postulant per id.</p>
 
 
 </div>
 
 <div class="row">
  <div class="ui divider"></div>
<div class="ui large breadcrumb">

  <i class="caret left icon"></i>
  <a class="section">上一篇  帝国大厦跟上个撒个三国杀 ...</a>

</div>
 
<div class="ui large breadcrumb" style="float: right;">


  <a class="section">下一篇  jgjh发达发顺丰顺丰到付是f..jg</a>
  <i class="caret right icon"></i>
</div>	


			</div> 
	</div>

</div>
</div>
</style>


</body>
</html>