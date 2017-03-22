<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

				<div class="ui top attached info message">
				     订单信息
				</div>
				<div class="ui attached segment">
				  <p>支付信息 支付形式： ${orderInfo.payType == 'alipay' ? '支付宝' : orderInfo.payType == 'bank' ? '网银转账' : '现金' }</p>
				  <h2 class="ui dividing header"></h2>
				  <p>物品信息 </p>
				  <p>物品名称：${orderInfo.prdProductName}</p> 
				  <p>物品情况描述：${orderInfo.detail}</p> 
				  <p>估算金额：${orderInfo.assessPrice}</p>
				</div>
				
				

		