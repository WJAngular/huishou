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


<link rel="stylesheet" type="text/css" class="ui" href="<%=request.getContextPath()%>/semantic/semantic.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/docs.css">
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/util.js"></script>
<script src="<%=request.getContextPath()%>/semantic/semantic.js"></script>
<script src="<%=request.getContextPath()%>/semantic/highlight.min.js"></script>
<script src="<%=request.getContextPath()%>/semantic/docs.js"></script>
<script src="<%=request.getContextPath()%>/semantic/less.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/ueditor/ueditor.config.js"></script>
<script src="<%=request.getContextPath()%>/lib/ueditor/ueditor.all.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">
// $('.ui.selection.dropdown').dropdown();
// $('.ui.menu .ui.dropdown').dropdown({
//   on: 'hover'
// });

	$(document).ready(function(){
	
	});

</script>

</head>
<body   >
  
  
<!-- 	    <div class="ui  sidebar inverted vertical menu visible "> -->
	    <div class="ui  sidebar  vertical menu visible ">
	   		<div class="item">
			  <a class="ui logo icon image" >
			    <img src="<%=request.getContextPath()%>/images/logo.png" class="ui image small">
			  </a>
			  <p ><b> 安特回收管理后台</b></p>
			</div>
			<a class="item" >
			  <b>欢迎你: ${sysAdmin.username }
			  </b>
			</a>
			<a class="item" onclick="logout()">
			  <b>角色:${sysAdmin.type == '1' ? '操作员' : '加盟商' }  点击退出</b>
			</a>
				
				<c:if test="${sysAdmin.type == '1' }">
					<div class="item">
					  <div class=" header">系统模块</div>
					  <div class="menu">
					      <a class="item" onclick="to_page('/sysAdmin','1')">操作员-加盟商</a>
					      <a class="item" onclick="to_page('/sysParam','1')">参数管理</a>
					  </div>
					</div>
				</c:if>
				<c:if test="${sysAdmin.type == '1' }">
					<div class="item">
					  <div class=" header">产品模块</div>
					  <div class="menu">
					      <a class="item" onclick="to_page('/prdClazzBrand','1')">品牌类别管理</a>
					      <a class="item" onclick="to_page('/prdProduct','1')">产品管理</a>
					      <a class="item" onclick="to_page('/prdPackage','1')">描述包管理</a>
					  </div>
					</div>
				</c:if>
				
				<div class="item">
				  <div class=" header">订单模块</div>
				  <div class="menu">
				      <a class="item" onclick="to_page('/orderInfo','1')">回收单管理</a>
				  </div>
				</div>
				
				<c:if test="${sysAdmin.type == '1' }">
					<div class="item">
					  <div class=" header">用户模块</div>
					  <div class="menu">
					      <a class="item" onclick="to_page('/user','1')">用户管理</a>
					  </div>
					</div>
				</c:if>
				
				<c:if test="${sysAdmin.type == '1' }">
					<div class="item">
					  <div class=" header">其他模块</div>
					  <div class="menu">
					  	  <a class="item" onclick="to_page('/otherJoin','1')">代理商申请</a>
					      <a class="item" onclick="to_page('/otherNewProduct','1')">新型号管理</a>
					      <a class="item" onclick="to_page('/otherBigRecycle','1')">量大回收管理</a>
					      <a class="item" onclick="to_page('/newsInfo','1')">新闻管理</a>
					      <a class="item" onclick="to_page('/linkInfo','1')">友情链接管理</a>
					      <a class="item" onclick="to_page('/commentInfo','1')">评价信息管理</a>
					  </div>
					</div>
				</c:if>
	  </div>
	  
	  
	  
	  
	  <div class=" pusher    " id="page" style="margin-left: 210px;">
	  </div>
  
  
  
	
	<!-- 删除界面 -->
	<div class="ui modal small delete" id="deleteModal">
		  <div class="header">删除</div>
		  <div class="content">
		    <p>是否确认删除？</p>
		  </div>
		   <div class="actions">
		    <div class="ui approve button">确认</div>
		    <div class="ui cancel button">取消</div>
		  </div>
	</div><!-- 删除界面 -->
		
		
		
	<!-- 编辑模块-->
	<div class="ui  long modal" id="addOrUpdateModal" style="position:absolute; height:800px;overflow:auto">
	</div><!-- 编辑模块-->
	
	<!-- 编辑模块-->
	<div class="ui  long large modal" id="addOrUpdateLargeModal" style="position:absolute; height:800px;overflow:auto">
	</div><!-- 编辑模块-->
	
	<!-- 编辑模块 -->
	<div class="ui  long large modal" id="addOrUpdateLargeModalUeditor" style="position:absolute; height:800px;overflow:auto">
	</div><!-- 编辑模块 -->
	
