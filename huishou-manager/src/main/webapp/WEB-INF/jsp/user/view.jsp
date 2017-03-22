<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<%=request.getContextPath()%>/js/checkbox.js"></script>

		<!-- main -->
		<div class="ui grid  internally celled  ">
			<!-- 头部导航 -->
			<div class="row">
				<div class="column">
					<div class="ui mini breadcrumb">
					  <a class="section">首页</a>
					  <i class="right chevron icon divider"></i>
					  <a class="section">用户模块</a>
					  <i class="right chevron icon divider"></i>
					  <div class="active section">用户管理</div>
					</div>
				</div>
			</div><!-- 头部导航 -->
			
			
			<!-- 查询框 -->
			<div class="row">
				<div class=" column">
					
					<div class=" ui form" >
							<div class="fields">
							<div class="field">
								<button id="addBtn" class="ui teal basic button" onclick="openAddModal()"><i class="add user icon"></i>
									新增
								</button>
							</div>
							</div>
							
							<div class=" twelve wide field">
								<form class=" ui form" id="searchForm" >
								
									 <div class="five fields">
									      <div class="field">
									      	  <label>账号</label>
									        <input type="text" name="object.username" placeholder="账号" value="${object.username }">
									      </div>
								     
								      <div class="field">
								      	  <label>状态</label>
									        <select class="ui dropdown" name="object.status">
									        		 <option value="">请选择</option>
												  <option value="1" ${object.status ==  '1' ? 'selected':''}>有效</option>
												  <option value="2" ${object.status ==  '2' ? 'selected':''}>无效</option>
										 	</select>
								      	</div>
						    				
						    		  <div class="field">
						    		  	<label>  &nbsp; </label>
								      	  <div class="ui  button " onclick="search()">搜索</div>
								      </div>
								    </div>
								      
								    
								</form>
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
								<th>    <div class="ui fitted slider checkbox all">
										          <input type="checkbox">
										           <label></label>
										 </div></th>
								<th>序号</th>		        
								<th >账号</th>
								<th >状态</th>
								<th >创建时间</th>
								<th >操作 </th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${objectPage.getList() }" var="object">
									<tr  id="tr${object.id}"  ondblclick="openUpdateModal('${object.id}')">
										 <td class="collapsing">
									        <div class="ui fitted slider checkbox single" data-method="${object.id}">
										          <input type="checkbox" data-method="${object.id}"> <label></label>
										        </div>
										</td>
										<td>${ object.id}</td>
										<td>${ object.username}</td>
										<td>
											${ object.status == '1' ? '有效' : '无效'}
										</td>
										<td>${ object.createTime}</td>
										<td >
											<div class="ui mini icon buttons">
											  <button class="ui blue basic button " onclick="openUpdateModal('${object.id}')">
											  	<i class="configure icon"></i>编辑
											  </button>
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
							        <div class="circular basic ui icon red button tiny" onclick="deleteAll()"> 
							        	<i class="remove  circle icon"></i>
							        </div>
							      </th> 
								<!--删除所有 -->
								
								<th colspan="5">
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
