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
<script type="text/javascript" src="huaxin/common/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="huaxin/common/jquery.nivo.slider_2.5.2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		setTimeout('doSlider()', 500);

		 doPic();
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

	
	function doPic() {
		var flag = "left";
		function DY_scroll(wraper, prev, next, img, speed, or) {
			var wraper = $(wraper);
			var prev = $(prev);
			var next = $(next);
			var img = $(img).find('ul');
			var w = img.find('li').outerWidth(true);
			var s = speed;
			next.click(function() {
				img.animate({
					'margin-left' : -w
				}, function() {
					img.find('li').eq(0).appendTo(img);
					img.css({
						'margin-left' : 0
					});
				});
				flag = "left";
			});
			prev.click(function() {
				img.find('li:last').prependTo(img);
				img.css({
					'margin-left' : -w
				});
				img.animate({
					'margin-left' : 0
				});
				flag = "right";
			});
			if (or == true) {
				ad = setInterval(function() {
					flag == "left" ? next.click() : prev.click()
				}, s * 1000);
				wraper.hover(function() {
					clearInterval(ad);
				}, function() {
					ad = setInterval(function() {
						flag == "left" ? next.click() : prev.click()
					}, s * 1000);
				});
			}
		}
		DY_scroll('.hl_main5_content', '.hl_scrool_leftbtn',
				'.hl_scrool_rightbtn', '.hl_main5_content1', 2, true);// true为自动播放，不加此参数或false就默认不自动 
	}
	function stopss() {
		return false;
	}
	document.oncontextmenu = stopss;
</script>

<style type="text/css"> 
.hl_main5_content{width:898px; height:155px; border-top:none; margin-left:1px; margin:0px auto;} 
.hl_main5_content1{width:838px;margin-top:5px; overflow:hidden; float:left; margin-left:15px;} 
.hl_main5_content1 ul{width:1600px; overflow:hidden;} 
.hl_main5_content1 ul li{ float:left; width:200px; display:inline; border:1px #FF0000 solid; margin-right:10px;} 
.hl_main5_content1 ul li img{ width:200px; } 
.hl_scrool_leftbtn{width:14px; height:38px; background:#ccc url(/huaxin/img/index/icon.gif)  0px -113px no-repeat; float:left; margin-top:50px; cursor:pointer;} 
.hl_scrool_rightbtn{width:14px; height:38px; background:#ccc url(/huaxin/img/index/icon.gif) -20px -113px no-repeat; float:right;margin-top:50px; cursor:pointer;} 
</style> 
</head>
<body>
	<div id="box_main">
		<div id="wrapper">
			<div class="slider-wrapper theme-theme1204">
				<div id="slider" class="nivoSlider">
					<c:forEach items="${fnc:getMainPicList('HD',5)}" var="article">
						<img src="${article.image}" alt="" style="height: 423px;" />
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: center; width: 77%; min-width: 1000px;    margin-top: 20px;">
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
	<div class="hl_main5_content">
		<div class="hl_scrool_leftbtn"></div>
		<div class="hl_scrool_rightbtn"></div>
		<div class="hl_main5_content1">
			<ul>
				<c:forEach items="${fnc:getMainPicList('CP',10)}" var="article">
					<li><a href="" title=""><img src="${article.image}" /></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>