<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	<!-- 在线客服 -->
	<div id="kefu" style=" width: 80px;height: 230px;position: fixed;top: 70%;right: 20px;z-index: 1002;">
		<div class="ui grid">
				<div class=" column  ">
				  <button class="ui fluid  button blue large  "  onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=1552107066&site=qq&menu=yes')">
				  <i class="icon smile" style="font-size: 2.4em" ></i>
				  <br>
				 客服
				</button>
				</div>
		</div>
    </div>
    <!-- 在线客服 -->
	<!-- 导航条 -->
	<div class="ui secondary menu pointing massive" >
		  <a class="item " style="margin-left: 0px;" >
		  </a>
		  <a class="item ${empty param.curNav ? 'active' : '' }" style="width: 209px;display: block;text-align: center;" onclick="to_page('/clazz')">
		    	旧机回收
		  </a>
		  <a class="item ${param.curNav == 'newproduct' ? 'active' : '' }" style="margin-left: 100px;display: block;text-align: center;" onclick="to_page('/other/newproduct/view.jsp?curNav=newproduct')">
		    	提交型号 
		  </a>
		  <a class="item ${param.curNav == 'bigrecycle' ? 'active' : '' }"  style="margin-left: 100px;display: block;text-align: center;" onclick="to_page('/other/bigrecycle/view.jsp?curNav=bigrecycle')">
		    	量大回收
		  </a>
		  <a class="item ${param.curNav == 'join' ? 'active' : '' }"  style="margin-left: 100px;display: block;text-align: center;" onclick="to_page('/other/join/view.jsp?curNav=join')">
		    	我要加盟
		  </a>
		  <div class="right menu">
		    <a class="ui item">
		    </a>
		  </div>
	</div><!-- 导航条 -->