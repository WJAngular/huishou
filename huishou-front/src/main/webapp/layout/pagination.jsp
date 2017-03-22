<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 当前页 -->
<c:set var="currentPage" value="${objectPage.pageNumber}"></c:set>
<c:set var="totalPage" value="${objectPage.totalPage}"></c:set>

<c:set var="startPage" value="${ currentPage - 4}"></c:set>
<c:if test="${startPage < 1 }">
	<c:set var="startPage" value="1"></c:set>
</c:if>


<c:set var="endPage" value="${ currentPage + 4}"></c:set>
<c:if test="${endPage > totalPage }">
	<c:set var="endPage" value="${ totalPage}"></c:set>
</c:if>

<c:if test="${currentPage <= 8 }">
	<c:set var="startPage" value="1"></c:set>
</c:if>

<c:if test="${ (totalPage - currentPage) <8 }">
	<c:set var="endPage" value="${totalPage }"></c:set>
</c:if>


 <!-- 分页条 -->
<div class="ui stackable">
	
							
    <div class="ui right floated pagination menu tiny" style="margin-bottom: 10px">
    
		<!-- 上一页 -->    
		<c:if test="${ currentPage == 1 }">
			  <a class="icon item disabled">
			  	<i class="left chevron icon disabled"></i>
		      </a>
		</c:if>
		<c:if test="${ currentPage != 1 }">
			  <a class="icon item" onclick="to_page('${actionUrl}${currentPage - 1}${actionParas}')">  
		        <i class="left chevron icon"></i>
		      </a>
		</c:if><!-- 上一页 -->
		
		
		<c:if test="${ currentPage > 8 }">
			   <a class="item"  onclick="to_page('${actionUrl}${1}${actionParas}')">${1}</a>    
			   <a class="item"  onclick="to_page('${actionUrl}${2}${actionParas}')">${2}</a>
			   <a class="item">...</a>
		</c:if>
		
		
		<c:forEach begin="${ startPage}" end="${ endPage}" var="i">
			<c:if test="${ currentPage == i }">
				 <a class="item disabled">${i}</a>
			</c:if>
			<c:if test="${ currentPage != i }">
				 <a class="item"  onclick="to_page('${actionUrl}${i}${actionParas}')">${i}</a>   
			</c:if>
		</c:forEach>
		
		
		<c:if test="${ (totalPage - currentPage) >= 8 }">
			   <a class="item">...</a>
			   <a class="item" onclick="to_page('${actionUrl}${totalPage - 1}${actionParas}')">${totalPage - 1}</a>
			   <a class="item" onclick="to_page('${actionUrl}${totalPage}${actionParas}')"  >${totalPage}</a>
		</c:if>
		
		
		<!-- 下一页 -->    
		<c:if test="${ currentPage == totalPage }">
			  <a class="icon item disabled">
			  	<i class="right chevron icon disabled"></i>
		      </a>
		</c:if>
		<c:if test="${ currentPage != totalPage }">
			  <a class="icon item"   onclick="to_page('${actionUrl}${currentPage + 1}${actionParas}')">
		        <i class="right chevron icon"></i>
		      </a>
		</c:if><!-- 下一页 -->
		
    </div>
</div><!-- 分页条 -->
