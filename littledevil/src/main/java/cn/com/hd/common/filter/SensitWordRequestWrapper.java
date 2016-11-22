package cn.com.hd.common.filter;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 实现包装request对象
 * @author Administrator
 *
 */
public class SensitWordRequestWrapper extends HttpServletRequestWrapper{

	private String sensitWord;
	
	public SensitWordRequestWrapper(HttpServletRequest request, String sensitWord) {
		super(request);
		this.sensitWord = sensitWord;
		
		doParameterFilter();
	}
	
	/**
	 * 过滤请求内容
	 */
	public void doParameterFilter() {

		/**
		 * 获取参数内容
		 */
		Map<String,String[]> map = super.getParameterMap();  
        if(!map.isEmpty()){  
            Set<String> keySet = map.keySet();  
            Iterator<String> keyIt = keySet.iterator();  
            while(keyIt.hasNext()){  
                String key = keyIt.next();  
                String[] values=map.get(key);  
                for(int i=0;i<values.length;i++){  
                    map.get(key)[i]=this.replaceWrods(values[i]);  
                }  
            }  
        }  
	}
	
	/**
	 * 替换关键词
	 */
	private String replaceWrods(String content){
		String[] words = sensitWord.split(",");
		
		for(String word : words){
			if(content.contains(word)){
				content = content.replace(word, "**");
			}
		}
		
		return content;
	}

}
