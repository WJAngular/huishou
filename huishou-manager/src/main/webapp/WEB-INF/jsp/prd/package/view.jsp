<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<%=request.getContextPath()%>/js/checkbox.js"></script>

		<div class="ui   ">
		<!-- main -->
		<div class="ui grid  internally celled  ">
			<!-- 头部导航 -->
			<div class="row">
				<div class="column">
					<div class="ui mini breadcrumb">
					  <a class="section">首页</a>
					  <i class="right chevron icon divider"></i>
					  <a class="section">产品模块</a>
					  <i class="right chevron icon divider"></i>
					  <div class="active section">描述包管理</div>
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
							
							<div class=" six wide field">
								<form class=" ui form" id="searchForm" >
									<div class="ui action input">
									  <input type="text" placeholder="请输入描述包名称....." name="object.name" value="${object.name}">
									  <div class="ui  button " onclick="search()">搜索</div>
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
								<th >账号</th>
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
										<td>${ object.name}</td>
										<td>${ object.createTime}</td>
										<td >
											<div class="ui mini icon buttons">
											 
											  <button class="ui pink basic button " onclick="openUpdateModal('${object.id}')">
											  	<i class="configure icon"></i>编辑
											  </button>
											   <button class="ui teal basic button " onclick="copy('${object.id}')">
											  	<i class="configure icon"></i>复制
											  </button>
											   <button class="ui blue basic button " onclick="to_page('/prdPackageItem?packageId=${object.id}')">
											  	<i class="configure icon"></i>编辑描述项
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
								
								<th colspan="9">
					     			<jsp:include page="/common/pagination.jsp"></jsp:include>
						     	</th>
						     	
						    </tr>
						  </tfoot>
					</table>
				</div>
			</div><!-- 表格内容 -->
			
			
		

		</div><!-- main -->
		

</div>

<script type="text/javascript">

	var actionUrl = "${actionUrl}";
	this.deleteActionUrl = actionUrl + "delete";
	this.toUpdateActionUrl = actionUrl + "toUpdate";
	this.updateActionUrl = actionUrl + "update";
	this.toAddActionUrl = actionUrl + "toAdd";
	this.addActionUrl = actionUrl + "add";
	this.copyActionUrl = actionUrl + "copy";
	
	
	function copy(id){
		var actionParamArray = {"id":id}
		var retData = actionPost_(copyActionUrl,actionParamArray);
		
		if(retData.status == "success"){
			to_page(actionUrl);
		}else{
			alert("复制出错！");	
		}
	}
	
	
</script>
