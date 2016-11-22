package cn.com.hd.common.exception;

import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

public class CustomMappingExceptionResolver implements HandlerExceptionResolver {

	/**
	 * 定义日志
	 */
	private static Logger logger = LoggerFactory.getLogger(CustomMappingExceptionResolver.class);

	public static final String DEFAULT_EXCEPTION_ATTRIBUTE = "exception";

	private Properties exceptionMappings;

	transient private Class excludedExceptions[];

	private String defaultErrorView;

	private Integer defaultStatusCode;

	private Map statusCodes;

	private String exceptionAttribute;

	public CustomMappingExceptionResolver() {
		statusCodes = new HashMap();
		exceptionAttribute = "exception";
	}

	public void setExceptionMappings(Properties mappings) {
		exceptionMappings = mappings;
	}

	public void setExcludedExceptions(Class excludedExceptions[]) {
		this.excludedExceptions = excludedExceptions;
	}

	public void setDefaultErrorView(String defaultErrorView) {
		this.defaultErrorView = defaultErrorView;
	}

	public void setStatusCodes(Properties statusCodes) {
		String viewName;
		Integer statusCode;
		for (Enumeration enumeration = statusCodes.propertyNames(); enumeration.hasMoreElements(); this.statusCodes.put(viewName, statusCode)) {
			viewName = (String) enumeration.nextElement();
			statusCode = new Integer(statusCodes.getProperty(viewName));
		}

	}

	public void addStatusCode(String viewName, int statusCode) {
		statusCodes.put(viewName, Integer.valueOf(statusCode));
	}

	public Map getStatusCodesAsMap() {
		return Collections.unmodifiableMap(statusCodes);
	}

	public void setDefaultStatusCode(int defaultStatusCode) {
		this.defaultStatusCode = Integer.valueOf(defaultStatusCode);
	}

	public void setExceptionAttribute(String exceptionAttribute) {
		this.exceptionAttribute = exceptionAttribute;
	}

	protected String determineViewName(Exception ex, HttpServletRequest request) {
		String viewName = null;
		if (excludedExceptions != null) {
			Class arr$[] = excludedExceptions;
			int len$ = arr$.length;
			for (int i$ = 0; i$ < len$; i$++) {
				Class excludedEx = arr$[i$];
				if (excludedEx.equals(ex.getClass()))
					return null;
			}

		}
		if (exceptionMappings != null){
			viewName = findMatchingViewName(exceptionMappings, ex);
		}
		if (viewName == null && defaultErrorView != null) {
			viewName = defaultErrorView;
		}
		return viewName;
	}

	protected String findMatchingViewName(Properties exceptionMappings, Exception ex) {
		String viewName = null;
		String dominantMapping = null;
		int deepest = 2147483647;
		Enumeration names = exceptionMappings.propertyNames();
		do {
			if (!names.hasMoreElements()){
				break;
			}
			String exceptionMapping = (String) names.nextElement();
			int depth = getDepth(exceptionMapping, ex);
			if (depth >= 0 && (depth < deepest || depth == deepest && dominantMapping != null && exceptionMapping.length() > dominantMapping.length())) {
				deepest = depth;
				dominantMapping = exceptionMapping;
				viewName = exceptionMappings.getProperty(exceptionMapping);
			}
		} while (true);
		/*if (viewName != null)
			logger.error((new StringBuilder()).append("Resolving to view '")
					.append(viewName).append("' for exception of type [")
					.append(ex.getClass().getName())
					.append("], based on exception mapping [")
					.append(dominantMapping).append("]").toString());*/
		return viewName;
	}

	protected int getDepth(String exceptionMapping, Exception ex) {
		return getDepth(exceptionMapping, ex.getClass(), 0);
	}

	private int getDepth(String exceptionMapping, Class exceptionClass,
			int depth) {
		
		if (exceptionClass.getName().contains(exceptionMapping)) {
			return depth;
		}
		if (exceptionClass.getName().equals("java.lang.Throwable")) {
			return -1;
		} else {
			return getDepth(exceptionMapping, exceptionClass.getSuperclass(),depth + 1);
		}
	}

	protected Integer determineStatusCode(HttpServletRequest request,String viewName) {
		if (statusCodes.containsKey(viewName)){
			return (Integer) statusCodes.get(viewName);
		}else{
			return defaultStatusCode;
		}
	}

	protected void applyStatusCodeIfPossible(HttpServletRequest request,
			HttpServletResponse response, int statusCode) {
		if (!WebUtils.isIncludeRequest(request)) {
			if (logger.isDebugEnabled())
				logger.debug((new StringBuilder())
						.append("Applying HTTP status code ")
						.append(statusCode).toString());
			response.setStatus(statusCode);
			request.setAttribute("javax.servlet.error.status_code",
					Integer.valueOf(statusCode));
		}
	}

	protected ModelAndView getModelAndView(String viewName, Exception ex,
			HttpServletRequest request) {
		return getModelAndView(viewName, ex);
	}

	protected ModelAndView getModelAndView(String viewName, Exception ex) {
		ModelAndView mv = new ModelAndView(viewName);
		if (exceptionAttribute != null) {
			if (logger.isDebugEnabled())
				logger.debug((new StringBuilder()).append("Exposing Exception as model attribute '").append(exceptionAttribute).append("'").toString());
			mv.addObject(exceptionAttribute, ex);
		}
		return mv;
	}

	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		logger.error((new StringBuilder()).append("发生异常所在类 [").append(handler).append("], 异常描述: ").append(ex).toString());
		
		String viewName = determineViewName(ex, request);
		
		if (viewName != null) {
			Integer statusCode = determineStatusCode(request, viewName);
			if (statusCode != null){
				applyStatusCodeIfPossible(request, response, statusCode.intValue());
			}
			return getModelAndView(viewName, ex, request);
		} else {
			return null;
		}
	}
}