<div class="ui demo page dimmer">
    <div class="ui text loader">正在加载中</div>
  <p></p>
  <p></p>
</div>
		
		
				
</body>

	


<script type="text/javascript">


	this.CONTEXT_PATH = '<%=request.getContextPath()%>';	
	this.path = CONTEXT_PATH;
	
	//退出
	var logoutActionUrl = "/system/logout";
	function logout(){
		standardPost(this.logoutActionUrl,"");
	}
	
	//清空模态框内容
	function emptyModal(){
		$('#addOrUpdateLargeModal').html("");
		$('#addOrUpdateModal').html("");
		$('#addOrUpdateLargeModalUeditor').html("");
	}
	
	//弹出窗口-更新
	function openUpdateModal(id){
		var data = {"id" : id};
		emptyModal();
		load_page("addOrUpdateModal",toUpdateActionUrl,data);
// 		$('#addOrUpdateModal').modal({blurring: true}) .modal('show');
		$('#addOrUpdateModal') .modal('show');
	}

	//弹出窗口-新增
	function openAddModal(){
		emptyModal();
		load_page("addOrUpdateModal",toAddActionUrl);
// 		$('#addOrUpdateModal').modal({blurring: true}) .modal('show');
		$('#addOrUpdateModal') .modal('show');
		//自适应框框
	}
	
	//弹出大窗口-更新
	function openUpdateLargeModal(id){
		var data = {"id" : id};
		emptyModal();
		load_page("addOrUpdateLargeModal",toUpdateActionUrl,data);
// 		$('#addOrUpdateLargeModal').modal({blurring: true}) .modal('show');
		$('#addOrUpdateLargeModal') .modal('show');
		
	}

	//弹出大窗口-新增
	function openAddLargeModal(){
		emptyModal();
		load_page("addOrUpdateLargeModal",toAddActionUrl);
// 		$('#addOrUpdateLargeModal').modal({blurring: true}) .modal('show');
		$('#addOrUpdateLargeModal') .modal('show');
		//自适应框框
	}
	
	//弹出大窗口-更新 ueditor
	function openUpdateLargeModalUeditor(id){
		var data = {"id" : id};
		emptyModal();
		load_page("addOrUpdateLargeModalUeditor",toUpdateActionUrl,data);
// 		$('#addOrUpdateLargeModal').modal({blurring: true}) .modal('show');
		$('#addOrUpdateLargeModalUeditor').modal('show');
		
	}

	//弹出大窗口-新增 ueditor
	function openAddLargeModalUeditor(){
		emptyModal();
		load_page("addOrUpdateLargeModalUeditor",toAddActionUrl);
// 		$('#addOrUpdateLargeModal').modal({blurring: true}) .modal('show');
		$('#addOrUpdateLargeModalUeditor') .modal('show');
		//自适应框框
	}
	
	//查询
	function search(){
		var paramArray = $('#searchForm').serializeArray();
		to_page(actionUrl,paramArray)
	}
	
	
	//删除单个
	function deleteById(id){
		var dropIds = new Array();  
		dropIds.push(id)
		_delete(dropIds)
	}
	
	//批量删除
	function deleteAll(){
		var dropIds = new Array();  
		$(".single.checkbox.checked").each(function(){
			 dropIds.push($(this).data('method'))
		});
		_delete(dropIds)
	}
	
	//删除操作
	function _delete(dropIds){
		if(dropIds.length <= 0) return;
		$('#deleteModal')
		  .modal({
		    closable  : false,
		    onDeny    : function(){
		      
		    },
		    onApprove : function() {
		    	deleteActionUrl = deleteActionUrl+(deleteActionUrl.indexOf("?") == -1?'?':'&')+'rand='+Math.random();
		    	jQuery.ajax({
					type:'post',
					url : CONTEXT_PATH + deleteActionUrl,
					data: {
						ids:dropIds
					},
					success : function(data) {
			    		if(data.status == "success")
			    		{
			    			if(dropIds.length >= 10) {
			    				to_page(searchActionUrl)
			    			}else{
			    				$(dropIds).each(function(index){
				    			    $("#tr"+this).remove();
				    			});
			    			}
			    		}else if(data.status == "error"){
			    			 alert(data.message); 
			    		}
					}
				});
		    }
		  })
		  .modal('show')
		;
	}
	
	to_page('/newsInfo')
	</script>






</html>