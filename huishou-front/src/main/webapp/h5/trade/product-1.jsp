<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"></jsp:include>

<style type="text/css">
</style>


	<jsp:include page="/h5/header-nav.jsp?title=${object.name }"></jsp:include>	
	
	<div class="ui grid " style="margin-top: 2.6em;padding: 10px">
		
		
		<div class="row">
			<div class="sixteen wide column">
				<c:forEach items="${packageItem }" var="packageItem1">
							<h5 class="ui dividing header">${packageItem1.name}<a class="anchor" id="types"  ></a></h5>
							<c:forEach items="${packageItem1.packageItem }" var="packageItem2">
								<div  class="${packageItem2.selOpt == 'single' ? 'item2div' : '' }  ui clearing teal segment" style="margin-bottom: 30px;display:none">
									<p>${packageItem2.name }</p>
									<div class="ui grid two column">
										<c:forEach items="${packageItem2.packageItem }" var="packageItem3">
											<div class="column"><button value="${packageItem3.id}" id="${packageItem3.id}itemBtn" class="${packageItem2.id }items ui toggle button  basic fluid" onclick="choose('${packageItem3.id}','${packageItem2.id }','${packageItem2.selOpt}')">${packageItem3.name }</button></div>
										</c:forEach>
									</div>	
								</div>
				</c:forEach>
			</c:forEach>
			</div>	
		</div>
		
		
		<div class="row">
			<div class="sixteen wide column">
				<div id="itemDescDiv">
							<c:forEach items="${packageItem }" var="packageItem1">
								<c:forEach items="${packageItem1.packageItem }" var="packageItem2">
									${ packageItem2.name } : <a id="${packageItem2.id}desc"></a>|&nbsp;
									<br>
								</c:forEach>
							</c:forEach>
						</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="sixteen wide column">
				<div class="ui button fluid orange" type="button" onclick="submit()">评估价格</div>
			</div>
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
 	
