
function getAllResourceNum(){
	var url=basePath+"/statisticsResource/statisticsResourceNum";
	resourceStatisticsAjaxAction("get", url, "", "json", "getAllResourceNum");
}
function statisticsByResourceType(){
	var url=basePath+"/statisticsResource/statisticsByResourceTypeForCondition";
	var data={
			facultyId:$("#resourceType_faculty").val(),
			subjId:$("#resourceType_subj").val()
	}
	resourceStatisticsAjaxAction("get", url, data, "json", "statisticsByResourceType");
}
function statisticsBySubj(){
	var url=basePath+"/statisticsResource/statisticsBySubj";
	var data={
			facultyId:$("#subj_faculty").val()
	}
	resourceStatisticsAjaxAction("get", url, data, "json", "statisticsBySubj");
}
function statisticsByFaculty(){
	var url=basePath+"/statisticsResource/statisticsByFaculty";
	resourceStatisticsAjaxAction("get", url, "", "json", "statisticsByFaculty");
}

function getsubjList(){
	var url=basePath+"/subj/selectAllSubj";
	resourceStatisticsAjaxAction("get", url, "", "json", "getsubjList");
}

function initResourceChart(tagName,titlename,initData){
    			var dom = document.getElementById(tagName);
			    var myChart = echarts.init(dom);
			    var app = {};
			    var labelFromatter = {
				    normal : {
				        label : {
				            formatter : function (params){
				                return params.value
				            }
				        }
				    },
				};
			    option = null;
			    option = {
			        tooltip : {
			            trigger: 'item',
			            formatter: "{a} <br/>{b} : {c} ({d}%)"
			        },
			        series : [
			            {
			                name: titlename,
			                type: 'pie',
			                radius : '80%',
			                center: ['50%', '60%'],
			                data:initData,
			                itemStyle: {
			                   normal:{
				                  label:{
					                    show: true,
					                    formatter: '{b} : {c}'
					                  },
					               labelLine :{show:true}
				                },
			                    emphasis: {
			                        shadowBlur: 10,
			                        shadowOffsetX: 0,
			                        shadowColor: 'rgba(0, 0, 0, 0.5)'
			                    }
			                }
			            }
			        ]
			    };
			    
			    if (option && typeof option === "object") {
			        //var startTime = +new Date();
			        myChart.setOption(option, true);
			        /*var endTime = +new Date();
			        var updateTime = endTime - startTime;
			        console.log("Time used:", updateTime);*/
			    }
    }
    
    function initResourceBarChart(tagName,titleName,initXData,initYData){
    			var dom = document.getElementById(tagName);
			    var myChart = echarts.init(dom);
			    var app = {};
			    option = null;
			    option = {
			        tooltip : {
			            trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
			        },
			        grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				     xAxis : [
				        {
				            type : 'category',
				            data :  initXData
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
			        series : [
			            {
			                name:titleName,
				            type:'bar',
				            itemStyle:labelFromatter,
				            data:initYData
						}
			        ]
			    };
			    
			    if (option && typeof option === "object") {
			        //var startTime = +new Date();
			        myChart.setOption(option, true);
			        /*var endTime = +new Date();
			        var updateTime = endTime - startTime;
			        console.log("Time used:", updateTime);*/
			    }
    }
    
    function initResourceBarChart(tagName,initXData,initReourceData,initCollectionData,initBrowseData,initDownloadData){
    			var dom = document.getElementById(tagName);
			    var myChart = echarts.init(dom);
			    var app = {};
			    option = null;
			    option = {
			        tooltip : {
			            trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
			        },
			        legend: {
				        data:['资源数','收藏次数','浏览次数','下载次数']
				    },
			        grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				     xAxis : [
				        {
				            type : 'category',
				            data :  initXData
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
			        series : [
			            {
			                name:"资源数",
				            type:'bar',
				            itemStyle: {normal: {label : {show: true}}},
				            data:initReourceData
						},
						{
			                name:"收藏次数",
				            type:'bar',
				            itemStyle: {normal: {label : {show: true}}},
				            data:initCollectionData
						},
						{
			                name:"浏览次数",
				            type:'bar',
				            itemStyle: {normal: {label : {show: true}}},
				            data:initBrowseData
						},
						{
			                name:"下载次数",
				            type:'bar',
				            itemStyle: {normal: {label : {show: true}}},
				            data:initDownloadData
						}
			        ]
			    };
			    
			    if (option && typeof option === "object") {
			        //var startTime = +new Date();
			        myChart.setOption(option, true);
			        /*var endTime = +new Date();
			        var updateTime = endTime - startTime;
			        console.log("Time used:", updateTime);*/
			    }
    }
    
    function resourceStatisticsAjaxAction(type, url, reqData, returnType, requestName) {
    	$.ajax({
    		type : type,
    		url : url,
    		data : reqData,
    		async : false,
    		dataType : returnType,
    		success : function(data) {
    		    if(requestName == "getAllResourceNum"){
    				var code=data.code;
    				if(code=="0"){
    					var record=data.record;
    					var initdata=[];
    					initdata.push({"value":record.resourceNum,"name":"资源总数"});
    					initdata.push({"value":record.collectionNum,"name":"收藏次数"});
    					initdata.push({"value":record.browseNum,"name":"浏览次数"});
    					initdata.push({"value":record.downloadNum,"name":"下载次数"});
    					initResourceChart("resourceBarContainer","统计项",initdata);
    				}else{
    					$("#resourceBarContainer").text("加载数据失败！");
    				}
    			}else  if(requestName == "statisticsByResourceType"){
    				var code=data.code;
    				if(code=="0"){
    					var list=data.list;
    					var initXData=[];
    					var initReourceData=[];
    					var initCollectionData=[];
    					var initBrowseData=[];
    					var initDownloadData=[];
    					for(var i=0;i<list.length;i++){
    						initXData.push(list[i].resourceTypeName);
    						initReourceData.push(list[i].resourceNum);
    						initCollectionData.push(list[i].collectionNum);
    						initBrowseData.push(list[i].browseNum);
    						initDownloadData.push(list[i].downloadNum);
    					}
    					initResourceBarChart("resourceTypeBarContainer",initXData,initReourceData,initCollectionData,initBrowseData,initDownloadData);
    				}else{
    					$("#resourceTypeBarContainer").text("加载数据失败！");
    				}
    			}else  if(requestName == "statisticsByFaculty"){
    				var code=data.code;
    				if(code=="0"){
    					var list=data.list;
    					var initXData=[];
    					var initReourceData=[];
    					var initCollectionData=[];
    					var initBrowseData=[];
    					var initDownloadData=[];
    					for(var i=0;i<list.length;i++){
    						initXData.push(list[i].facultyName);
    						initReourceData.push(list[i].resourceNum);
    						initCollectionData.push(list[i].collectionNum);
    						initBrowseData.push(list[i].browseNum);
    						initDownloadData.push(list[i].downloadNum);
    					}
    					initResourceBarChart("facutlyBarContainer",initXData,initReourceData,initCollectionData,initBrowseData,initDownloadData);
    				}else{
    					$("#facultyBarContainer").text("加载数据失败！");
    				}
    			}else  if(requestName == "statisticsBySubj"){
    				var code=data.code;
    				if(code=="0"){
    					var list=data.list;
    					var initXData=[];
    					var initReourceData=[];
    					var initCollectionData=[];
    					var initBrowseData=[];
    					var initDownloadData=[];
    					for(var i=0;i<list.length;i++){
    						initXData.push(list[i].subjName);
    						initReourceData.push(list[i].resourceNum);
    						initCollectionData.push(list[i].collectionNum);
    						initBrowseData.push(list[i].browseNum);
    						initDownloadData.push(list[i].downloadNum);
    					}
    					initResourceBarChart("subjBarContainer",initXData,initReourceData,initCollectionData,initBrowseData,initDownloadData);
    				}else{
    					$("#subjBarContainer").text("加载数据失败！");
    				}
    			}else  if(requestName == "getsubjList"){
    				var code=data.code;
    				if(code=="0"){
    					var list=data.list;
    					$("#resourceType_subj").empty();
    					$("#resourceType_subj").append("<option value=''>科目</option>");
    					for(var i=0;i<list.length;i++){
    						var html="<option value='"+list[i].id+"'>"+list[i].subjName+"</option>";
    						$("#resourceType_subj").append(html);
    					}
    				}
    			}
    		}
    	});
    }