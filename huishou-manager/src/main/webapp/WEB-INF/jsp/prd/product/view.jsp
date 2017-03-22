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
					  <a class="section">产品模块</a>
					  <i class="right chevron icon divider"></i>
					  <div class="active section">产品管理</div>
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
									
									
									<div class="three fields">
								       <div class="field">
								        <label>类别</label>
								         <select class="ui dropdown" name="object.clazzId">
											  <option value="">请选择</option>
											   <c:forEach items="${ clazzBrand}" var="clazz">
											   	 	<option value="${clazz.id }"  ${object.clazzId ==  clazz.id ? 'selected':''}>
											   	 		${clazz.name }
											   	 	</option>
												</c:forEach>	
									 	</select>
								      </div>
								      
								      
								      
								         <div class="  field">
										       <label>类别品牌</label>
												<div class="ui clazzBrand floating labeled icon dropdown button " tabindex="0">
													<input type="hidden"   name="object.brandId"    value="${object.brandId }">
											        <i class="dropdown icon"></i>
											        <span class="text">请选择</span>
											        <div class="menu transition hidden" tabindex="-1">
											        
											           
												          
											          <c:forEach items="${clazzBrand }" var="clazz">
												          <div class="item" >
												            <i class="dropdown icon"></i>
												            <span class="text">${clazz.name }</span>
												            <div class="right menu transition hidden">
															              <div class="item" data-value="" data-text="全部">
															              	全部
															              </div>
												            
												            	  <c:forEach items="${clazz.brand }" var="brand">
													              <div class="item" data-value="${brand.id }" data-text="${brand.name }">
													              	${brand.name }
													              </div>
												            	</c:forEach>
												            </div>
												          </div>
											          </c:forEach>
											        </div>
											      </div>
										    </div>
					    
					    
					    
								      	 <div class="field">
								      	  <label>是否热门</label>
									        <select class="ui dropdown" name="object.isHot">
												  <option value="">请选择</option>
												  <option value="Y" ${object.isHot ==  'Y' ? 'selected':''}>是</option>
												  <option value="N" ${object.isHot ==  'N' ? 'selected':''}>否</option>
										 	</select>
								      	</div>
								      
								   
								      
								    </div>
									
									<div class="three fields">
										
										 <div class="field">
									        <label>产品名称</label>
									        <input type="text" name="object.name" placeholder="产品名称" value="${object.name }">
									     </div>
										
										    <div class="field">
								        <label>描述包</label>
								         <select class="ui dropdown" name="object.prdPackageId">
											  <option value="">请选择</option>
											   <c:forEach items="${ prdPackage}" var="prdPackage">
											   	 	<option value="${prdPackage.id }"  ${object.prdPackageId ==  prdPackage.id ? 'selected':''}>
											   	 		${prdPackage.name }
											   	 	</option>
												</c:forEach>	
									 	</select>
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
								<th>品牌</th>
								<th>描述包名称</th>
								<th>产品名称</th>
								<th>是否热门</th>
								<th>基本价格</th>
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
										<td>${ object.clazzName}</td>
										<td>${ object.brandName}</td>
										<td>${ object.packageName}</td>
										<td>${ object.name}</td>
										<td>${ object.isHot == 'Y' ? '是' : '否' }</td>
										<td>
											<div class="ui input" id="basePriceDiv${object.id}">
												<input   id="basePriceInput${object.id}" style="width: 100px" value="${ object.basePrice}" onchange="onValueChange('${object.id}','basePriceInput${object.id}','basePriceDiv${object.id}')"  onkeyup="this.value=this.value.replace(/\D/g,'')"/>
											</div>	
										</td>
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


	$('.ui.clazzBrand.dropdown').dropdown();


	var actionUrl = "${actionUrl}";
	this.deleteActionUrl = actionUrl + "delete";
	this.toUpdateActionUrl = actionUrl + "toUpdate";
	this.updateActionUrl = actionUrl + "update";
	this.toAddActionUrl = actionUrl + "toAdd";
	this.addActionUrl = actionUrl + "add";
	this.queryPackageItemByPackageIdActiveUrl = actionUrl + "queryPackageItemByPackageId";
	this.updateBasePriceActionUrl = actionUrl + "updateBasePrice";
	
	
	function onValueChange(id,inputObjectId,inputDivObjectId){
		var basePrice = $("#"+inputObjectId).val();
		var actionParamArray = {"id":id,"basePrice":basePrice};
		console.log("id:"+id+"  basePirce:"+basePrice)
		
		$("#"+inputDivObjectId).addClass("icon").addClass("loading")
		$("#"+inputDivObjectId).append("<i class='search icon input"+id+"'></i>")
		$("#"+inputObjectId).attr("disabled", "disabled");
		
		var retData = actionPost_(updateBasePriceActionUrl,actionParamArray)
		if( retData.status == 'success'){
			
		}else{
			
		}
		
		setTimeout(function () {
			$("#"+inputDivObjectId).removeClass("icon").removeClass("loading")
			$(".input"+id).remove()
			$("#"+inputObjectId).removeAttr("disabled");
		}, 300);
		
	}
	
	
	
	
	
	
</script>
