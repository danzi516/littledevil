var fileType=['jpg','jpeg','gif','png','bmp']; //允许上传文件类型

    $(document).ready(function() {
       $("#tempDirId").val(makeUUID());
       getAppInfo();
        //改变复选框与单选框的样式
        $("button[data-id='imgShow']").click(function(){
            if($("#defaultIconImg").attr("src")!=""){
                $('#imagePreview img').css({"background":"#fff"})
                var imgWidth = ($('#imagePreview img').width()) + "px";
                var imgHeight = ($('#imagePreview img').height()) + "px";
                //alert($("#imagePreview img").attr("src"));
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: true,
                    area: [imgWidth, imgHeight],
                    skin: 'layui-layer-nobg', //没有背景色
                    shadeClose: true,
                    content: $('#imagePreview img')
                });
            }else{
                layer.msg('您还没有上传图片', function(){});
            }
        });
        $("input[type='radio'],input[type='checkbox']").uniform();  
      // validate signup form on keyup and submit
      $("#editAppForm").validate({
          rules: {
          	appName: {
          		required: true,
                  remote: {
                  	type: "get",
                  	dataType: "json",
                  	url: basePath+"/appInfomation/isExitsByCondition",
                  	data: {
                  		appName: function() {
                  			return $("#appName").val();
                  		},
                  		id: function() {
                  			return $("#id").val();
                  		}
                  	}
                  }
              },
          	appCode: {
                  required: true,
                  remote: {
                  	type: "get",
                  	dataType: "json",
                  	url: basePath+"/appInfomation/isExitsByCondition",
                  	data: {
                  		appCode: function() {
                  			return $("#appCode").val();
                  		},
                  		id: function() {
                  			return $("#id").val();
                  		}
                  	}
                  }
              }
          },
          success: function(element) {
          	element.closest('.form-group').removeClass('has-error').addClass('has-success');
  			$("#codeButton").removeAttr("disabled","");
  		},
          messages: {
          	appName: {        		
          		required: "应用名不能为空！",
          		remote: "应用名已经存在，请重新输入！"
          	},
          	appCode: {        		
          		required: "应用编码不能为空！",
          		remote: "应用编码已经存在，请重新输入！"
          	}
          },
          submitHandler:function(form){
          	editApp();
          }
      });
  
    });
    
    function getAppInfo(){
		var url = basePath+"/appInfomation/selectAppById/"+appId;
		ajaxAction("get",url,"","json","queryAppById");
     }

    function showData(resultObject){
        $("#id").val(resultObject.id);
    	$("#appName").val(resultObject.appName);
    	$("#appCode").val(resultObject.appCode);
    	$("#appUrl").val(resultObject.appUrl);
    	$("#downloadUrl").val(resultObject.downloadUrl);
    	$("#appProvider").val(resultObject.appProvider);
    	$("#appInfo").val(resultObject.appInfo);
    	$("#isPay").find("option[value='"+resultObject.isPay+"']").attr("selected",true);
    	$("#state").find("option[value='"+resultObject.state+"']").attr("selected",true);
    	$("#appLogo").val(resultObject.appLogo);
		$("#defaultIconImg").attr("src", basePath+'/'+resultObject.appLogo);
    	var fileList=resultObject.appPicture;
    	var html='';
    	for(var i=0;i<fileList.length;i++){
    	   var filename=fileList[i].pictureName;
    	   var filePath=fileList[i].pictureUrl;
    	   var fileid=fileList[i].id;     

		    html+='<div>';	
			html+='<img src="'+basePath+'/'+filePath+'" style="width: 30px;height: 30px; margin:3px ;"/><span> <strong>'+filename+'</strong>';
		    html+='<a data-toggle="modal" data-target=".bs-example-modal-sm" href="javascript:;" onclick="previewFile(\''+filePath+'\' );">预览</a>|';
		    html+='<a href="javascript:;" onclick="deleteRealFile(this);" id="'+fileid+'">删除</a></span><br/>';
		    html+='</div>';  
    	}
    	$("#fileContent").html(html);
		
    }
    
    /**
     * 提交注册信息
     */
    function editApp(){
    	$("#editAppForm").validate();
    	var url=basePath+"/appInfomation/updateApp";
    	var data={
    			id:$("#id").val(),
    			appName:$("#appName").val(),
    			appCode:$("#appCode").val(),
    			appUrl:$("#appUrl").val(),
    			downloadUrl:$("#downloadUrl").val(),
    			isPay:$("#isPay").val(),
    			state:$("#state").val(),
    			appInfo:$("#appInfo").val(),
    			tempDirId:$("#tempDirId").val(),
    			fileName:$("#fileName").val(),
    			picPath:$("#filePath").val(),
				tempFileDir:$("#fileDir").val(),
				appProvider:$("#appProvider").val(),
				deleteFileIds:$("#deleteFileIds").val(),
				appLogo:$("#appLogo").val()
    	};
    	ajaxAction('post',url,$.toJSON(data),'json','editApp');
    }
    
  //ajax请求
    function ajaxAction(type, url, reqData, returnType, requestName) {
    	$.ajax({
    		type : type,
    		url : url,
    		data : reqData,
    		async : false,
    		dataType : returnType,
    		contentType : 'application/json',
    		success : function(data) {
    			if (requestName == "editApp"){
    				var code=data.code;
    				if(code=='0'){
    					layer.msg('编辑成功！');
    					window.history.back();
    				}else if(code=='1'){
    					layer.msg('服务器异常，请稍后重试！');
    				}	
    			}else if (requestName == "queryAppById"){
    				var code=data.code;
    				if(code=='0'){
    					showData(data.appInfomation);
    				}else if(code=='1'){
    					layer.msg('服务器异常，请稍后重试！');
    				}	
    			}
    		}
    	});
    }
    
    function checkFile(){
	$("#filePathName").click();
     }
     
   //上传附件
   function ajaxUploadFile(id){
	
	var contentFlag="0";//定义不合格
	var content = document.getElementById(id).value;
	if(content.length==null||content.length==''){
		layer.msg('请选择附件！');
		return false;
	}
	
	var kkk="\\";
	var fileTextkgbh =content.substring(content.lastIndexOf(kkk)+1,content.length);
	if (fileTextkgbh.indexOf(',')>=0){
		layer.msg('亲，您选择的上传文件名称包含，！');
		return false;
	}
	if (fileTextkgbh.indexOf('，')>=0){
		layer.msg('亲，您选择的上传文件名称包含，！');
		return false;
	}
	var fileText =content.substring(content.lastIndexOf(".")+1,content.length);
	fileText =fileText.toLowerCase();
	
	var isExist = $.inArray(fileText, fileType);
	if (isExist<0) {
		contentFlag=="0";
		layer.msg('亲，您选择的上传文件不是有效的文件类型！');
		return false;
	}
	
	var url =basePath+"/batchUpload?tempDirId="+$('#tempDirId').val();
	$("#onloading").ajaxStart(function(){
		$(this).show();
	}).ajaxComplete(function(){
		$(this).hide();
	});
	$.ajaxFileUpload({
		url : url, // 你处理上传文件的服务端
		secureuri : false,
		fileElementId : id,
		dataType : 'json',
		folder:'app/img',  //存放子文件夹名称
		success : function(data,status) {
						initfile(data.fileName,data.tempShowDir);
						if($("#fileName").val()!=""){
							$("#fileName").val($("#fileName").val()+data.fileName+",");
							$("#filePath").val($("#filePath").val()+data.filePath+",");
							$("#fileDir").val($("#fileDir").val()+data.tempDir+",");
						}else{
							$("#fileName").val(data.fileName+",");
							$("#filePath").val(data.filePath+",");
							$("#fileDir").val(data.tempDir+",");
						}
					},
					error : function(data, status, e){
						layer.msg("附件上传失败!");
					}
				});
		return false;
}

