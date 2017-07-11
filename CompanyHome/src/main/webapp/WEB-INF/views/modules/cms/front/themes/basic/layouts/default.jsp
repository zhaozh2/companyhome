<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<link href="/huaxin/css/list.css" rel="stylesheet" type="text/css">
<link href="/huaxin/css/lib.min.css" rel="stylesheet" type="text/css">
<link href="/huaxin/css/page_home.min.css?2" rel="stylesheet"
	type="text/css">
<title><sitemesh:title default="欢迎光临" /></title>
<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!-- Baidu tongji analytics -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
<sitemesh:head />
<script>
	function init() {
		setInterval('changeimg()', 10000);
	}

	var num = 1;
	function changeimg() {
		$('#Image1').attr("src", "/huaxin/img/ad_" + num + ".png");
		num++;
		if (num == 4) {
			num = 1;
		}
	};
</script>
</head>
<body onload="init();">
	<table width="100%" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tbody>
			<tr>
				<td height="172" colspan="7" background="/huaxin/img/ad.png"><table
						width="344" height="172" border="0" align="right" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td align="right"><img src="/huaxin/img/ad_1.png"
									id="Image1" width="344" height="172"></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<div class="navbar navbar-fixed-top"
			style="position: static; width: 100%; margin: 0 auto;" align="center">
			<div class="navbar-inner">
				<div class="container">
					<div class="nav-collapse">
						<ul id="main_nav" class="nav nav-pills">
							<li class="${not empty isIndex && isIndex ? 'active' : ''}"><a
								href="${ctx}/index-1${fns:getUrlSuffix()}"><span>${site.id eq '1'?'首　 页':'返回主站'}</span></a></li>
							<c:forEach items="${fnc:getMainNavList(site.id)}" var="category"
								varStatus="status">
								<c:if test="${status.index lt 20}">
									<c:set var="menuCategoryId" value=",${category.id}," />
									<li
										class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}"><a
										href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="content">
			<sitemesh:body />
		</div>
	</div>
	<div id="box_footer">
		<div id="box_footer1">
			<div xmlns="" class="columnSpace"
				id="elem-FrontSpecifies_show01-1405666603000" name="说明页">
				<div id="FrontSpecifies_show01-1405666603000"
					class="FrontSpecifies_show01-d3_c1">
					<div class="describe htmledit">
						<p>
							<a href="/home.html">网站首页</a> | <a
								href="/about/&amp;columnsId=2.html">关于我们</a> | <a
								href="/about/&amp;i=3&amp;comContentId=3.html">企业风采</a> | <a
								href="/products_list/columnsId=37.html">产品展示</a> |<a
								href="/news_list.html"> 新闻中心</a> | <a href="/download.html">下载中心</a>
							| <a href="/contact/&amp;i=5&amp;comContentId=5.html">销售网络</a> |
							<a href="/contact/columnsId=39.html">联系我们</a><a
								style="float: right; position: relative; right: 20px;"
								href="http://kunshan.300.cn" target="_blank">中企动力提供技术支持</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="box_footer2">
			<div xmlns="" class="columnSpace"
				id="elem-FrontSpecifies_show01-1405666623017" name="说明页">
				<div id="FrontSpecifies_show01-1405666623017"
					class="FrontSpecifies_show01-d3_c1">
					<div class="describe htmledit">
						<p>
							页面版权所有上海山川泵业制造有限公司&nbsp;&nbsp; <a
								href="http://www.miitbeian.gov.cn" target="_blank">沪ICP备05055144号</a>&nbsp;&nbsp;
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
</body>
</html>