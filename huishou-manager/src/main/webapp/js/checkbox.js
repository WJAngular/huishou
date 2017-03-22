	//全选按钮
	$('.all.checkbox').checkbox().first().checkbox({
		  onChecked: function() {	
			  console.log("all checkbox check")
			  $('.checkbox').checkbox("set checked");
		  },
		  onUnchecked: function() {
			  console.log("all checkbox uncheck")
			  $('.checkbox').checkbox("set unchecked");
		  }
		})
		;

	
	//单选按钮
	$('.single.checkbox').checkbox({
	  onChecked: function() {
	  },
	  onUnchecked: function() {
		  console.log("single checkbox uncheck")
		  $('.all.checkbox').checkbox("set unchecked");
	  }
	})
	;
