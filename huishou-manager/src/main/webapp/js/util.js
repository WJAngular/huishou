function to_page(url,data){
		console.log("to_page:"+url)
		url = url+(url.indexOf("?") == -1?'?':'&')+'rand='+Math.random();
		if (url.indexOf("/") == 0) {
			$("#page").load(CONTEXT_PATH + url, data, function(){
				
			});
		} else {
			console.log("to_page_href:"+url)
			location.href=url;
		}
		if (window.event) window.event.returnValue = false;
	
	}
	
	
	function load_page(object,url,data){
		
		
		url = url+(url.indexOf("?") == -1?'?':'&')+'rand='+Math.random();
		if (url.indexOf("/") == 0) {
			$("#"+object).load(CONTEXT_PATH + url, data, function(){
			});
		} else {
			location.href=url;
		}
		if (window.event) window.event.returnValue = false;
	}
	
	
	//actionUrl 请求路径
	//actionParamArray 请求参数
	//retSuccessUrl 成功跳转页面
	//actionFormObject 提交的表单对象 - 做异常显示
	//actionAddOrEditModalObject 提交的弹出框 - 做成功关闭
	function submitForm(actionUrl,actionParamArray,retSuccessUrl,actionFormObject,actionAddOrEditModalObject){
		
		actionUrl = actionUrl+(actionUrl.indexOf("?") == -1?'?':'&')+'rand='+Math.random();
		jQuery.ajax({
			type:'post',
			url : CONTEXT_PATH + actionUrl,
			data: actionParamArray,
			success : function(data) {
	    		if(data.status == "success")
	    		{
	    			if(retSuccessUrl != ""){
	    				$("#"+actionAddOrEditModalObject).modal("hide");
	    				to_page(retSuccessUrl)
	    			}else{
	    				$("#"+actionAddOrEditModalObject).modal("hide");
	    			}
	    		}else if(data.status == "error"){
	    			$("#"+actionFormObject).form('add errors', { error: data.message });
	    		}
			}
		});
	}
	
	//提交的公共方法
	function actionPost(actionUrl,actionParamArray){
		var retData;
		jQuery.ajax({
			type:'post',
			async: false, 
			url : CONTEXT_PATH + actionUrl,
			data: actionParamArray,
			success : function(data) {
	    		if(data.status == "success")
	    		{
	    			retData = data.data;
	    		}else if(data.status == "error"){
	    			alert(data.message);
	    		}
			}
		});
		return retData;
	}
	
	
	//提交的公共方法
	function actionPost_(actionUrl,actionParamArray){
		var retData;
		jQuery.ajax({
			type:'post',
			async: false, 
			url : CONTEXT_PATH + actionUrl,
			data: actionParamArray,
			success : function(data) {
				retData = data
			}
		});
		return retData;
	}
	
	
	
	//通过jq用表单方式提交以及跳转页面
	function standardPost(url,args) 
    {
        var form = $("<form method='post'></form>");
        form.attr({"action":CONTEXT_PATH +url });
        for (arg in args)
        {
            var input = $("<input type='hidden'>");
            input.attr({"name":arg});
            input.val(args[arg]);
            form.append(input);
        }
        form.submit();
    }
	
	
	