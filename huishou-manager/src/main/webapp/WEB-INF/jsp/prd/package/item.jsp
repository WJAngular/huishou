<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<link rel="stylesheet" type="text/css" href="zTree/demo.css?9154">
<link rel="stylesheet" type="text/css" href="zTree/zTreeStyleForPack.css?12345">
<script src="zTree/jquery.ztree.all.js?2"></script>

<SCRIPT type="text/javascript">


		var actionUrl = "${actionUrl}";
		this.getDataActionUrl = actionUrl + "getData";
		this.deleteActionUrl = actionUrl + "delete";
		this.renameActionUrl = actionUrl + "rename";
		this.addActionUrl = actionUrl + "add";
		this.updateValueActionUrl = actionUrl + "updateValue";
		this.updateSelOptActionUrl = actionUrl + "updateSelOpt";
		this.dragActionUrl = actionUrl + "drag";
		
		this.packageId = '${packageId}';
		IDMark_A = "_a";
		var setting = {
			view: {
				showLine:false,
				dblClickExpand: false,
				addDiyDom: addDiyDom
			},
			callback: {
				onRightClick: OnRightClick,
				beforeRename: beforeRename,
				beforeRemove: beforeRemove,
				onRename: onRename,
				beforeDrag: beforeDrag,
				beforeDrop: beforeDrop,
				onMouseDown: zTreeOnMouseDown,
				beforeAsync: beforeAsync,
				onAsyncSuccess: onAsyncSuccess,
				onAsyncError: onAsyncError
			},
			edit:{
				enable:true,
				showRemoveBtn: false,
				showRenameBtn: false,
				drag:{
					inner:false
				}
				
			},
			simpleData: {  
                enable: true,
     			idKey: "id",
     			pIdKey: "pId",
     			rootPId: 0
            },  
			async: {  
                enable: true,  
                url:CONTEXT_PATH + getDataActionUrl+"/?packageId="+packageId+"",  
                autoParam:["id", "name"],  
                otherParam:{"otherParam":"zTreeAsyncTest"},  
                dataFilter: filter  
            }  
		};

		
		
		
		function beforeDrag(treeId, treeNodes) {
			console.log("beforeDarg  treeid:"+treeId+" treeNodes:"+treeNodes)
			return true;
		}
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			
			var curNode =  zTree.getSelectedNodes()[0];
			
			
			console.log("curNodename:"+curNode.name)
			console.log("curNodelevel:"+curNode.level)
			console.log("curNodetId:"+curNode.tId)
			console.log("curNodeid:"+curNode.id)
			console.log("treeNodename:"+targetNode.name)
			console.log("treeNodelevel:"+targetNode.level)
			console.log("treeNodetId:"+targetNode.tId)
			console.log("treeNodeid:"+targetNode.id)
			console.log("beforeDrop  treeid:"+treeId+"treeNodes:"+treeNodes+" targetNode:"+targetNode+" moveType:"+moveType)
			
			
			
			//只能同级拖曳
			if(curNode.level != targetNode.level){
				return false;
			}
			
			var actionParamArray = {"packageId":packageId,"currentId":curNode.id,"targetId":targetNode.id,"moveType":moveType};
			var retData = actionPost_(dragActionUrl,actionParamArray)
			if(retData.status == 'success'){
				return true;
			}else{
				alert(retData.message)
			}
			
		}
		
		
		
		  function filter(treeId, parentNode, childNodes) {  
	            if (!childNodes) return null;  
	            for (var i=0, l=childNodes.length; i<l; i++) {  
// 	                childNodes[i].name = childNodes[i].name.replace('','');  
	                childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
	            }  
	            return childNodes;  
	        } 
		  
		var zNodes = "";

		
		//添加自定义控件		
		function addDiyDom(treeId, treeNode) {
			console.log("addDiyDom"+treeNode.parentNode)
			if (treeNode.level == '0' ) return;
			
			var aObj = $("#" + treeNode.tId + IDMark_A);
			
			var diyNode ;
			
			//添加单选多选
			if (treeNode.level == '1' ){
				diyNode = "<select class='selDemo'  value='"+ treeNode.selOpt+"' onchange=onSelOptChange("+packageId+","+getId(treeNode.tId)+",'diySel_"+treeNode.id+"') id='diySel_" +treeNode.id+ "' > ";
				if(treeNode.selOpt == 'single'){
					diyNode = diyNode + "<option value='single' selected>单选</option>";
					diyNode = diyNode + "<option value='multi'>多选</option>";
				}
				else if(treeNode.selOpt == 'multi'){
					diyNode = diyNode + "<option value='single'>单选</option>";
					diyNode = diyNode + "<option value='multi' selected>多选</option>";
				}else{
					diyNode = diyNode + "<option value='single'>单选</option>";
					diyNode = diyNode + "<option value='multi' >多选</option>";
				}
					
				diyNode = diyNode + "</select>";		
			}
			
			
			//添加值
			if (treeNode.level == '2' ){
			
				diyNode = "<div class='ui mini input right labeled inputchangediv' style='margin-left: 10px;width: 90px;'> "+
						  "	<input onchange=onValueChange("+packageId+","+getId(treeNode.tId)+",'diyBtn_"+treeNode.id+"') name='treevalue'      type='number' placeholder='0.05' id='diyBtn_" +treeNode.id+ "' treenodeid='" +treeNode.id+ "' value='"+ treeNode.value+"'>"+
						  "<div class='ui basic label'>% </div>"
						  "</div>";
			}		  
			
						  
// 			aObj.append(diyNode);
			aObj.after(diyNode);
			var btn = $("#diyBtn_"+treeNode.id);
		}
		
		
		
		
		//单选多选更改
		function onSelOptChange(packageId,id,inputObjectId){
			console.log(packageId+":"+id+":"+inputObjectId+","+$("#"+inputObjectId).val())		
			var actionParamArray = {"id":id,"packageId":packageId,"selOpt":$("#"+inputObjectId).val()};
			actionPost(updateSelOptActionUrl,actionParamArray)
		}
		
		
		function onValueChange(packageId,id,inputObjectId){
			console.log(packageId+":"+id+":"+inputObjectId+","+$("#"+inputObjectId).val())		
			var actionParamArray = {"id":id,"packageId":packageId,"value":$("#"+inputObjectId).val()};
			actionPost(updateValueActionUrl,actionParamArray)
		}
		
		
		
		//右键显示
		function OnRightClick(event, treeId, treeNode) {
			if (treeNode.level == '0' || treeNode.level == '1' ) {
				console.log("parent"+treeNode.level)
				zTree.selectNode(treeNode);
				showRMenu("parent", event.clientX, event.clientY);
			}
			else if (treeNode.level == '2' ) {
				console.log("node"+treeNode.level)
				zTree.selectNode(treeNode);
				showRMenu("node", event.clientX, event.clientY);
			}
		}
		
		//右键显示菜单
		function showRMenu(type, x, y) {
			$("#rMenu ul").show();
			if(type == "parent") {
				$("#m_del").show();
				$("#m_add").show();
			}else if(type == "node"){
				$("#m_del").show();
				$("#m_add").hide();
			}
			rMenu.css({"top":(y-30)+"px", "left":(x-330)+"px", "visibility":"visible"});
		}
		
		//隐藏右键菜单
		function hideRMenu() {
			if (rMenu) rMenu.css({"visibility": "hidden"});
		}
		
		
		var addCount = 1;
		
		//新增子菜单
		function addTreeNode() {
			console.log("addTreeNode")
			hideRMenu();
			selTreeNode =  zTree.getSelectedNodes()[0];
			
			//如果当前选择是在根节点0下面添加，那么添加的就是二级节点，也算是父节点
			var isParent = false;
			if(selTreeNode.level == "0" ){
				isParent = true;
			}else{
				isParent = false;
			}

			var treeNodeName = "new" + (addCount++);
			var level = selTreeNode.level+1;
			var id = createNode(selTreeNode.id,treeNodeName,level);
			
// 			if(id != null && id != ''){
// 				var newNode = {id:id,name:treeNodeName,isParent:isParent,level:level};
// 				 zTree.addNodes(selTreeNode, newNode,false);
// 			}
			
			zTree.reAsyncChildNodes(selTreeNode, "refresh");
			
			
		}
		
		//新增父菜单
		function addRootTreeNode() {
			console.log("addRootTreeNode")
			hideRMenu();
			
			var treeNodeName = "new" + (addCount++);
			var level = "0";
			var id = createNode(null,treeNodeName,level);
// 			if(id != null && id != ''){
// 				var newNode = { id:id,name:treeNodeName,isParent:true,level:"0"}; 
// 				 zTree.addNodes(null, newNode,false);	
// 			}
			
			zTree.reAsyncChildNodes(null, "refresh");
			
		}
		
		//新增节点监听
		function createNode(pid,treeNodeName,level) {
			var actionParamArray = {"pid":pid,"name":treeNodeName,"packageId":packageId,"level":level};
			var id = actionPost(addActionUrl,actionParamArray);
			return id;
		};
		
		
		
		//编辑名称
		function editTreeNode() {
			var nodes = zTree.getSelectedNodes();
			if (nodes.length == 0) {
				alert("请先选择一个节点");
				return;
			}
			zTree.editName(nodes[0]);
		};
		
		
		//删除节点
		function removeTreeNode() {
			hideRMenu();
			var nodes = zTree.getSelectedNodes();
			if (nodes && nodes.length>0) {
				if (nodes[0].children && nodes[0].children.length > 0) {
					var msg = "are u sure";
// 					if (confirm(msg)==true){ 
						zTree.removeNode(nodes[0],true);
// 					}
				} else {
					zTree.removeNode(nodes[0],true);
				}
			}
		}
		
		
		//重置节点
		function resetTree() {
			
			hideRMenu();
			if (!check()) {
				return;
			}
			asyncForAll = false;
			goAsync = false;
			$("#demoMsg").text("");
			$.fn.zTree.init($("#treeDemo"), setting,zNodes);
			
		}
		
		
		//获取ID,zTree默认ID前缀带treeDemo_,要过滤
		function getId(tid){
			if(tid == null || tid == '') return;
			var node = zTree.getNodeByTId(tid);
			return node.id
		}
		function getpId(tid){
			if(tid == null || tid == '') return;
			var node = zTree.getNodeByTId(tid);
			return node.pId
		}
		
		
		//改名前的动作
		function beforeRename(treeId, treeNode, newName, isCancel) {
			console.log("beforeRename"+treeNode.tId + ", " + treeNode.name+","+newName);
// 			hideRMenu();
			return  newName.length > 1;
		}
		
		//改名之后的动作
		function onRename(e, treeId, treeNode, isCancel) {
// 			hideRMenu();
			console.log("onRename,"+treeId + " ,"+treeNode.tId + ", " + treeNode.name+","+treeNode.parentTId);
			var actionParamArray = {"id":getId(treeNode.tId),"newname":treeNode.name,"packageId":packageId};
			actionPost(renameActionUrl,actionParamArray)
		}
		
		
		//删除前动作
		function beforeRemove(treeId, treeNode) {
			hideRMenu();
			console.log("beforeRemove,"+treeId+","+treeNode.tId + ", " + treeNode.name);
			var actionParamArray = {"id":getId(treeNode.tId),"packageId":packageId};
			actionPost(deleteActionUrl,actionParamArray)
			return true;
		}
		
		function zTreeOnMouseDown(){
			hideRMenu();
			return true;
		}
		
		
		
		
		
		//展开全部
		var zTree, rMenu;
		
		var demoMsg = {
				async:"正在进行异步加载，请等一会儿再点击...",
				expandAllOver: "全部展开完毕",
				asyncAllOver: "后台异步加载完毕",
				asyncAll: "已经异步加载完毕，不再重新加载",
				expandAll: "已经异步加载完毕，使用 expandAll 方法"
			}
		
		
		function beforeAsync() {
			curAsyncCount++;
		}
		
		function onAsyncSuccess(event, treeId, treeNode, msg) {
			curAsyncCount--;
			if (curStatus == "expand") {
				expandNodes(treeNode.children);
			} else if (curStatus == "async") {
				asyncNodes(treeNode.children);
			}
			if (curAsyncCount <= 0) {
				if (curStatus != "init" && curStatus != "") {
					$("#demoMsg").text((curStatus == "expand") ? demoMsg.expandAllOver : demoMsg.asyncAllOver);
					asyncForAll = true;
				}
				curStatus = "";
			}
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			curAsyncCount--;
			if (curAsyncCount <= 0) {
				curStatus = "";
				if (treeNode!=null) asyncForAll = true;
			}
		}
		var curStatus = "init", curAsyncCount = 0, asyncForAll = false, goAsync = false;
		function expandAll() {
			$("#demoMsg").text("expandAll");
			if (!check()) {
				return;
			}
			if (asyncForAll) {
				$("#demoMsg").text(demoMsg.expandAll);
				zTree.expandAll(true);
			} else {
				$("#demoMsg").text("expandNodes");
				expandNodes(zTree.getNodes());
				if (!goAsync) {
					$("#demoMsg").text(demoMsg.expandAll);
					curStatus = "";
				}
			}
		}
		function expandNodes(nodes) {
			if (!nodes) return;
			curStatus = "expand";
			for (var i=0, l=nodes.length; i<l; i++) {
				zTree.expandNode(nodes[i], true, false, false);
				if (nodes[i].isParent && nodes[i].zAsync) {
					expandNodes(nodes[i].children);
				} else {
					goAsync = true;
				}
			}
		}
		function asyncAll() {
			if (!check()) {
				return;
			}
			if (asyncForAll) {
				$("#demoMsg").text(demoMsg.asyncAll);
			} else {
				asyncNodes(zTree.getNodes());
				if (!goAsync) {
					$("#demoMsg").text(demoMsg.asyncAll);
					curStatus = "";
				}
			}
		}
		function asyncNodes(nodes) {
			if (!nodes) return;
			curStatus = "async";
			for (var i=0, l=nodes.length; i<l; i++) {
				if (nodes[i].isParent && nodes[i].zAsync) {
					asyncNodes(nodes[i].children);
				} else {
					goAsync = true;
					zTree.reAsyncChildNodes(nodes[i], "refresh", true);
				}
			}
		}
		
		function check() {
			if (curAsyncCount > 0) {
				$("#demoMsg").text(demoMsg.async);
				return false;
			}
			return true;
		}
		
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			zTree = $.fn.zTree.getZTreeObj("treeDemo");
			rMenu = $("#rMenu");
			
			
		});
	</SCRIPT>
	<style type="text/css">
		div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
		div#rMenu ul li{
					margin: 1px 0;
					padding: 0 5px;
					cursor: pointer;
					list-style: none outside none;
					background-color: #DFDFDF;
						}
	</style>
	
	<div class="ui   ">
		<!-- main -->
		<div class="ui grid  internally celled   ">
		
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
			
			<div class="row">
			
				<div class="two wide column ">
				  	<div class="ui grid one column ">
					  	<div class="column"><button class="ui teal button tiny fluid" onclick="addRootTreeNode();">新增类别</button></div>
					  	<div class="column"><button class="ui orange button tiny fluid" onclick="expandAll();">展开全部</button></div>
					  	<div class="column"><button class="ui grey button tiny fluid" onclick="resetTree();">重新加载</button></div>
<!-- 					  	<p  id="demoMsg"></p> -->
				  	</div>
				</div>
			
				<div class="eight wide column">
				
							<ul id="treeDemo" class="ztree"></ul>
					<div id="rMenu">
						<ul>
							<li id="m_add" onclick="addTreeNode();">新增</li>
							<li id="m_edit" onclick="editTreeNode();">修改名称</li>
							<li id="m_del" onclick="removeTreeNode();">删除</li>
						</ul>
					</div>
				</div>
				
				
				
			</div>
			
			
		</div>
		</div>
