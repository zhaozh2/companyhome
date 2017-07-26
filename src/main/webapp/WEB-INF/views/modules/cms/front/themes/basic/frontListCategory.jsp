<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${category.name}</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${category.description}" />
<meta name="keywords" content="${category.keywords}" />
<style>
ul {
	list-style-type: none;
}
</style>
</head>
<body>
	<div class="row" style="width: 990px; margin: 10px auto;">
		<div class="span3">
			<div style="margin: 10px 0px 10px 0px;">
				<h4
					style="background: url(/huaxin/img/n3.jpg) no-repeat 0 0; height: 60px; text-align: center; color: #fff;">
					<span style="position: relative; top: 12px;right: 16px;">栏目导航</span>
				</h4>
				<div style="border-bottom: solid 1px #ddd; border-left: solid 1px #ddd; border-right: solid 1px #ddd; width: 180px;">
					<div>
						<ul>
							<cms:frontCategoryList categoryList="${categoryList}" />
						</ul>
					</div>
				</div>
			</div>
			<div style="background: url(/huaxin/img/left.jpg) no-repeat 0 0; height: 200px; text-align: center; color: #fff;">
			
			</div>
		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<cms:frontCurrentPosition category="${category}" />
			</ul>
		</div>
		<div class="span9">
			<c:set var="index" value="1" />
			<c:forEach items="${categoryList}" var="tpl">
				<c:if test="${tpl.inList eq '1' && tpl.module ne ''}">
					<c:set var="index" value="${index+1}" />
				${index % 2 eq 0 ? '<div class="row">':''}
		    	<div style="width:100%;">
						<h4 style="margin: 0 0 10px 25px;color:#05b8a2;">
							<small><a href="${ctx}/list-${tpl.id}${urlSuffix}"
								class="pull-right">更多&gt;&gt;</a></small>${tpl.name}</h4>
						<c:if test="${tpl.module eq 'article'}">
							<ul>
								<c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, '')}"
									var="article">
									<li style="border-bottom: 1px dotted #7a7a7a;"><span
										class="pull-right"><fmt:formatDate
												value="${article.updateDate}" pattern="yyyy.MM.dd" /></span><a
										href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
										style="color:${article.color}">${fns:abbr(article.title,40)}</a></li>
								</c:forEach>
							</ul>
						</c:if>
						<c:if test="${tpl.module eq 'link'}">
							<ul>
								<c:forEach items="${fnc:getLinkList(site.id, tpl.id, 5, '')}"
									var="link">
									<li style="border-bottom: 1px dotted #7a7a7a;"><span
										class="pull-right"><fmt:formatDate
												value="${link.updateDate}" pattern="yyyy.MM.dd" /></span><a
										target="_blank" href="${link.href}"
										style="color:${link.color}">${fns:abbr(link.title,40)}</a></li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
		    	${index % 2 ne 0 ? '</div>':''}
			</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>