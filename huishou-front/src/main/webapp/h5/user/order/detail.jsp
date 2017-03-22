<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

				<div class="ui grid container "  >
					<div class="row">
						<div class="sixteen wide column">
						
							<div class="ui padded ">
							  <p>支付信息 支付形式：
							  	 <a style="color:red">${orderInfo.payType == 'alipay' ? '支付宝' : orderInfo.payType == 'bank' ? '网银转账' : '现金' }</a>
							  </p>
							   <p>估算金额：<a style="color:red">${orderInfo.assessPrice}<i class="yen icon"></i></a></p>
							  <h2 class="ui dividing header"></h2>
							  <h3>物品信息 </h3>
							  <p>物品名称：${orderInfo.prdProductName}</p> 
							  <p>物品情况描述：${orderInfo.detail}</p> 
							</div>
							</div>
							</div>
							</div>
				
				

		