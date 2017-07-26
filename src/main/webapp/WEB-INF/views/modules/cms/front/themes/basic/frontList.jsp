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
	<div class="row" style="width:990px;margin: 10px auto;">
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
			<c:if test="${category.module eq 'article'}">
				<ul style="margin-left: 0;">
					<c:forEach items="${page.list}" var="article">
						<li style="border-bottom: 1px dotted #7a7a7a; line-height: 31px;"><span
							class="pull-right"><fmt:formatDate
									value="${article.updateDate}" pattern="yyyy.MM.dd" /></span><a
							href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,96)}</a></li>
					</c:forEach>
				</ul>
				<div class="pagination">${page}</div>
				<script type="text/javascript">
					function page(n, s) {
						location = "${ctx}/list-${category.id}${urlSuffix}?pageNo="
								+ n + "&pageSize=" + s;
					}
				</script>
			</c:if>
			<c:if test="${category.module eq 'link'}">
				<ul style="margin-left: 0;">
					<c:forEach items="${page.list}" var="link">
						<li style="border-bottom: 1px dotted #7a7a7a; line-height: 31px;"><a
							href="${link.href}" target="_blank" style="color:${link.color}"><c:out
									value="${link.title}" /></a></li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${category.module eq 'pictures'}">
				<c:forEach items="${page.list}" var="article">
					<ul style="margin-left: 0;">
						<li style="border-bottom: 1px dotted #7a7a7a; width:100%;float:left;"> 
								<div style="float:left;width:40%"><img alt="" src="${article.image}" style="" height="200px" width="200px"></div>
								<div style="float:left;width:40%"><a href="${article.url}" style="color:${article.color}"><span>名称：</span>${fns:abbr(article.title,96)}</a>
								<div><span>简介：</span>${article.description}</div></div>
						</li>
					</ul>
				</c:forEach>
				<div class="pagination">${page}</div>
				<script type="text/javascript">
					function page(n, s) {
						location = "${ctx}/list-${category.id}${urlSuffix}?pageNo="
								+ n + "&pageSize=" + s;
					}
				</script>
			</c:if>
		</div>
	</div>
</body>
</html>