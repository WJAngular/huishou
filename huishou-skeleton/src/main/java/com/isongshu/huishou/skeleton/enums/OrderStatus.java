package com.isongshu.huishou.skeleton.enums;

/**
 * @author huson
 *
 */
public enum OrderStatus {

	//1=已提交，2=审批中，3=审批通过，4=已收货，5=完成，6=取消，7=退回
			SUBMIT(1),
			APPROVEING(2),
			APPROVED(3),
			RECRIVING(4),
			FINISH(5),
			CANCEL(6),
			RETURN(7);
			
			private int statusCode ;
			
			OrderStatus(int statusCode){
				this.statusCode=statusCode;
			}
			
			public int statusCode(){
				return this.statusCode;
			}
}
