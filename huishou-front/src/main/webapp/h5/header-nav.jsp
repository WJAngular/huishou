<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- 头部 Start ================================ -->
	<div class="ui fixed top menu secondary  inverted  teal">
	
		<c:if test="${param.noback == 'true' }">
			<a onclick="to_page('/')" 
		</c:if>
	     <c:if test="${param.noback != 'true' }">
			<a onclick="javascript:window.history.back(-1);" 
		</c:if>
	    	  style=" padding: 0.78571429em 0.92857143em; margin: 0em 0.35714286em;z-index: 100"  >
	    	  <i class="reply icon" ></i>
	    </a>
	    <div style="text-align: center;width: 80%;position: inherit;padding: 0.78571429em 0.92857143em;">
	    	${param.title }
	    </div>
	</div><!-- 头部 Start ================================ -->


<script>

</script>