<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<link rel="stylesheet" href="huaxin/css/demo.css" type="text/css" />
<link rel="stylesheet" href="huaxin/css/index/style.css" type="text/css" />
<script type="text/javascript" src="huaxin/common/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="huaxin/js/index/PicCarousel.js"></script>
<script type="text/javascript" src="huaxin/common/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="huaxin/common/jquery.nivo.slider_2.5.2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		setTimeout('doSlider()', 500);

		$(".B_Demo").PicCarousel({
			"width" : 1000, //幻灯片的宽度
			"height" : 300, //幻灯片的高度
			"posterWidth" : 520, //幻灯片第一帧的宽度
			"posterHeight" : 300, //幻灯片第一张的高度
			"scale" : 0.9, //记录显示比例关系
			"speed" : 1500, //记录幻灯片滚动速度
			"autoPlay" : true, //是否开启自动播放
			"delay" : 0, //自动播放间隔
			"verticalAlign" : "top" //图片对齐位置
		});
	});

	function doSlider() {
		$('#slider').nivoSlider({
			effect : 'fold',
			animSpeed : 500,
			pauseTime : 2000,
			startSlide : 0,
			slices : 15,
			directionNav : false,
			directionNavHide : false,
			controlNav : true,
			controlNavThumbs : false,
			keyboardNav : true,
			pauseOnHover : true,
			captionOpacity : 0.8
		});
	}

	function stopss() {
		return false;
	}
	document.oncontextmenu = stopss;
</script>

<style>
</style>
</head>
<body>
	<div id="box_main">
		<div id="wrapper">
			<div class="slider-wrapper theme-theme1204">
				<div id="slider" class="nivoSlider">
					<img src="huaxin/img/1.jpg" alt="" style="height: 423px;" /> <img
						src="huaxin/img/2.jpg" alt="" /> <img src="huaxin/img/3.jpg"
						alt="" /> <img src="huaxin/img/4.jpg" alt="" />
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: center; width: 77%; min-width: 1000px;">
		<table style="width: 100%; margin: 0 13%;" align="center"
			cellpadding="0">
			<tr>
				<td valign="top" style="text-align: left;"><c:forEach
						items="${categoryList}" var="tpl">
						<c:if test="${tpl.inList eq '1' && tpl.name eq '新闻动态'}">
							<div id="box_middle1_left">
								<c:if test="${tpl.module eq 'article'}">
									<ul style="margin: 5px;">
										<c:forEach
											items="${fnc:getArticleList(site.id, tpl.id, 7, '')}"
											var="article">
											<li><span class="pull-right"><fmt:formatDate
														value="${article.updateDate}" pattern="yyyy.MM.dd" /></span><a
												href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
												style="color:${article.color}">${fns:abbr(article.title,36)}</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</div>
						</c:if>
					</c:forEach>
					<div id="box_middle1_middle">
						<div style="padding-right: 10px; margin-left: 7px; float: left;">
							<img alt="" src="/huaxin/img/piaochuang.png"
								style="width: 174px; height: 85px;">
						</div>
						<div style="width: 93%; margin-left: 5px;">
							<p
								style="line-height: 20px; font-size: 12px; margin-top: 0em; text-indent: 0em; margin-bottom: 0em; letter-spacing: 0px;">
								<span>
									上海山川泵业制造有限公司是国内著名的水泵给排水设备及泵用控制设备专业制造销售企业，资产总额达1.5亿元，占地35000m2
									的山川工业园坐落于上海松江佘山工业区，北靠沪青平高速公路，南邻佘山国家旅游度假区，环境优美、交通便捷。公司现有员工362名，其中大专以上学历的占71%，中、高级工程师及技术工程人员38名......[<a
									href="/about.html">查看详细</a>]
								</span>
							</p>
						</div>
					</div>
					<div id="box_middle1_right">
						<p
							style="line-height: 14px; font-size: 12px; margin-top: 0em; text-indent: 0em; margin-bottom: 0em; letter-spacing: 0em;">
							山川工业园：上海市松江区佘山工业区佘北公路1501号<br> 电话：021-57796293&nbsp;
							021-57796299<br> 传真：021-57796281&nbsp;<br>
							市场部、营销部：上海市普陀区武宁路19号1106室<br> 电话：021-62307790<br>
							传真：021-62305386<br> 网址：<a
								href="http://www.shanchuan-pump.cn/"><font color="#0066cc">www.shanchuan-pump.cn</font></a><br>
							邮箱：<a href="mailto:shanchuan6688@163.com">shanchuan6688@163.com</a>
						</p>
					</div></td>
			</tr>
		</table>
	</div>
	<div class="poster-main B_Demo">
		<div class="poster-btn poster-prev-btn"></div>
		<ul class="poster-list">
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/1.jpg" width="100%"></a></li>
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/2.jpg" width="100%"></a></li>
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/3.jpg" width="100%"></a></li>
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/4.jpg" width="100%"></a></li>
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/5.jpg" width="100%"></a></li>
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/6.jpg" width="100%"></a></li>
			<li class="poster-item"><a href="#"><img
					src="/huaxin/img/index/7.jpg" width="100%"></a></li>
		</ul>
		<div class="poster-btn poster-next-btn"></div>
	</div>
</body>
</html>