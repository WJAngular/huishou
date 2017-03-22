<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/layout/header.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/TouchSlide/TouchSlide.1.1.source.js"></script>
<style type="text/css">
	.selectBrand{
		    background-color: white !important;
    		color: red !important;
    		border-left: 3px solid red;
	}
</style>

<!-- 头部 Start ================================ -->
<div class="ui fixed top menu secondary  " style="background-color: #00B5AD;padding: 8px;">
	   <a onclick="to_page('/')" style="width: 10%;padding: 0.78571429em 0.92857143em;"><i class="reply icon"></i></a>
	    <div id="clazzBtn" class="browse  item  visible " style="width: 40%;">
				 <c:forEach items="${clazzBrand }" var="clazz"  varStatus="s">  
		  	  		   		<c:if test="${ ( clazz.id == object.clazzId) || ( (empty object.clazzId )  && (s.index == 0)  )    }">
		  	  		   			 ${clazz.name }
		  	  		   		</c:if>
					</c:forEach>
			<i class="dropdown icon"></i>
	    </div>
	    <div  style=" width: 50%; ">
				  <div class="ui  icon input fluid 	">
	        		<input type="text" placeholder="搜索你想要卖的型号" value="" id="name">
	        		<i class="search link icon" onclick="searchProduct()"></i>
	 			</div>
	    </div>
	</div><!-- 头部 Start ================================ -->
	
	
	  <div class="ui  icon input fluid" >
	        		<input type="text" placeholder="搜索你想要卖的型号">
	        		<i class="search link icon"></i>
	 </div>
	
	
	<div class="ui grid">
	
		
		<div class="row">
		
		<div class="column sixteen wide">
		
			<div class="ui  sidebar  vertical menu  visible inverted teal"  style=" z-index: 1;width:7rem;margin: 4em 0em 0em 0em !important;">
			   		
			   		
			   		 <c:forEach items="${clazzBrand }" var="clazz"  varStatus="s">  
		  	  		   		<c:if test="${ ( clazz.id == object.clazzId) || ( (empty object.clazzId )  && (s.index == 0)  )    }">
		  	  		   			 <c:forEach items="${clazz.brand }" var="brand" varStatus="b">
								    <div class="item  ${object.brandId ==  brand.id ? 'selectBrand' : ''}" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }&brandId=${brand.id }')">
									  <p><b>${brand.name }</b></p>
									</div>
						    	</c:forEach>
		  	  		   		</c:if>
					</c:forEach>
								  <div class="item" > </div>	
					
			</div>
			
				<div class="ui middle aligned divided list" style="font-size: 1rem;margin-top: 1.6rem;margin-left: 90px;">
				    <c:forEach items="${objectPage }" var="object">
						    <div class="item" style="padding: 0.92857143em 1.14285714em;" onclick="product(${object.id })">
							    <div class="content">
							      <a class="header" >${object.name }</a>
							    </div>
							  </div>
				  
					</c:forEach>
				</div>
				
				
				
		</div>
		
<!-- 		<div class="column twelve wide"> -->
	    	
	
<!-- 		</div> -->
	</div>
	
	</div>
	
	
		
		
		<div class="ui top demo sidebar ui segment overlay " id="clazzSideBar" 
			style="height: 100% !important;height: 100% !important;background-color: rgba(0, 0, 0, 0.6);color: white;">
			  <div class="ui center aligned  grid three column padded">
			    <div class="one column row">
			      <div class="sixteen wide column">
			        <h3 class="ui header"></h3>
			      </div>
			    </div>
			    	<div class="three column divided row ">
						 <c:forEach items="${clazzBrand }" var="clazz" varStatus="s">  
					  				<c:if test="${fn:contains(clazz.name,'手机')  }">
					  					<div class="column center aligned" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >
					  						<img src="<%=request.getContextPath()%>/images/m/clazz/tel.png" class="ui small image centered">
					  					  	<p>${clazz.name}</p>	
					  					 </div>
					  				</c:if>
					  				<c:if test="${fn:contains(clazz.name,'平板')  }">
					  				<div class="column center aligned" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >
					  					<img src="<%=request.getContextPath()%>/images/m/clazz/pad.png" class="ui small image centered">
					  					  <p>${clazz.name}</p>	
					  					  </div>
					  				</c:if>
					 	</c:forEach>
						<div class="column center aligned" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >
						        <img src="<%=request.getContextPath()%>/images/m/clazz/laptop.png" class="ui small image centered">
						        <p>笔记本回收</p>
						</div>
			
					</div>
					
		<div class="three column divided row ">
		
		    <c:forEach items="${clazzBrand }" var="clazz" varStatus="s">  
		  				<c:if test="${fn:contains(clazz.name,'单反')  }">
		  				<div class="column center aligned" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >
		  					<img src="<%=request.getContextPath()%>/images/m/clazz/glass.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
		  				<c:if test="${fn:contains(clazz.name,'手表')  }">
		  				<div class="column center aligned" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >
		  					<img src="<%=request.getContextPath()%>/images/m/clazz/game.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
				      <c:if test="${fn:contains(clazz.name,'相机')  }">
				      <div class="column center aligned" onclick="to_page('${actionUrl}1?clazzId=${clazz.id }')" >
		  					<img src="<%=request.getContextPath()%>/images/m/clazz/camer.png" class="ui small image centered">
		  					  <p>${clazz.name}</p>	
		  					  </div>
		  				</c:if>
		 	</c:forEach>
		 
		</div>
			    
			    <div class=" row"></div><div class=" row"></div><div class=" row"></div>
			     <div class="one column row">
			      <div class="sixteen wide column">
			        <h1 class="ui header" onclick="hideClazzSideBar()"><i class="angle double up icon teal"></i></h1>
			      </div>
			    </div>
			    
			    
			  </div>
		</div>

<script>

	this.clazzActionUrl = "/clazz"
	
	function searchProduct(){
		var name = $("#name").val();
		var actionParams = {"name":name};
		standardPost(clazzActionUrl,actionParams)	;
	}
	
	this.productActionUrl = "/trade/product"
		
	function product(id){
		var actionParams = {"id":id};
		standardPost(productActionUrl,actionParams)	;
	}
	
	function hideClazzSideBar(){
		$('#clazzSideBar')
		  .sidebar('hide');
		;
		
	}
		$("#clazzBtn").on("click",function(){
			$('#clazzSideBar')
			  .sidebar('show');
			;
		})
		
</script>
 		
