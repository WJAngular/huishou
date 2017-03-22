<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/topmenu.jsp"></jsp:include>
<jsp:include page="layout/search.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>


	
	<div class="ui grid container">
		<div class="row">
			<div class="column">
				<div class="ui small breadcrumb">
				  <a class="section" href="<%=request.getContextPath()%>/">首页</a>
				  <i class="right chevron icon divider"></i>
				  <a class="section">二手产品回收</a>
				  <i class="right chevron icon divider"></i>
				  <div class="active section">手机回收</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<!-- 分类 -->
			<div class="three wide column">
				<div class="ui secondary vertical pointing menu">
				  <a class=" item ">全部 </a>
				  <c:forEach items="${clazzBrand }" var="clazz"  varStatus="s">  
				  	<a class="item ${  (object.clazzId  == clazz.id) || ( (empty object.clazzId )  && (s.index == 0) )  ? 'active' : '' }"
				  	   onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >${clazz.name }</a>
				  </c:forEach>
				</div>
			</div><!-- 分类 -->
			
			<!-- 内容 --> 
			<div class="thirteen wide column">
					<div class="ui grid">
						<!--  品牌 热门 -->
						<div class="row">
							<div class="column">
								 <div class="ui  raised   ">
								    <div class="ui center aligned segment teal inverted ">
								      <p>品牌</p>
								    </div>
								    <div class="ui  ">
								     	  <div class="ui internally celled grid center aligned">
											  	  <div class="sixteen wide column">
											  	  		  <div class="ui internally  grid   ">
											  	  		  
											  	  		   <c:forEach items="${clazzBrand }" var="clazz"  varStatus="s">  
											  	  		   		<c:if test="${ ( clazz.id == object.clazzId) || ( (empty object.clazzId )  && (s.index == 0)  )    }">
											  	  		   			 <c:forEach items="${clazz.brand }" var="brand" varStatus="b">
											  	  		   			 
																	    <div class=" two wide column">
																	      	 <a class="ui  basic  circular button ${object.brandId ==  brand.id ? 'red' : 'teal'}" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }&brandId=${brand.id }')">${brand.name }</a>
																	    </div>
																	    
															    	</c:forEach>
											  	  		   		</c:if>
															</c:forEach>
															
															
												  		</div>
											  	  </div>
												</div>
								    </div>
								    <div class="ui segment">
								    	<a class="ui red ribbon label">热门</a>
								    	<c:forEach items="${hotProduct}" var="product" end="15">
								    		<a class="clazzitem" onclick="product(${product.id })">${product.name }</a>
								    	</c:forEach>
								    </div>
								    
								    <div class="ui green message">如果你对机器型号有点老,在回收列表找不到,说明他的价值很低,请进行环保回收.<a onclick="to_page('/other/bigrecycle/view.jsp')"> 点击回收</a>
								    	或者你可以咨询我们的客服QQ，电话，我们会及时给你报价！
								    </div>
								  </div>
							</div>
						</div><!--  品牌 热门 -->
						
						<!--  型号 -->
						<div class="row">
							<div class="column">
								<div class="ui six stackable cards link">
								  <c:forEach items="${objectPage.getList() }" var="object">
									  <div class="card" onclick="product(${object.id })">
									    <div class="image">
									      <img src="${object.imgUrl }" alt="${object.name }">
									    </div>
									    <div style="text-align: center;margin-bottom: 15px">
								      		<p>${object.name }</p>
					   					</div>
									  </div>
								</c:forEach>
								</div>
							</div>
						</div><!-- 型号 -->
						
						<!--  分页-->
						<div class="row">
							<div class="column">
								<jsp:include page="layout/pagination.jsp"></jsp:include>
							</div>
						</div><!--  分页-->
						
					</div>
			</div><!-- 内容 -->
			
			
		</div>
	</div>



<script type="text/javascript">

	this.productActionUrl = "/trade/product"
	
	function product(id){
		var actionParams = {"id":id};
		standardPost(productActionUrl,actionParams)	;
	}
	
</script>


<jsp:include page="layout/footer.jsp"></jsp:include>