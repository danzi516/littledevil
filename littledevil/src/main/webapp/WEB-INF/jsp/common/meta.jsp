<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%-- <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform" %>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">    
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<c:set var="webRoot" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="${user.id}" />
<c:set var="userName" value="${user.userName}" />
<c:set var="userType" value="${user.userType}" />
<c:set var="user" value="${user}" />
<c:set var="msgUrl" value="http://localhost:8080/message" />
