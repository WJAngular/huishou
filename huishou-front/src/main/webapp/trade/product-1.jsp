<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/search.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>


<div class="ui grid " style="background-color: #F8F8F8;padding: 20px">
		<div class="row">
			<div class="column">
				<div class="ui small breadcrumb">
				  <a class="section" onclick="to_page('/')">首页</a>
				  <i class="right chevron icon divider"></i>
				  <a class="section">二手产品回收</a>
				  <i class="right chevron icon divider"></i>
				  <div class="active section">${object.name } 回收</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 左边 -->
			<div class="four wide column">
					
					<div class="ui clearing segment">
						<p style="text-align: center;"><img src="${object.imgUrl }"></p>
						<p style="text-align: center;">${object.name }</p>
						<div class="ui  clearing segment" style="border: 0px;box-shadow: 0px 0px 0px 0px;">
						<h5 class="ui left floated header center aligned">${object.hasRecycleQuantity } <br> 历史回收次数 </h5>
						<h5 class="ui right floated header center aligned">   ${object.recycleMaxMoney }元 <br> 回收最高价格 </h5>
						</div>
						
						<p style="text-align: center;"><button class="ui teal  button" onclick="to_page('/clazz')">重选机型  &gt;</button></p>
						
						<div class="ui styled fluid accordion" style="border: 1px solid #00B5AD;">
						  <div class="title"><i class="dropdown icon"></i> 
						  		安全贴士 
						  		<br> 苹果手机只要恢复出厂设置，是无须担心数据泄露风险的，请放心回收。
						</div>
						  <div class="content">
						    <p class="transition hidden">
						    	1.苹果的磁盘是基于单个文件进行加密的，因此，在iPhone上所存储的每个文件都有单独随机生成的密钥进行加密。经过多层加密之后，文件才得以安全地存储在iPhone的磁盘上。
						    </p>
						     <p class="transition hidden">
						     	2.用户抹掉数据以及所有设置之后，就等于抹掉了所有文件的密钥。如果要想恢复数据，就需要破解逐层加密。因此通过iPhone官方提供的抹掉数据和设置后被恢复的可能几乎为零。
						     </p>
						     <p class="transition hidden">
						     	3.此前FBI也遇到了破解iPhone的难题。作为普通用户， iPhone的信息安全值得信赖。
						     </p>
						  </div>
						</div>
					</div>
			
			</div><!-- 左边 -->
			
			<!-- 右边 -->
			<div class="twelve wide column">
					<div class="ui clearing segment" style="padding: 30px">
						
						<c:forEach items="${packageItem }" var="packageItem1">
							
							<h2 class="ui dividing header">${packageItem1.name}<a class="anchor" id="types"></a></h2>
							<c:forEach items="${packageItem1.packageItem }" var="packageItem2" varStatus="s">
								<div  class="${packageItem2.selOpt == 'single' ? 'item2div' : '' }   ui clearing teal segment" style="margin-bottom: 30px   ;display:none">
									<p>${packageItem2.name }</p>
									<div class="ui grid three column">
										<c:forEach items="${packageItem2.packageItem }" var="packageItem3">
											<div class="column"><button value="${packageItem3.id}" id="${packageItem3.id}itemBtn" class="${packageItem2.id }items ui toggle button  basic fluid" onclick="choose('${packageItem3.id}','${packageItem2.id }','${packageItem2.selOpt}')">${packageItem3.name }</button></div>
										</c:forEach>
									</div>	
								</div>
							</c:forEach>
						</c:forEach>
						
						
						<h2 class="ui dividing header" style=" margin-top: 40px;"></h2>
						
						<div id="itemDescDiv">
							<c:forEach items="${packageItem }" var="packageItem1">
								<c:forEach items="${packageItem1.packageItem }" var="packageItem2">
									${ packageItem2.name } : <a id="${packageItem2.id}desc"></a><br>
								</c:forEach>
							</c:forEach>
						</div>
						
						<h2 class="ui dividing header" style=" margin-top: 40px;"></h2>
						<button class="ui big orange  button right floated " type="button" onclick="submit()">评估价格</button>
						
						
					</div>
			</div><!-- 右边 -->
			
			
			
		</div>

</div>

<script type="text/javascript">

	
	$(".item2div:first").css("display","block");

	function choose(itemId,itemFid,selOpt){
		
		var itemBtn = itemId+"itemBtn";
		var itemF = itemFid + "items";
		var itemDesc = itemFid + "desc"
		
		$(".item2div").removeClass("inverted").removeClass("red").removeClass("tertiary")
		
		if(selOpt == 'single'){ //单选
			$("."+itemF).removeClass("orange")
			$("#"+itemBtn).addClass("orange")
			$("#"+itemDesc).text($("#"+itemBtn).text())
		}
		
		if(selOpt == 'multi'){ //多选
			if($("#"+itemBtn).hasClass("orange")){
				$("#"+itemBtn).removeClass("orange")
			}else{
				$("#"+itemBtn).addClass("orange")
			}
			
			var multiChoose = "";
			$("."+itemF+".button.orange").each(function(){
				console.log($(this).val()+":"+$(this).text())
				multiChoose = multiChoose + $(this).text() + ",";
			})
			$("#"+itemDesc).text(multiChoose)
		}
		
		
		//选择特效
		var nextEle = $("#"+itemBtn).parent().parent().parent().next("div");
		if(typeof(nextEle.html()) == 'undefined' || nextEle.html() =='' ){
			$("#"+itemBtn).parent().parent().parent().next().next().css("display","block");	
		}else{
			$("#"+itemBtn).parent().parent().parent().next().css("display","block");	
		}
		$("html,body").animate({scrollTop:$("#"+itemBtn).parent().parent().parent().next().offset().top-100},500)
		
		
		
		
		
	}

	
	function submit(){
		
		
		var flag = true;
		$(".item2div").each(function(){
			if($(this).find(".orange").length < 1){
				$(this).addClass("ui").addClass("segment").addClass("red").addClass("inverted").addClass("tertiary")		
				$("html,body").animate({scrollTop:$(this).offset().top},500)
				flag = false;
				return false;
			}
		})
		
		if(!flag) return;
		
		var itemArray = new Array();
		$(".button.orange").each(function(){
			console.log($(this).val()+":"+$(this).text())
			itemArray.push($(this).val());
		})
		
		console.log("passsssssssss")
		var itemDescDiv = $("#itemDescDiv").text();
		standardPost("/trade/assess",{'itemArray':itemArray,"itemDesc":itemDescDiv});
		
		
	}
</script>



<jsp:include page="../layout/footer.jsp"></jsp:include>