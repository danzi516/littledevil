package cn.com.hd.common.client;

import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;

@Component
public class WenxinClient {

	  private RestTemplate template = new RestTemplate();
	  
	  @Value("#{properties['WEIXIN_PATH']}")
	 private String WEIXIN_PATH;
	  
	  public String schoolSendWeinXin(Map map) {
		    String output = template.postForObject(WEIXIN_PATH + "/starc/notice",JSONObject.fromObject(map), String.class);
		    return output;
	}
	  
	  public String toSchoolSendJxt(Map map) {
		    String output = template.postForObject(WEIXIN_PATH + "/starc/school/create",JSONObject.fromObject(map), String.class);
		    return output;
	} 
	  
	  public String toSchoolDepartmentClazzSendJxt(Map map) {
		    String output = template.postForObject(WEIXIN_PATH + "/starc/org/createOrUpdate",JSONObject.fromObject(map), String.class);
		    return output;
	} 
	 
	  public String toSchoolTeacherSendJxt(Map map) {
		    String output = template.postForObject(WEIXIN_PATH + "/starc/teacher/create",JSONObject.fromObject(map), String.class);
		    return output;
	}
	  public String toSchoolTeacherClazzAndDeptSendJxt(Map map) {
		    String output = template.postForObject(WEIXIN_PATH + "/starc/teachRelation/create",JSONObject.fromObject(map), String.class);
		    return output;
	}
	  public String toSchoolStudentAndFamilySendJxt(Map map) { 
		  JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		  jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		 // jsonConfig.setExcludes(new String[]{"ratePersonals", "channelPersonals"});  //此处是亮点，只要将所需忽略字段加到数组中即可，在实际测试中，我发现在所返回数组中，存在大量无用属性，
		  jsonConfig.setExcludes(new String[]{"genderStr"});
		  String output = template.postForObject(WEIXIN_PATH + "/starc/student/create",JSONObject.fromObject(map, jsonConfig), String.class);
		  return output;
	}
}
