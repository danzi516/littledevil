jQuery.extend({

    createUploadIframe: function(id, uri)
	{
			//create frame
            var frameId = 'jUploadFrame' + id;
            //========================================================add
            if (window.ActiveXObject) {  
                //fix ie9 and ie 10-------------  
                if (jQuery.browser.version == "9.0" || jQuery.browser.version == "10.0") {  
                  var io = document.createElement('iframe');  
                  io.id = frameId;  
                  io.name = frameId;  
                } else if (jQuery.browser.version == "6.0" || jQuery.browser.version == "7.0" || jQuery.browser.version == "8.0") {  
                  var io = document.createElement('<iframe id="' + frameId + '" name="' + frameId + '" />');  
                  if (typeof uri == 'boolean') {  
                    io.src = 'javascript:false';  
                  } else if (typeof uri == 'string') {  
                    io.src = uri;  
                  }  
                }  
              } else {  
                var io = document.createElement('iframe');  
                io.id = frameId;  
                io.name = frameId;  
              }  
            //========================================================add
            /*var io = document.createElement('iframe');
            io.id = frameId;
            io.name = frameId;*/
            
            io.style.position = 'absolute';
            io.style.top = '-1000px';
            io.style.left = '-1000px';

            document.body.appendChild(io);

            return io;			
    },
    createUploadForm: function(id, fileElementId)
	{
		//create form
    	//alert("1"+id);
		var formId = 'jUploadForm' + id;
		var fileId = 'jUploadFile' + id;
		//alert("----1");
		var form = jQuery('<form  action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');	
		//alert("----2"+fileElementId);
		var oldElement = jQuery("#" + fileElementId);
		//alert("----3"+oldElement.val() );
		
		var newElement = jQuery(oldElement).clone(true);
		//var newElement = jQuery("#" + fileElementId);
		//alert("----3"+oldElement.val() );
		//alert("2");
		jQuery(oldElement).attr('id', fileId);
		//alert("3");
		jQuery(oldElement).before(newElement);
		//alert("4");
		jQuery(oldElement).appendTo(form);
		//alert("5");
		//set attributes
		jQuery(form).css('position', 'absolute');
		jQuery(form).css('top', '-1200px');
		jQuery(form).css('left', '-1200px');
		jQuery(form).appendTo('body');
		//alert("6");
		return form;
    },

    ajaxFileUpload: function(s) {
        // TODO introduce global settings, allowing the client to modify them for all requests, not only timeout
        s = jQuery.extend({}, jQuery.ajaxSettings, s);
        var id = s.fileElementId;    
       // alert("    000=========="+id+"              ---"+s.fileElementId);
		var form = jQuery.createUploadForm(id, s.fileElementId);
		//alert("7");
		var io = jQuery.createUploadIframe(id, s.secureuri);
		var frameId = 'jUploadFrame' + id;
		var formId = 'jUploadForm' + id;		
        
        if( s.global && ! jQuery.active++ )
		{
			// Watch for a new set of requests
			jQuery.event.trigger( "ajaxStart" );
		}            
        var requestDone = false;
        // Create the request object
        var xml = {};   
        if( s.global )
        {
        	jQuery.event.trigger("ajaxSend", [xml, s]);
        }            
        
        var uploadCallback = function(isTimeout)
		{		
			// Wait for a response to come back	
			var io = document.getElementById(frameId);
            try 
			{				
				if(io.contentWindow)
				{
					 xml.responseText = io.contentWindow.document.body?io.contentWindow.document.body.textContent:null;
                	 xml.responseXML = io.contentWindow.document.XMLDocument?io.contentWindow.document.XMLDocument:io.contentWindow.document;
					 
				}else if(io.contentDocument)
				{
					 xml.responseText = io.contentDocument.document.body?io.contentDocument.document.body.textContent:null;
                	xml.responseXML = io.contentDocument.document.XMLDocument?io.contentDocument.document.XMLDocument:io.contentDocument.document;
				}						
            }catch(e)
			{
				jQuery.handleError(s, xml, null, e);
			}
            if( xml || isTimeout == "timeout") 
			{				
                requestDone = true;
                var status;
                try {
                    status = isTimeout != "timeout" ? "success" : "error";
                    // Make sure that the request was successful or notmodified
                    if( status != "error" )
					{
                        // process the data (runs the xml through httpData regardless of callback)
                        var data = jQuery.uploadHttpData( xml, s.dataType );                        
                        if( s.success )
                        {
							// ifa local callback was specified, fire it and pass it the data
                        	s.success( data, status );
                        };                 
                        if( s.global )
                        {
							// Fire the global callback
                        	jQuery.event.trigger( "ajaxSuccess", [xml, s] );
                        };                            
                    } else
                    {
                    	jQuery.handleError(s, xml, status);
                    }
                        
                } catch(e) 
				{
                    status = "error";
                    jQuery.handleError(s, xml, status, e);
                };                
                if( s.global )
                {
					// The request was completed
                	jQuery.event.trigger( "ajaxComplete", [xml, s] );
                };
                    

                // Handle the global AJAX counter
                if(s.global && ! --jQuery.active)
                {
                	jQuery.event.trigger("ajaxStop");
                };
                if(s.complete)
                {
                	 s.complete(xml, status);
                } ;                 

                jQuery(io).unbind();

                setTimeout(function()
									{	try 
										{
											jQuery(io).remove();
											jQuery(form).remove();	
											
										} catch(e) 
										{
											jQuery.handleError(s, xml, null, e);
										}									

									}, 100);

                xml = null;

            };
        }
        // Timeout checker
        if( s.timeout > 0 ) 
		{
            setTimeout(function(){
                
                if( !requestDone )
                {
					// Check to see ifthe request is still happening
                	uploadCallback( "timeout" );
                }
                
            }, s.timeout);
        }
        try 
		{
        	
			var form = jQuery('#' + formId);
			jQuery(form).attr('action', s.url);
			jQuery(form).attr('method', 'POST');
			jQuery(form).attr('target', frameId);
			jQuery(form).append('<input type="text" value="'+s.folder+'" name="folder" id="folder">');
			
			/*if(s.width != null && s.width != "" && s.width != undefined){
				jQuery(form).append('<input type="text" value="'+s.width+'" name="width" id="width">');
			}
			
			if(s.height != null && s.height != "" && s.height != undefined){
				jQuery(form).append('<input type="text" value="'+s.height+'" name="height" id="height">');
			}*/
			
			if(s.fileType != null && s.fileType != "" && s.fileType != undefined){
				jQuery(form).append('<input type="text" value="'+s.fileType+'" name="fileType" id="fileType">');
			}
			
			
            if(form.encoding)
			{
                form.encoding = 'multipart/form-data';				
            }
            else
			{				
                form.enctype = 'multipart/form-data';
            }			
            jQuery(form).submit();

        } catch(e) 
		{			
            jQuery.handleError(s, xml, null, e);
        }
        if(window.attachEvent){
            document.getElementById(frameId).attachEvent('onload', uploadCallback);
        }
        else{
            document.getElementById(frameId).addEventListener('load', uploadCallback, false);
        } 		
        return {abort: function () {}};	

    },

    uploadHttpData: function( r, type ) {
        var data = !type;
        data = type == "xml" || data ? r.responseXML : r.responseText;
        // ifthe type is "script", eval it in global context
        if( type == "script" )
        {
        	jQuery.globalEval( data );
        }
            
        // Get the JavaScript object, ifJSON is used.
        if( type == "json" )
        {
        	/*var ends = data.indexOf('}');
        	data = data.substr(0,ends+1);*/
        	eval( "data = " + data );
        }
            
        // evaluate scripts within html
        if( type == "html" )
        {
        	jQuery("<div>").html(data).evalScripts();
        }
            
        return data;
    },
    
    handleError: function( s, xhr, status, e ) {
        if ( s.error ) {
            s.error.call( s.context || window, xhr, status, e );
        }
        if ( s.global ) {
            (s.context ? jQuery(s.context) : jQuery.event).trigger( "ajaxError", [xhr, s, e] );
        }
    }
});

