
      var websocket = null;       
      //判断当前浏览器是否支持WebSocket
      if('WebSocket' in window){
          websocket = new WebSocket("ws://119.97.166.135:1060/message/message_ws/"+userId);
    	//websocket = new WebSocket("ws://119.97.166.135:1060/message/ebook_message/"+userId);
    	  //websocket = new WebSocket("ws://192.168.1.156:8081/message/ebook_message/"+userId);

      }
      else{
          alert('该浏览器不支持本系统部分功能，请切换到其它浏览器')
      }       
      //连接发生错误的回调方法
      websocket.onerror = function(evevt){
    	  console.log(evevt);
       //alert(evevt);
      };      
      //连接成功建立的回调方法
      websocket.onopen = function(event){
//       alert("链接成功"); 
      }    
      //接收到消息的回调方法
      websocket.onmessage = function(event){
//      alert("收到消息啦");
          setMessageInnerHTML(event.data);
    	  
      }      
      //连接关闭的回调方法
      websocket.onclose = function(){
//      alert("关闭连接");         
      }     
      //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
      window.onbeforeunload = function(){
          websocket.close();
      }    
      //将消息显示在网页上
      function setMessageInnerHTML(message){
//    	  alert(message)
    	  var getMessage=eval('(' + message + ')');
    	  var msgNum=$("#msgNum").text()
    	  if(msgNum==null||msgNum==''){
    		  msgNum=0;
    	  }
    	  msgNum=parseInt(msgNum)+1;
    	  if(msgNum==1){
    		  $("#msgList").empty();
    	  }
    	  $("#msgNum").text(msgNum)
		  var html='<li><a href="javascript:;" onclick="ackMsg('+getMessage.deliveryTag+');removeThis(this);"><div><i class="fa fa-envelope fa-fw"></i>'+getMessage.message+'</div></a></li>';
    	  $("#msgList").append(html);
      }
       
      //关闭连接
      function closeWebSocket(){
          websocket.close();
      }
       //发送消息//1.单聊 2.群聊 3.所有人
       function send(k){
    	   var qun_member_record="";
    	   var contents=$.trim($("#fdcontent").val());
    	   if(contents==""){
    		  
    	   }else{
    		   var obj={type:k,
             			realName:realName,
             			userName:wo,
             			to:$("#targetId").val(),
             			msg:contents,
             			members:qun_member_record,
             			time:""	
             		}
             var message =JSON.stringify(obj);
             websocket.send(message); 
    	   }
      }
       
       function ackMsg(deliveryTag){
    	 	//var url="http://119.97.166.135:1060/message/msg/v1/ackMsg/"+userId+"/"+deliveryTag;
    	 	//var url="http://192.168.1.156:8081/message/msg/v2/ackMsg/"+userId+"/"+deliveryTag;
    	 	var url="http://119.97.166.135:1060/message/msg/v2/ackMsg/"+userId+"/"+deliveryTag;
    	 	ajaxMsgAction("get",url,"", "jsonp", "ackMsg");
    	 }
       
       function ajaxMsgAction(type, url, reqData, returnType, requestName) {
       	$.ajax({
       		type : type,
       		url : url,
       		data : reqData,
       		async : false,
       		dataType : returnType,
       		jsonp: 'jsoncallback',
       		success : function(data) {
       			if(requestName == "ackMsg"){
       				
       			}
       		}
       	});
       }

