<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">

	//自适应框框
// 	$('#addOrUpdateLargeModal').modal('refresh');

	$('.ui.clazzBrand.dropdown').dropdown();
	
	
	$('.ui.package.dropdown')
	  .dropdown({
	    action: 'hide',
	    onChange: function(value, text, $selectedItem) {
	    	console.log(value+":"+text)
	    	$('.ui.package.dropdown').dropdown("set selected",value);
	    	$("#combinPriceDivMain").html("");
	    	div_tpl_num = 0;
	    	div_field_tpl_num = 0;
	    }
	  })
	;
		
	
	var div_tpl_num = 0
	var div_field_tpl_num = 0
	
	
	function ItemObject(i1Id,i2Id,i3Id){
		this.i1Id = i1Id;
		this.i2Id = i2Id;
		this.i3Id = i3Id;
	}	
	
	function PriceObject(price,items){
		this.price = price;
		this.items = items;
	}
	
	function isRepeat(arrayObject){
		
		for(var i = 0;i<arrayObject.length;i++){
			for(var j = i + 1;j<arrayObject.length;j++){
				if( arrayObject[i] == arrayObject[j]){
					return true;
				}
			}
		}
		return false;
	}
	
	var addOrUpdate = "${addOrUpdate}";

	$(document).ready(function(){
		
		
		//更新的时候,解析组合条件框
		if(addOrUpdate == 'update'){
			
			var arrayPriceObj = 	eval('(${object.basePriceCombine} )');
			
			
			var packageId = '${object.prdPackageId}';
			//填充组合条件选择框
 			var actionParamArray = {"id":packageId};
 			var packageItm = actionPost(queryPackageItemByPackageIdActiveUrl,actionParamArray)
			console.log("query packageItem finish")
			
			
	 		for(var p in arrayPriceObj){
	 			var priceObject = arrayPriceObj[p];
	 			
	 			//组合框
	 			
	 			var tem = $("#combinPriceDiv_tpl").clone(true).html();
	 			var id = div_tpl_num+1;
	 			tem = tem.replace(/@id/g,id);		
	 			tem = tem.replace("@value",priceObject.price);
	 			$("#combinPriceDivMain").append(tem);
	 			div_tpl_num = div_tpl_num + 1;
	 			
	 			//组合选项
	 			var itemObject = priceObject.items;
	 			for(var i in itemObject){
	 				var packageItem_tpl = "";
		 			for(var p in packageItm){
		 				packageItem_tpl = packageItem_tpl + "<div class='item' data-value='"+packageItm[p].i1Id+"_"+packageItm[p].i2Id+"_"+packageItm[p].i3Id+"'  ><span class='description'>"+packageItm[p].i3Name+"</span>"+
		 													"</div>";
		 			}
		 			var tem = $("#combinPriceDivFiled_tpl").clone(true).html();
		 			tem = tem.replace("@{packageItem_tpl}",packageItem_tpl);
		 			tem = tem.replace(/@fieldid/g,div_field_tpl_num+1);	
		 			tem = tem.replace("@value",itemObject[i].i1Id+"_"+itemObject[i].i2Id+"_"+itemObject[i].i3Id);
		 			div_field_tpl_num = div_field_tpl_num + 1;

		 			$("#combinPriceInline"+id).prepend(tem);
		 			
		 			$('.ui._field.dropdown').dropdown();
		 			
	 			}
	 			
	  		}
			
 			
		}
		
		//初始化图片
		uploadImage();
		
	});
	
	

	
	//保存
	$("#saveBtn").on("click",function(){
		
		
		
		if(!$('#editForm').form("validate form")){
			return;
		}
		
		
		//解析组合价格
		var arrayPriceObj = new Array();
		for(var i = 1; i < div_tpl_num+1 ; i ++){
			
			//获取组合框的价格
			var priceValue = $("#combinPriceDiv"+i+" [name=combinPrice]").val()
			if(priceValue == null || priceValue == ''){
				$("#editForm").form('add errors', { error: "组合价格不能为空" });
				return;
			}
			
			//获取组合框的组合项
			var arrayItemObj = new Array();
			var combineNotValid = false;
			$("#combinPriceDiv"+i+" [name=combineItem]").each(function(){
				if($(this).val() == null || $(this).val() ==""){
					$("#editForm").form('add errors', { error: "组合条件不能为空" });
					combineNotValid = true;
					return false;
				}
				var itemValue = $(this).val().split( "_" );  
 				var itemObject = new ItemObject(itemValue[0],itemValue[1],itemValue[2]);
 				arrayItemObj.push(itemObject);
	 		})
	 		
	 		if(combineNotValid){
	 			return;
	 		}
			var priceObject = new PriceObject(priceValue,arrayItemObj)
			arrayPriceObj.push(priceObject);
		}
		var basePriceCombine = JSON.stringify(arrayPriceObj);
		
		
		
		
		
		//解析类别和品牌
		console.log("类别品牌ID："+$("#clazzBrand").val())
		var clazzId = $("#clazzBrand").val().split( "_" )[0];  
		var brandId = $("#clazzBrand").val().split( "_" )[1]; 
		
		
		
		//新增提交的参数
		var paramArray = $('#editForm').serializeArray();
		paramArray.push({
		    "name": "object.clazzId",
		    "value": clazzId
		});
		paramArray.push({
		    "name": "object.brandId",
		    "value": brandId
		});
		paramArray.push({
		    "name": "object.basePriceCombine",
		    "value": basePriceCombine
		});
		
		
		//打印需要提交的东西
		 $.each(paramArray, function(i, field){
			 console.log("提交:"+field.name + ":" + field.value + " ");
		});
		
		
		if(addOrUpdate == 'update'){
			submitForm(updateActionUrl,paramArray,'','editForm','addOrUpdateLargeModal');
		}
		else if (addOrUpdate == 'add'){
			submitForm(addActionUrl,paramArray,actionUrl,'editForm','addOrUpdateLargeModal');
		}
	});

	
	//表单验证器
	$('#editForm')
		  .form({
		    fields: {
		    name: {
		        identifier: 'object.name',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '产品名称不能为空'
		          },
		          {
			            type   : 'minLength[2]',
			            prompt : '产品名称不能少于{ruleValue}位'
			      }
		        ]
		      },
		  	basePrice: {
		        identifier: 'object.basePrice',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '基础价格不能为空'
		          },
		          {
			            type   : 'integer',
			            prompt : '基础价格必须为整数'
			      },
		        ]
		      },
		  	limitPrice: {
		        identifier: 'object.limitPrice',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '最低价格不能为空'
		          },
		          {
			            type   : 'integer',
			            prompt : '最低价格必须为整数'
			      },
		        ]
		      },  
		   clazzBrand: {
		        identifier: 'clazzBrand',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '请选择类别品牌'
		          }
		        ]
		      },
		      prdPackageId: {
		        identifier: 'object.prdPackageId',
		        rules: [
		          {
		            type   : 'empty',
		            prompt : '描述包不能为空'
		          }
		        ]
		      },
		      imgUrl: {
			        identifier: 'object.imgUrl',
			        rules: [
			          {
			            type   : 'empty',
			            prompt : '图片不能为空'
			          }
			        ]
			      }     
			      
		    }
		  })
		;
	
	
	
	
	//新增组合框
	var packageItm = "";
	function addNewCombinPriceDiv(){
		
		//判断是否有选择描述包
		var packageId = $("#prdPackage").val();
		if(packageId == '' || packageId == null){
			$("#editForm").form('add errors', { error: "请先选择描述包" });
			return;
		}
		
		//根据描述包ID查询对应的描述包选项
		var actionParamArray = {"id":packageId};
		packageItm = actionPost(queryPackageItemByPackageIdActiveUrl,actionParamArray)
		$(".ui.error.message").html("")
		if(packageItm == null || packageItm == ""){
			$("#editForm").form('add errors', { error: "该描述包无任何选项" });
			return;
		}
		
		var tem = $("#combinPriceDiv_tpl").clone(true).html();
		tem = tem.replace(/@id/g,div_tpl_num+1);	
		tem = tem.replace("@value","");
		$("#combinPriceDivMain").append(tem);
		div_tpl_num = div_tpl_num + 1;
		
		//自适应框框
		$('#addOrUpdateLargeModal').modal('refresh');
		
	}
	
	//新增组合条件
	function addNewCombinPriceDivField(id){
		
		//控制最多只能添加3个条件
		if($("#combinPriceInline"+id+" .field" ).length >10){
			return;
		}
		
		//获取当前选择的描述包ID
		var packageId = $("#prdPackage").val();
		var actionParamArray = {"id":packageId};
		var packageItm = actionPost(queryPackageItemByPackageIdActiveUrl,actionParamArray)
			
		var packageItem_tpl = "";
		for(var p in packageItm){
			packageItem_tpl = packageItem_tpl + "<div class='item' data-value='"+packageItm[p].i1Id+"_"+packageItm[p].i2Id+"_"+packageItm[p].i3Id+"'  ><span class='description'>"+packageItm[p].i3Name+"</span>"+
// 												"<span class='text'> "+packageItm[p].i2Name+"</span>"+
												"</div>";
		}
		
		var tem = $("#combinPriceDivFiled_tpl").clone(true).html();
		tem = tem.replace("@{packageItem_tpl}",packageItem_tpl);
		tem = tem.replace(/@fieldid/g,div_field_tpl_num+1);	
		tem = tem.replace("@value","");
		div_field_tpl_num = div_field_tpl_num + 1;


		$("#combinPriceInline"+id).prepend(tem);
		
		
		$('.ui._field.dropdown').dropdown();
		
		//自适应框框
		$('#addOrUpdateLargeModal').modal('refresh');
	}
	
	//删除组合框
	function deleteCombinPriceDiv(id){
		$("#combinPriceDiv"+id).remove();
		div_tpl_num = div_tpl_num -1;
	}
	
	//删除组合条件
	function deleteCombinPriceDivField(id){
		$(".combinPriceDivField"+id).remove();
	}
	
	
	function uploadImage(){
		$("#imageObject").attr('src',$("#imageSrc").val());
		//自适应框框
		$('#addOrUpdateLargeModal').modal('refresh');
	}
	