//删除文件
function deleteFile(obj){
	$(obj).parent().parent().remove();
}

//删除实际文件
function deleteRealFile(obj){
    var id=obj.id;
    if($("#deleteFileIds").val()!=""){
			$("#deleteFileIds").val($("#deleteFileIds").val()+id+",");
		}else{
			$("#deleteFileIds").val(id+",");			
		}
	$(obj).parent().parent().remove();
}

//预览文件
function previewFile(path){
	$("#previewFileImgShow").attr("src",basePath+'/'+path);
	if($("#previewFileImgShow").attr("src") != ''){
		var imgWidth = ($('#previewFileImgShow').width()) + "px";
        var imgHeight = ($('#previewFileImgShow').height()) + "px";
        layer.open({
            type: 1,
            title: false,
            closeBtn: true,
            area: [imgWidth, imgHeight],
            skin: 'layui-layer-nobg', //没有背景色
            shadeClose: true,
            content: $('#previewFileImgShow')
        });
	}
}


//上传附件后显示
function initfile(fileName,tempDir){
	var html='<div>';
	html+='<img src="'+basePath+'/'+tempDir+'" style="width: 30px;height: 30px; margin:3px ;"/><span> <strong>'+fileName+'</strong>';
	html+='<a data-toggle="modal" data-target=".bs-example-modal-sm" href="javascript:;" onclick="previewFile(\''+tempDir+'\' );">预览</a>|';	
	html+='<a href="javascript:;" onclick="deleteFile(this);">删除</a></span><br/>';
	html+='</div>';
	$("#fileContent").append(html);
}  

function makeUUID() {
    var S4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4()  + S4()  + S4()  + S4()  + S4() + S4() + S4());
}

//上传图片
function uploadImg(target,id, imgId, hiddId){
	var fileSize = 0;
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
	var content = $('#'+id).val();
	if (content.length == '') {
		layer.msg("请选择图片!");
		return false;
	}
	var fileType = content.substring(content.lastIndexOf(".") + 1);
	
	if(fileType.toLowerCase() != "jpg"&&fileType.toLowerCase() != "jpeg"&&fileType.toLowerCase() != "gif"&&fileType.toLowerCase() != "png"){
		layer.msg("目前支持jpg、jpeg、gif、png格式文件,请重新选择");
		return false;
	}
	if (isIE) {
		var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
		var file = fileSystem.GetFile (content);      
		fileSize = file.Size;
	}else{
		fileSize = target.files[0].size;
	}
	var size = fileSize / 1024;
	if(size>50){
		layer.msg("上传图片大小不能超过50k!");
		return false;
	}
	$.ajaxFileUpload({
		url : basePath + "/imgUpload", // 你处理上传文件的服务端
		secureuri : false,
		fileElementId : id,
		dataType : 'json',
		folder:'others/img',  //存放子文件夹名称
		success : function(data,status) {
			$("#" + imgId).attr("src", basePath+'/'+data.filePath);
			$("#" + hiddId).val(data.filePath);
			// alert("上传成功!");
		},
		error : function(data, status, e) {
			layer.msg("上传图片失败!");
		}
	});
	
	return false;
}