<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ attribute name="categoryList" type="java.util.List" required="true" description="栏目列表"%>
<c:forEach items="${categoryList}" var="tpl">
  	<%--<c:if test="${category.inList eq '1'}"> --%>
   		<c:choose>
   			<c:when test="${not empty tpl.href}">
    			<c:choose>
	    			<c:when test="${fn:indexOf(tpl.href, '://') eq -1 && fn:indexOf(tpl.href, 'mailto:') eq -1}">
	    			<c:set var="url" value="${ctx}${tpl.href}"/></c:when><c:otherwise><c:set var="url" value="${tpl.href}"/></c:otherwise>
	    		</c:choose>
   			</c:when>
   			<c:otherwise><c:set var="url" value="${ctx}/list-${tpl.id}${urlSuffix}"/></c:otherwise>
   		</c:choose>
		<li style="height: 30px;background: url(/huaxin/img/n1.jpg) no-repeat 0 0;position: relative;right: 19px;" class="${requestScope.category.id eq tpl.id ?'menu_activ':''}">
			<c:choose><c:when test="${fn:length(tpl.name) gt 12}">
				<a href="${url}" target="${tpl.target}" style="line-height:16px;padding-top:3px;padding-left: 20px;">${tpl.name}</a>
			</c:when><c:otherwise>
				 <a href="${url}" target="${tpl.target}" ${fn:length(tpl.name) gt 10?'style="font-size:12px;"':''} style="padding-left: 20px;">${tpl.name}</a>
			</c:otherwise></c:choose></li>
	<%--</c:if> --%>
</c:forEach>