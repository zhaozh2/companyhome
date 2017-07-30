<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页内容维护管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/mainpic/mainPic/">首页内容维护列表</a></li>
		<shiro:hasPermission name="mainpic:mainPic:edit"><li><a href="${ctx}/mainpic/mainPic/form">首页内容维护添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="mainPic" action="${ctx}/mainpic/mainPic/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>类别：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('main_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>说明</th>
				<th>图片</th>
				<th>类别</th>
				<shiro:hasPermission name="mainpic:mainPic:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="mainPic">
			<tr>
				<td>
					<a href="${ctx}/mainpic/mainPic/form?id=${mainPic.id}">${mainPic.title}</a>
				</td>
				<td>
					${mainPic.remark}
				</td>
				<td>
					${mainPic.image}
				</td>
				<td>
					${fns:getDictLabel(mainPic.type, 'main_type', '')}
				</td>
				<shiro:hasPermission name="mainpic:mainPic:edit"><td>
    				<a href="${ctx}/mainpic/mainPic/form?id=${mainPic.id}">修改</a>
					<a href="${ctx}/mainpic/mainPic/delete?id=${mainPic.id}" onclick="return confirmx('确认要删除该首页内容维护吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>