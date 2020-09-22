<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_CN">

<!-- 引入head标签体内容-->
<%@ include file="/WEB-INF/admin-head.jsp"%>
<!-- 引入ztree -->
<link rel="stylesheet" href="ztree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="layer-v3.1.1/layer/layer.js"></script>
<script type="text/javascript" src="crowdJs/menu.js"></script>

<script>
	var setting = {
		view : {
			dblClickExpand : false,		// 是否双击展开
			showLine : true,
			selectedMulti : false,		
			showIcon: true,				// 定义是否显示图标
			addDiyDom: myAddDiyDom,		// 自定义图标
			addHoverDom: addHoverDom,
			removeHoverDom: removeHoverDom
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : ""
			},
			key: {
				url: "xUrl"
			}
		}
	};

	$(function() {
		initTreeData();
	});
</script>

<body>
	<!-- 引入左侧导航 -->
	<%@ include file="/WEB-INF/admin-nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<!-- 引入头部面板 -->
			<%@ include file="/WEB-INF/admin-sider.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-th-list"></i> 权限菜单列表
						<div style="float: right; cursor: pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<ul id="tree" class="ztree"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框 -->
	<!-- 1. 新增/修改模态框 -->
	<div id="menuSaveModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="saveTitle"></h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form>
					<div class="modal-body">
						<input name="id" type="hidden">
						请输入节点名称：<input type="text" name="name" /><br />
						请输入URL地址：<input type="text" name="url" /><br />
						<i class="glyphicon glyphicon-th-list"></i>
						<input type="radio" name="icon" value="glyphicon glyphicon-th-list" />&nbsp;
						
						<i class="glyphicon glyphicon-dashboard"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-dashboard" /> &nbsp;
						
						<i class="glyphicon glyphicon glyphicon-tasks"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon glyphicon-tasks" /> &nbsp;
						
						<i class="glyphicon glyphicon-user"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-user" /> &nbsp;
						
						<i class="glyphicon glyphicon-king"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-king" /> &nbsp;
						
						<i class="glyphicon glyphicon-lock"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-lock" /> &nbsp;
						
						<i class="glyphicon glyphicon-ok"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-ok" /> &nbsp;
						
						<i class="glyphicon glyphicon-check"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-check" /> &nbsp;
						
						<i class="glyphicon glyphicon-th-large"></i>
						<input type="radio" name="icon" value="glyphicon glyphicon-th-large" /> <br /> 
						
						<i class="glyphicon glyphicon-picture"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-picture" /> &nbsp;
						
						<i class="glyphicon glyphicon-equalizer"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-equalizer" /> &nbsp;
						
						<i class="glyphicon glyphicon-random"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-random" /> &nbsp;
						
						<i class="glyphicon glyphicon-hdd"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-hdd" /> &nbsp;
						
						<i class="glyphicon glyphicon-comment"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-comment" /> &nbsp;
						
						<i class="glyphicon glyphicon-list"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-list" /> &nbsp;
						
						<i class="glyphicon glyphicon-tags"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-tags" /> &nbsp;
						
						<i class="glyphicon glyphicon-list-alt"></i> 
						<input type="radio" name="icon" value="glyphicon glyphicon-list-alt" /> &nbsp;
						<br />
						
					</div>
					<div class="modal-footer">
						<button id="menuSaveBtn" type="button" class="btn btn-default" onClick="save()"><i class="glyphicon glyphicon-edit"></i><span></span></button>
					</div>
					<input type="reset" id="reset" hidden="true"/>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 2. 删除模态框 -->
	<div id="menuConfirmModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">删除</h4>
				</div>
				<form>
					<div class="modal-body">
						您确定要删除<span id="removeNodeSpan"></span>这个节点吗？
					</div>
					<div class="modal-footer">
						<button id="confirmBtn" type="button" class="btn btn-danger" onCLick="sure()"><i class="glyphicon glyphicon-ok"></i>确认</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>