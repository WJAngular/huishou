<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/TouchSlide/TouchSlide.1.1.source.js"></script>
<style type="text/css">
	
	
</style>




<!-- 头部 Start ================================ -->
	<div class="ui fixed top menu secondary  " style="background-color: #00B5AD">
	   <a class="item"><i class="reply icon"></i></a>
	    <div class="browse item active visible" id="clazzBtn">
				     Browse
    			<i class="dropdown icon"></i>
				     
	    </div>
	</div><!-- 头部 Start ================================ -->
	
	

	
<!-- 	<div class="ui grid"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="column"> -->
<!-- 				 <div class="ui  icon input fluid"> -->
<!-- 	        		<input type="text" placeholder="搜索你想要卖的型号"> -->
<!-- 	        		<i class="search link icon"></i> -->
<!-- 	 			</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
	
	<div class="ui grid">
	
		<div class="row">
			<div class="column">
				 <div class="ui  icon input fluid">
	        		<input type="text" placeholder="搜索你想要卖的型号">
	        		<i class="search link icon"></i>
	 			</div>
			</div>
		</div>
		
		
		<div class="row">
		
		<div class="column">
		
		<div class="ui  sidebar  vertical menu  visible"  style="    z-index: 1;margin: 5.4em 0em 0em 0em !important;width: 7rem;">
		   		<div class="item">
				  <p ><b> 苹果11</b>
				  </p>
				</div>
					<div class="item">
				  <p ><b> 苹果2</b></p>
				</div>	<div class="item">
				  <p ><b> 苹果3</b></p>
				</div>	
		</div>
	
		  <div class=" pusher    " id="page" style="    margin: -1.8em 0em 0em 6em !important;position: fixed;width: 100%;">
	    		<div class="ui middle aligned divided list" style="font-size: 1rem;">
				  <div class="item" style="padding: 0.92857143em 1.14285714em;">
				    <div class="content">
				      <a class="header" >Daniel Louise</a>
				      
				      
				    </div>
				  </div>
				   <div class="item" style="padding: 0.92857143em 1.14285714em;">
				    <div class="content">
				      <a class="header">Stevie Feliciano</a>
				    </div>
				  </div>
				    <div class="item" style="padding: 0.92857143em 1.14285714em;">
				    <div class="content">
				      <a class="header">Elliot Fu</a>
				    </div>
				  </div>
				</div>
	 	 </div>
	
	</div>
	</div></div>
	
	
		
		
		<div class="ui top demo sidebar ui segment overlay " id="clazzSideBar">
  <div class="ui center aligned page grid">
    <div class="one column row">
      <div class="sixteen wide column">
        <h3 class="ui header">New Content Awaits</h3>
      </div>
    </div>
    <div class="three column divided row">
      <div class="column">
        <img class="ui wireframe image" src="/images/wireframe/media-paragraph.png">
      </div>
      <div class="column">
        <img class="ui wireframe image" src="/images/wireframe/media-paragraph.png">
      </div>
      <div class="column">
        <img class="ui wireframe image" src="/images/wireframe/media-paragraph.png">
      </div>
    </div>
  </div>
</div>



	
      
      
<script>

		$("#clazzBtn").on("click",function(){
			$('#clazzSideBar')
			  .sidebar('show');
			;
		})
		
</script>
 		
