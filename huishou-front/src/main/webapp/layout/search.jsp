<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	
	<!-- LOGO 导航条 -->
	<div class="ui grid ">
		<div class="left floated left aligned six wide column" style="margin-left: 2.5%">
			<h3 class="ui  image header">
				<img src="<%=request.getContextPath()%>/image/logo.png" class="ui  image" style="width: 220px" onclick="to_page('/')">
				<div class="content" style="color: gray;">手机回收一站式平台</div>
			</h3>

		</div>

		<div class="right floated right aligned six wide column">
			<div class="ui big icon input fluid" style="color:#00B5AD ">
				<input type="text" placeholder="请输入产品型号" id="name"  value="${object.name }" style="  border: 2px solid #00B5AD ;"> 
				<i class="inverted circular search link icon teal" onclick="searchProduct()"></i>
			</div>
		</div>
	</div><!-- LOGO 查询框-->

	
<script type="text/javascript">

	this.clazzActionUrl = "/clazz"
	
	function searchProduct(){
		var name = $("#name").val();
		var actionParams = {"name":name};
		standardPost(clazzActionUrl,actionParams)	;
	}
	
</script>
