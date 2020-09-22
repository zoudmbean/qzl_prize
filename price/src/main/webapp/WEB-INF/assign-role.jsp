<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh_CN">

<!-- 引入head标签体内容-->
<%@ include file="/WEB-INF/admin-head.jsp"%>

<script type="text/javascript">
	
	// 右移
	function toRight(){
		$("select:first>option:selected").appendTo($("select:last"));
	}
	function toLeft(){
		$("select:last>option:selected").appendTo($("select:first"));
	}
	function selectAll(){
		$("select:last>option").prop("selected","selected");
	}
</script>

<body>
	<!-- 引入左侧导航 -->
	<%@ include file="/WEB-INF/admin-nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<!-- 引入头部面板 -->
			<%@ include file="/WEB-INF/admin-sider.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">数据列表</a></li>
					<li class="active">分配角色</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-body">
						<form role="form" class="form-inline" action="assign/save.html" method="post">
							<div>
								<!-- 隐藏字段都在这个DIV -->
								<input type="hidden" name="adminId" value="${param.adminId }">
								<input type="hidden" name="keywords" value="${param.keywords }">
								<input type="hidden" name="pageNum" value="${param.pageNum }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">未分配角色列表</label><br> <select
									class="form-control" multiple="multiple" size="10"
									style="width: 100px; overflow-y: auto;">
									<c:forEach items="${requestScope.unAssignedRoleList }" var="role">
										<option value="${role.id }">${role.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<ul>
									<li class="btn btn-default glyphicon glyphicon-chevron-right" onClick="toRight()"></li>
									<br>
									<li class="btn btn-default glyphicon glyphicon-chevron-left"
										style="margin-top: 20px;" onClick="toLeft()"></li>
								</ul>
							</div>
							<div class="form-group" style="margin-left: 40px;">
								<label for="exampleInputPassword1">已分配角色列表</label><br> <select
									class="form-control" multiple="multiple" size="10"
									style="width: 100px; overflow-y: auto;" name="ids">
									<c:forEach items="${assignedRoleList }" var="role">
										<option value="${role.id }">${role.name }</option>
									</c:forEach>
								</select>
							</div>
							<div style="margin-top:10px;margin-left:130px;">
								<button type="submit" class="btn btn-success" onClick="selectAll()"><i class="glyphicon glyphicon-plus"></i> 保存</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>