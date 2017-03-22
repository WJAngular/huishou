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
					  <a class="section">其他模块</a>
					  <i class="right chevron icon divider"></i>
					  <div class="active section">大量回收</div>
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
									 <div class="four fields">
									      <div class="field">
									      	  <label>公司名称</label>
									        <input type="text" name="object.company" placeholder="公司名称" value="${object.company }">
									      </div>
								        	<div class="field">
									      	  <label>联系人</label>
									        <input type="text" name="object.contact" placeholder="联系人" value="${object.contact }">
									      </div>
								     	<div class="field">
									      	  <label>联系电话</label>
									        <input type="text" name="object.tel" placeholder="联系电话" value="${object.tel }">
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
								<th >公司名称</th>
								<th >联系人</th>
								<th >联系电话</th>
								<th >备注</th>
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
										<td>${ object.company}</td>
										<td>
											${ object.contact}
										</td>
										<td>
											${ object.tel}
										</td>
										<td>
											${ object.remark}
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
							        <div class="circular ui basic icon red button tiny" onclick="deleteAll()"> 
							        	<i class="remove  circle icon"></i>
							        </div>
							      </th> 
								<!--删除所有 -->
								
								<th colspan="7">
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
