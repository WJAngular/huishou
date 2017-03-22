<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="ui middle aligned center aligned grid " style="margin-top: 100px">

	<div class="row">
			<div class="column">
				<h3 class="ui  image header">
					<img src="<%=request.getContextPath()%>/image/logo.png" class="ui  image" style="width: 220px" onclick="to_page('/')">
					<div class="content" style="color: gray;">手机回收一站式平台</div>
				</h3>
			</div>
	</div>

	<div class="row">
		<div class="column">
			<h3>404  你所访问的页面不存在，请<a onclick="to_page('/')">点击</a>回家</h3>
		</div>
	</div>
</div>