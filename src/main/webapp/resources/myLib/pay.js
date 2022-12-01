function payf(id, phone, address){
    var IMP = window.IMP;
    IMP.init('imp03314248');
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '스트리밍 구독 결제',
        amount : 7000,
        buyer_name: id,
        buyer_tel : phone,
        buyer_addr : address,
        buyer_postcode : '123-456'
    }, function(rsp) {
        if ( rsp.success ) {
            msg = '결제 성공!';
            console.log('테스트');
	     	$.ajax({
	          type:'Post',
	          url:'usergradeupdate',
	          data: {
	             id: id
	          },
	          success:function(resultData){
	          }
	        }); //ajax
	        
            alert(msg);
		    location.reload();
            window.open('','_self').close();
        } else {
            msg = '결제 실패!';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
            window.open('','_self').close();
        }
    });
    
}


    