</script>

		<div class="header">
		    	<c:if test="${addOrUpdate == 'update' }">
		    		更新产品
		    	</c:if>
		    	<c:if test="${addOrUpdate != 'update' }">
		    		新增产品
		    	</c:if>
		  </div>
		  <div class=" content">
		  	<div  class="ui raised segment teal clearing">
			<form class=" ui form" id="editForm" >
				<input value="${object.id }" type="hidden" name="object.id">
					   
					    <div class=" inline field ">
					      <label>产品名称</label>
					      <input placeholder="产品名称" type="text" name="object.name" value="${object.name }"  >
					    </div>
					    
					    <div class=" inline field ">
					      <label>基础价格</label>
					      <input maxlength="8"  type="text" name="object.basePrice" value="${object.basePrice }"  >
					    </div>
					    
					    <div class=" inline field ">
					      <label>最低控制价格</label>
					      <input maxlength="8"  type="text" name="object.limitPrice" value="${object.limitPrice }"  >
					    </div>
					    
					     <div class=" inline field ">
					      <label>回收最高价格</label>
					      <input maxlength="8"  type="text" name="object.recycleMaxMoney" value="${object.recycleMaxMoney }"  >
					    </div>
					    
					     <div class=" inline field ">
					      <label>历史回收次数</label>
					      <input maxlength="8"  type="text" name="object.hasRecycleQuantity" value="${object.hasRecycleQuantity }"  >
					    </div>
					    
					     <div class=" inline field">
					       <label>类别品牌</label>
							<div class="ui clazzBrand floating labeled icon dropdown button " tabindex="0">
								
								 <c:if test="${addOrUpdate == 'update'}">
								 	<input type="hidden"  id="clazzBrand" name="clazzBrand"   value=${object.clazzId}_${object.brandId} >	
								 </c:if>
								 <c:if test="${addOrUpdate != 'update'}">
								 	<input type="hidden"  id="clazzBrand" name="clazzBrand"    >
								 </c:if>
								 
								 
						    
						        <i class="dropdown icon"></i>
						        <span class="text">请选择</span>
						        <div class="menu transition hidden" tabindex="-1">
						          <c:forEach items="${clazzBrand }" var="clazz">
							          <div class="item" >
							            <i class="dropdown icon"></i>
							            <span class="text">${clazz.name }</span>
							            <div class="right menu transition hidden">
							            	  <c:forEach items="${clazz.brand }" var="brand">
								              <div class="item" data-value="${clazz.id }_${brand.id }" data-text="${brand.name }">
								              	${brand.name }
								              </div>
							            	</c:forEach>
							            </div>
							          </div>
						          </c:forEach>
						        </div>
						      </div>
					    </div>
				    
				    	<div class="inline field">
				    		 <label>描述包</label>
				    		<div class="ui package floating dropdown labeled icon button">
				    		 <input type="hidden" id="prdPackage" name="object.prdPackageId" value="${object.prdPackageId }">
							  <i class="dropdown icon"></i>
							  <span class="text">请选择</span>
							  <div class="menu">
							    <div class="ui icon search input">
							      <i class="search icon"></i>
							      <input type="text" placeholder="查询...">
							    </div>
							    <div class="divider"></div>
							    <div class="header">
							      <i class="tags icon"></i>
							      	描述包名称
							    </div>
							    <div class="scrolling menu">
							    	<c:forEach items="${prdPackage }" var="prdPackage">
								      <div class="item" data-value="${prdPackage.id }" data-text="${prdPackage.name }">
								         ${ prdPackage.name}
								      </div>
							      	</c:forEach>
							    </div>
							  </div>
							</div>
				    	</div>
				    	
				    	<div class="inline field">
				    		<label>组合定基础价格</label>
				    		<div class="ui button" onclick="addNewCombinPriceDiv()">新增组合</div>
				    	</div>
			 	
			 			<div id="combinPriceDivMain" class="ui raised segment teal" style="margin-bottom: 20px">
				 			
			 			</div>
			 			
			 			
				    	<div class="inline fields">
				    		<label>产品图片</label>
				    		<div class="field twelve wide">
				    		 	<input placeholder="网络地址" type="text" name="object.imgUrl" value="${object.imgUrl}"  id="imageSrc">
				    		 </div>
				    		 <div class="ui button" onclick="uploadImage()">上传</div>
				    	</div>
			 			<div class="inline fields">
			 				<label>确认图片</label>
				    		<img alt="" src="" id="imageObject" class="ui image small ">
				    	</div>
			 			
			 			<div class="inline field">
			 				<div class="ui toggle checkbox">
							  <input id="isHot" type="checkbox" name="object.isHot"   value="Y" ${object.isHot == 'Y' ? 'checked' :'' }>
							  <label>是否热门产品</label>
							</div>
				    	</div>
				    	
			 			
			 			
			 	<div class="ui error message"></div>
			 	<div class="ui blue button right floated big" id="saveBtn">保存</div>
			</form>
			</div>
		  </div>
		  <div class="actions">
		    <div class="ui black deny button">
		     	取消
		    </div>
		  </div>
		  
		  
		  
		  	<!-- 模板 -->
		  	<div id="combinPriceDiv_tpl" style="display: none">
			  	<div   id="combinPriceDiv@id">
		 			<div class="inline fields" id="combinPriceInline@id">
		 				<div class="field two wide"><input maxlength="8" placeholder="组合价格" type="text"  name="combinPrice" value="@value"></div>
						<div class="field"><div class="ui circular  icon blue button mini" onclick="addNewCombinPriceDivField(@id)"><i class="plus icon"></i></div></div>
						<div class="field"><div class="ui circular  icon red button mini" onclick="deleteCombinPriceDiv(@id)"><i class="remove icon"></i></div></div>
		 			</div>
		 				<h2 class="ui dividing header" style="    margin-bottom: 10px;margin-top: -10px;"></h2>
				</div>
			</div>
			<!-- 模板 -->		
				 			
				 			
		  	<!-- 模板 -->
		  	<div id="combinPriceDivFiled_tpl" style="display: none">
	 				<div class="field combinPriceDivField@fieldid" >
						<div class="ui _field mini floating labeled icon dropdown button fluid">
							 <input type="hidden" name="combineItem" value="@value">
							 <i class="dropdown icon"></i>
							  <span class="text">  请选择</span>
							  <div class="menu">
							    <div class="header">
							       从下面选择
							    </div>
							    <div class="divider"></div>
							    	@{packageItem_tpl}
							  </div>
						</div>
					</div>
					<div class="field combinPriceDivField@fieldid">
							<i class="remove icon" onclick="deleteCombinPriceDivField(@fieldid)"></i>
					</div>
	 		</div>
		  <!-- 模板 -->
		  