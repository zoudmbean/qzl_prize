<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">

<!-- 引入head标签体内容-->
<%@ include file="/WEB-INF/admin-head.jsp" %>

<!-- 引入pagination分页插件环境 -->
<link rel="stylesheet" href="css/pagination.css">
<script type="text/javascript" src="jquery/jquery.pagination.js"></script>
<script>
	$(function(){
		initPagination();
	});
	
	function initPagination(){
		var total = ${requestScope.pageInfo.total};
		// 创建分页
		$("#Pagination").pagination(total, {
			num_edge_entries: 3, //边缘页数
			num_display_entries: 5, //主体页数
			callback: pageselectCallback,
			items_per_page:${requestScope.pageInfo.pageSize}, //每页显示1项
			current_page:${requestScope.pageInfo.pageNum - 1},
			prev_text:"上一页",
			next_text:"下一页"
		});
	}
	
	function pageselectCallback(pageIndex, jq){
		var pageNum = pageIndex + 1;
		window.location.href="admin/getByPageInfo.html?pageNum="+pageNum + "&keywords=${param.keywords}";
		return false;
	}
</script>
<body>
	<!-- 引入左侧导航 -->
	<%@ include file="/WEB-INF/admin-nav.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<!-- 引入头部面板 -->
			<%@ include file="/WEB-INF/admin-sider.jsp"  %>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form action="admin/getByPageInfo.html" method="get" class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text" name="keywords"
										placeholder="请输入查询条件">
								</div>
							</div>
							<button type="submit" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;" onclick="window.location.href='admin/to/add/page.html'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox"></th>
										<th>账号</th>
										<th>名称</th>
										<th>邮箱地址</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty pageInfo }">
										<tr>
											<td colspan="6">查無此数据！</td>
										</tr>
									</c:if>
									<c:if test="${!empty pageInfo.list }">
										<c:forEach items="${pageInfo.list }" var="info" varStatus="num">
											<tr>
												<td>${num.count }</td>
												<td><input type="checkbox"></td>
												<td>${info.loginAcct }</td>
												<td>${info.userName }</td>
												<td>${info.email }</td>
												<td>
													<a class="btn btn-success btn-xs" href="assign/toAssign/${info.id}.html?adminId=${info.id}&pageNum=${requestScope.pageInfo.pageNum}&keywords=${param.keywords}" />
														<i class=" glyphicon glyphicon-check"></i>
													</a>
													<a class="btn btn-primary btn-xs" href="admin/toEdit/${info.id}.html?pageNum=${requestScope.pageInfo.pageNum}&keywords=${param.keywords}" />
														<i class=" glyphicon glyphicon-edit"></i>
													</a>
													<a class="btn btn-danger btn-xs" href="admin/removeAdmin/${info.id}/${pageInfo.pageNum}/${param.keywords}.html"><i class=" glyphicon glyphicon-remove"></i></a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" align="center">
											<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>