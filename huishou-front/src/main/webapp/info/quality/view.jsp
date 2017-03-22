<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/layout/header.jsp"></jsp:include>
<jsp:include page="/layout/search.jsp"></jsp:include>
<jsp:include page="/layout/nav.jsp"></jsp:include>


<div class="ui grid  " style="background-color: #F8F8F8; padding: 20px">
	<div class="row">
	
		<!-- 导航 -->
		<div class=" four wide column">
				
				<div class="ui rail">
				<div class="ui sticky">
				<div class="ui teal   segment"  >
					<h2 class="ui dividing header">质检说明<a class="anchor" id="content"></a></h2>
					<div class="ui ordered list">
					  <a class="item" href="#pro1">质检名词解释</a>
					</div>
				</div>
				</div>
				</div>
		</div>
		<div class=" twelve wide column">
			
			<div class="ui teal   segment"  >
						
						<div class="ui centered grid">
							<div class="row"  id="pro1">
								<div class="column">
								<h2 class="ui dividing header">质检名词解释<a class="anchor" ></a></h2>
							            <dl class="qa_dl">
							                <dt>1.板机：</dt>
							                <dd>大拆修，组装主板。此类手机，多出现螺丝拧动变形，CPU标签纸褶皱不平，防修标签纸破损(常见于iPhone )</dd>
							                <dt>2.	烧卡机：</dt>
							                <dd>没有卡槽，不能插入SIM卡，直接就能拨打电话，手机号被写入手机中，也叫写号机（常见于iPhone）</dd>
							                <dt>3.	改卡机：</dt>
							                <dd>有锁改无锁，卡贴直接被镶入主板中，主板有焊接痕迹（常见于iPhone,验货时会写清楚）</dd>
							                <dt>4.	漏光：</dt>
							                <dd>手机调到纯色界面时，屏幕四周颜色发亮（相对于整块屏幕）</dd>
							                <dt>5.	亮点、斑点：</dt>
							                <dd>斑点：手机调到纯色界面，屏幕出现黑斑、白斑，亮点（常见于HTC）</dd>
							                <dt>6.	色差：</dt>
							                <dd>手机在纯色界面时，顶部屏幕颜色与下方屏幕颜色有明显差异，也叫屏幕老化，老化越严重，色差越明显，范围越大（常见于三星）</dd>
							                <dt>7.	进水、受潮：</dt>
							                <dd>防水标签纸变色或螺丝生锈，主板有水渍（验货时会写清楚）</dd>
							                <dt>8.	触摸功能坏：</dt>
							                <dd>触摸延迟，触摸反应慢；触摸无反应</dd>
							                <dt>9.	无线蓝牙坏：</dt>
							                <dd>无线不能打开，无线能打开不能搜索，蓝牙类似（验货时会写清楚）</dd>
							                <dt>10.	通话感应：</dt>
							                <dd>拨打电话，若正常，遮住听筒处屏幕会变黑，松开屏幕会变亮；若遮住听筒处松开听筒处，屏幕状态没有改变，都为通话感应坏</dd>
							                <dt>11.	手机被账号绑定：</dt>
							                <dd>手机账号未解绑，激活时需要账号和密码，或者“查找我的iPhone”未关闭</dd>
							                <dt>12.	苹果案列：</dt>
							                <dd>用户咨询苹果客服被记录的档案</dd>
							                <dt>13. 苹果换机：</dt>
							                <dd>手机在有效保修期内去苹果店换出的机器</dd>
							                <dt>14.	黑机：</dt>
							                <dd>序列号在苹果官网查不到信息</dd>
							                <dt>15.	丢失模式：</dt>
							                <dd>手机显示界面显示“手机已丢失”字样，并无法激活使用，涉及法律法规，安特回收无法进行回收</dd>              
							            </dl>
							
								</div>
							</div>
							
						
						</div>
			</div>
			
		</div>

	</div>

</div>

<script type="text/javascript">

$(document).ready(function(){
	$('.ui.sticky') .sticky({
	    context: '#pro4'
	  })
	;
})


</script>
<style>
	
	.con_con{
		padding: 20px
	}


/*	QA 甯歌闂 */
.qa_dl {
  margin-bottom: 20px;
}
.qa_dl dt {
  display: block;
  font-size: 14px;
  line-height: 24px;
  font-weight: bold;
  margin-bottom: 5px;
}
.qa_dl dt + dt {
  margin-top: 10px;
}
.qa_dl dd {
  display: block;
  font-size: 14px;
  line-height: 24px;
  margin-bottom: 10px;
}

</style>

<jsp:include page="/layout/footer.jsp"></jsp:include>