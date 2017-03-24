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
					  <div class="active section">新闻管理</div>
					</div>
				</div>
			</div><!-- 头部导航 -->
			
			
			<!-- 查询框 -->
			<div class="row">
				<div class=" column">
					
					<div class=" ui form" >
						<div class="fields">
						
							<div class="field">
								<a id="addBtn" class="ui teal basic button" onclick="openAddLargeModal()"><i class="add user icon"></i>
									新增
								</a>
							</div>
							
							<div class=" twelve wide field">
								<form class=" ui form" id="searchForm" >
									<div class="two fields">
								       <div class="field">
								        <label>类别</label>
								         <select class="ui dropdown" name="object.type">
											  <option value="">请选择</option>
											  <option value="1" ${object.type == '1' ? 'selected':'' }>内部新闻</option>
											  <option value="2" ${object.type == '2' ? 'selected':'' }>外部新闻</option>
									 	</select>
								      </div>
							      	  <div class="field">
								      	  <label>是否有效</label>
									        <select class="ui dropdown" name="object.status">
												  <option value="">请选择</option>
												  <option value="Y" ${object.status ==  'Y' ? 'selected':''}>是</option>
												  <option value="N" ${object.status ==  'N' ? 'selected':''}>否</option>
										 	</select>
								      	</div>
								    </div>
									
									<div class="two fields">
										
										 <div class="field">
									        <label>新闻标题</label>
									        <input type="text" name="object.title" placeholder="新闻标题" value="${object.title }">
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
								<th>    <div class="ui fitted slider checkbox all">
										          <input type="checkbox">
										           <label></label>
										 </div></th>
								<th>序号</th>		        
								<th>类别</th>
								<th>标题</th>
								<th>是否有效</th>
								<th>创建时间</th>
								<th>操作 </th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${objectPage.getList() }" var="object">
									<tr  id="tr${object.id}"  ondblclick="openUpdateLargeModal('${object.id}')">
										 <td class="collapsing">
									        <div class="ui fitted slider checkbox single" data-method="${object.id}">
										          <input type="checkbox" data-method="${object.id}"> <label></label>
										        </div>
										</td>
										<td>${ object.id}</td>
										<td>${ object.type == '1' ? '内部新闻' : '外部新闻' }</td>
										<td>${ object.title}</td>
										<td>${ object.status == 'Y' ? '是' : '否' }</td>
										<td>${ object.createTime}</td>
										<td >
											<div class="ui mini icon buttons">
											  <button class="ui blue basic button " onclick="openUpdateLargeModal('${object.id}')">
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
