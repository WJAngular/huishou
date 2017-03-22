<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<link rel="stylesheet" type="text/css" href="zTree/demo.css?9154">
<link rel="stylesheet" type="text/css" href="zTree/zTreeStyle.css?12345">
<script src="zTree/jquery.ztree.all.js?1"></script>

<SCRIPT type="text/javascript">

		this.getDataActionUrl = "/prdClazzBrand/getData";
		this.deleteActionUrl = "/prdClazzBrand/delete";
		this.renameActionUrl = "/prdClazzBrand/rename";
		this.addActionUrl = "/prdClazzBrand/add";


		IDMark_A = "_a";
		var setting = {
			view: {
				showLine:false,
				dblClickExpand: false
// 				addDiyDom: addDiyDom
			},
			callback: {
				beforeRename: beforeRename,
				beforeRemove: beforeRemove,
				onRename: onRename,
				onMouseDown: zTreeOnMouseDown,
				onRightClick: OnRightClick
			},
			simpleData: {  
                enable: true,
     			idKey: "id",
     			pIdKey: "pId",
     			rootPId: 0
            },  
			async: {  
                enable: true,  
                url:CONTEXT_PATH + getDataActionUrl,  
                autoParam:["id", "name"],  
                otherParam:{"otherParam":"zTreeAsyncTest"},  
                dataFilter: filter  
            }  
		};

		
		  function filter(treeId, parentNode, childNodes) {  
	            if (!childNodes) return null;  
	            for (var i=0, l=childNodes.length; i<l; i++) {  
	                childNodes[i].name = childNodes[i].name.replace('','');  
	            }  
	            return childNodes;  
	        } 
		  
		  
		var zNodes = "";

		
		//右键显示
		function OnRightClick(event, treeId, treeNode) {
// 			if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
// 				console.log("root")
// 				zTree.cancelSelectedNode();
// 				showRMenu("root", event.clientX, event.clientY);
// 			}
// 			else 
				
			if (treeNode.isParent ) {
				console.log("parent")
				zTree.selectNode(treeNode);
				showRMenu("parent", event.clientX, event.clientY);
			}
			else if (treeNode ) {
				console.log("node")
				zTree.selectNode(treeNode);
				showRMenu("node", event.clientX, event.clientY);
			}
		}
		
		function zTreeOnMouseDown(){
			hideRMenu();
			return true;
		}
		
		//右键显示菜单
		function showRMenu(type, x, y) {
			$("#rMenu ul").show();
			if (type=="root") {
				$("#m_del").hide();
				$("#m_add").show();
			} else if(type == "parent") {
				$("#m_del").show();
				$("#m_add").show();
			}else if(type == "node"){
				$("#m_del").show();
				$("#m_add").hide();
			}
			rMenu.css({"top":(y-30)+"px", "left":(x-330)+"px", "visibility":"visible"});
// 			$("body").bind("mousedown", onBodyMouseDown);
		}
		
		//隐藏右键菜单
		function hideRMenu() {
			if (rMenu) rMenu.css({"visibility": "hidden"});
// 			$("body").unbind("mousedown", onBodyMouseDown);
		}
		
		//点击空白处
// 		function onBodyMouseDown(event){
// 			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
// 				rMenu.css({"visibility" : "hidden"});
// 			}
// 		}
		
		
		var addCount = 1;
		
		
		
		//新增子菜单
		function addTreeNode() {
			hideRMenu();
			selTreeNode =  zTree.getSelectedNodes()[0];
			var newNode = { name:"new" + (addCount++),v:0,isParent:false};
			
			createNode(selTreeNode.id,newNode);
			zTree.reAsyncChildNodes(selTreeNode, "refresh");
			
		}
		
		//新增父菜单
		function addRootTreeNode() {
			hideRMenu();
			var newNode = { name:"new" + (addCount++),v:0,isParent:true};
			
			createNode(null,newNode);
			zTree.reAsyncChildNodes(null, "refresh");
		}
		
		//新增节点监听
		function createNode(pId,treeNode) {
			console.log("createNode,"+pId + ", " + treeNode.name);
			var actionParamArray = {"pid":pId,"name":treeNode.name};
			actionPost(addActionUrl,actionParamArray)
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
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
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
			return  newName.length > 1;
		}
		
		//改名之后的动作
		function onRename(e, treeId, treeNode, isCancel) {
			console.log("onRename,"+treeId + " ,"+treeNode.tId + ", " + treeNode.name+","+treeNode.parentTId);
			var actionParamArray = {"id":getId(treeNode.tId),"newname":treeNode.name};
			actionPost(renameActionUrl,actionParamArray)
		}
		
		
		//删除前动作
		function beforeRemove(treeId, treeNode) {
			console.log("beforeRemove,"+treeId+","+treeNode.tId + ", " + treeNode.name);
			var actionParamArray = {"id":getId(treeNode.tId)};
			actionPost(deleteActionUrl,actionParamArray)
			return true;
		}
		
		
		function cc(){
			alert("!!")
		}
		
		var zTree, rMenu;
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
					  <div class="active section">品牌类别管理</div>
					</div>
				</div>
			</div><!-- 头部导航 -->
			
			<div class="row">
			
				<div class="two wide column ">
				  	<div class="ui grid one column ">
					  	<div class="column"><button class="ui teal button tiny fluid" onclick="addRootTreeNode();">新增类别</button></div>
					  	<div class="column"><button class="ui grey button tiny fluid" onclick="resetTree();">初始化</button></div>
				  	</div>
				</div>
			
				<div class="eight wide column">
				
					<div class="content_wrap">
						<div class="zTreeDemoBackground left">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
					</div>
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
