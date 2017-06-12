<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="<%=request.getContextPath()%>/js/checkbox.js"></script>


		<!-- main -->
		<div class="ui grid  internally celled  ">
			<!-- 头部导航 -->
			<div class="row">
				<div class="column">
					<div class="ui mini breadcrumb">
					  <a class="section">首页</a>
					  <i class="right chevron icon divider"></i>
					  <a class="section">其他模块</a>
					  <i class="right chevron icon divider"></i>
					  <div class="active section">评价信息管理</div>
					</div>
				</div>
			</div><!-- 头部导航 -->
			
			
			<!-- 查询框 -->
			<div class="row">
				<div class=" column">
					
					<div class=" ui form" >
						<div class="fields">
						
							<div class="field">
<!-- 								<a id="addBtn" class="ui teal basic button" onclick="openAddLargeModal()"><i class="add user icon"></i> -->
<!-- 									新增 -->
<!-- 								</a> -->
							</div>
							
							<div class=" twelve wide field">
								<form class=" ui form" id="searchForm" >
									<div class="two fields">
								       <div class="field">
								        <label>满意度</label>
								         <select class="ui dropdown" name="object.score">
											  <option value="">请选择</option>
											  <option value="1" ${object.score == '1' ? 'selected':'' }>好评</option>
											  <option value="2" ${object.score == '2' ? 'selected':'' }>中评</option>
											  <option value="3" ${object.score == '3' ? 'selected':'' }>差评</option>
									 	</select>
								      </div>
							      	   <div class="field">
									        <label>产品名称</label>
									        <input type="text" name="object.prdProductName" placeholder="产品名称" value="${object.prdProductName }">
									   </div>
							      	   <div class="field">
									        <label>用户</label>
									        <input type="text" name="object.userName" placeholder="手机号码" value="${object.userName }">
									   </div>
										<div class="field">
											<label>&nbsp;</label>
								      	  <div class="ui  button " onclick="search()">搜索</div>
								      	</div>
								    </div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 查询框 -->
			
			
			
			<!-- 表格内容 -->
			<div class="row">
				<div class="column">
					<table class="ui  green very compact table selectable small">
						<thead>
							<tr>
								<th width="4%">    <div class="ui fitted slider checkbox all">
										          <input type="checkbox">
										           <label></label>
										 </div></th>
								<th width="6%">序号</th>		        
								<th width="10%">用户</th>
								<th width="10%">产品名称</th>
								<th width="6%">满意度</th>
								<th width="8%">城市</th>
								<th width="10%">地址</th>
								<th width="20%">评价心得</th>
								<th width="13%">创建时间</th>
								<th width="6%">操作 </th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${objectPage.getList() }" var="object">
									<tr  id="tr${object.id}" ><!-- ondblclick="openUpdateLargeModal('${object.id}')" -->
										 <td class="collapsing">
									        <div class="ui fitted slider checkbox single" data-method="${object.id}">
										          <input type="checkbox" data-method="${object.id}"> <label></label>
										        </div>
										</td>
										<td>${ object.id}</td>
										<td>${ object.userName }</td>
										<td>${ object.prdProductName}</td>
										<td>${ object.score == '3' ? '差评' : (object.score == '2'? '中评':'好评') }</td>
										<td>${ object.recycleTradeAddressCity}</td>
										<td>${ object.recycleTradeAddress}</td>
										<td>${ object.content}</td>
										<td><fmt:formatDate value="${ object.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td >
											<div class="ui mini icon buttons">
<%-- 											  <button class="ui blue basic button " onclick="openUpdateLargeModal('${object.id}')"> --%>
<!-- 											  	<i class="configure icon"></i>编辑 -->
<!-- 											  </button> -->
											  <button class="ui red basic button " onclick="deleteById('${object.id}')">
											  	<i class="remove user icon"></i>删除
											  </button>
											</div>
										</td>
									</tr>
							</c:forEach>
						</tbody>
						 <tfoot class="full-width">
						    <tr>
						    
						    	<!-- 删除所有 -->
							     <th colspan="1">
							        <div class="circular ui basic icon red button tiny" onclick="deleteAll()"> 
							        	<i class="remove  circle icon"></i>
							        </div>
							      </th> 
								<!--删除所有 -->
								
								<th colspan="9">
					     			<jsp:include page="/common/pagination.jsp"></jsp:include>
						     	</th>
						     	
						    </tr>
						  </tfoot>
					</table>
				</div>
			</div><!-- 表格内容 -->
			
		</div><!-- main -->


				
				
<script type="text/javascript">

	var actionUrl = "${actionUrl}";
	this.deleteActionUrl = actionUrl + "delete";
	this.toUpdateActionUrl = actionUrl + "toUpdate";
	this.updateActionUrl = actionUrl + "update";
	this.toAddActionUrl = actionUrl + "toAdd";
	this.addActionUrl = actionUrl + "add";
	
</script>
