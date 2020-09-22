<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_CN">

<!-- 引入head标签体内容-->
<%@ include file="/WEB-INF/admin-head.jsp"%>
<!-- 引入pagination分页插件环境 -->
<link rel="stylesheet" href="css/pagination.css">
<script type="text/javascript" src="jquery/jquery.pagination.js"></script>
<!-- 引入ztree -->
<link rel="stylesheet" href="ztree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="layer-v3.1.1/layer/layer.js"></script>
<script type="text/javascript" src="crowdJs/role.js"></script>

<script type="text/javascript">
	$(function(){
		// 1.为分页操作准备初始化数据
		window.pageNum = 1;
		window.pageSize = 10;
		window.keyword = "";
		initBtn();
		// 2.调用执行分页的函数，显示分页效果
		generateTbody();
		
		$("#roleAddBtn").click(function(){
			$("#roleModal").modal("show");
		});
		
		$("#saveBtn").click(function(){
			var id = $("#id").val();
			// 1. 获取form的值
			var data = $("#roleModal form").serialize();
			var data1 = $("#roleModal form").serializeArray();
			console.log("data1 = " + JSON.stringify(data1));
			var data2 = $("#roleModal form").serialize();
			console.log("data2 = " + data2);
			$.ajax({
			   type: "POST",
			   url: "role/save.json",
			   data: data,
			   dataType:"json",
			   success: function(response){
			     if(response.result === "SUCCESS"){
			    	 layer.msg("保存成功");
			    	 // 保存成功，清空model
			    	 if(!id){  // 修改
			    		 window.pageNum = 9999;
			    	 }
			    	 generateTbody();
			    	 clearForm("roleForm");
			     }
			     if(response.result === "FAILED"){
			    	 layer.msg("保存失败！" + response.message);
			     }
			   },
			   error:function(){
				   layer.msg("保存错误");
			   }
			});
			// 关闭模态框
			$("#roleModal").modal("hide");
		});
		
		/*
			使用jQuery的on()函数可以动态绑定事件
			步骤：
			1）首先找到所有动态生成的元素的静态父元素
			2）on()函数的第一个参数：事件类型
			3）on()函数的第二个参数：要绑定事件元素的选择器
			4）on()函数的第三个参数：事件的响应函数
		*/
		$("#rolePageBody").on("click",".pencilBtn",function(e){
			var roleName = $(this).parent().prev().text();
			$("#roleForm input[name='id']").val(this.id);
			$("#roleForm input[name='name']").val(roleName);
			$("#roleModal").modal("show");
		});
		
		// 设置权限
		$("#rolePageBody").on("click",".authBtn",function(){
			var roleId = this.id;
			showAuthModal(roleId);
		})
		
		// 删除绑定事件
		$("#rolePageBody").on("click",".removeBtn",function(){
			var roleId = this.id;
			var roleName = $(this).parent().prev().text();
			var roles = [{
				id:roleId,
				name:roleName
			}];
			// 显示模态框
			showRemoveModal(roles,false);
		})
		
		// 点击全选按钮操作
		$("#allChecked").click(function(){
			// ①获取当前多选框自身的状态
			var currentStatus = this.checked;
			
			// ②用当前多选框的状态设置其他多选框
			$(".itemBox").prop("checked", currentStatus);
		});
		
		// 选择框绑定事件（全选/全部选的反向操作）
		$("#rolePageBody").on("click",".itemBox",function(){
			// 获取当前已经选中
			var checked = $(".itemBox:checked").length;
			// 获取全部.itemBox的数量
			var size = $(".itemBox").length;
			
			$("#allChecked").prop("checked",checked == size);
		})
		
		$("#deleBathBtn").click(function(){
			$.ajax({
				"url":"role/removeByIds.json",
				"type":"post",
				"data":JSON.stringify(window.idArray),
				"contentType":"application/json;charset=UTF-8",
				"dataType":"json",
				"success":function(response){
					
					var result = response.result;
					
					if(result == "SUCCESS") {
						layer.msg("操作成功！");
						
						// 重新加载分页数据
						generateTbody();
					}
					
					if(result == "FAILED") {
						layer.msg("操作失败！"+response.message);
					}
					
				},
				"error":function(response){
					layer.msg(response.status+" "+response.statusText);
				}
			});
			
			// 关闭模态框
			$("#removemodal").modal("hide");
		});
		
		// 批量删除
		$("#dele").click(function(){
			// 创建一个数组对象用来存放后面获取到的角色对象
			var roleArray = [];
			// 遍历选中的元素
			$(".itemBox:checked").each(function(){
				// 使用this引用当前遍历得到的多选框
				var roleId = this.id;
				// 通过DOM操作获取角色名称
				var roleName = $(this).parent().next().text();
				roleArray.push({id:roleId,name:roleName});
			});
			// 显示模态框
			showRemoveModal(roleArray,true);
		});
		
		// 分配权限
		$("#roleBathBtn").click(function(){
			// alert(window.roleId);
			var treeObj = $.fn.zTree.getZTreeObj("authTree");
			var nodes = treeObj.getCheckedNodes(true);
			var idArray = [];
			$.each( nodes, function(index,node){
			  	idArray.push(node.id);
			});
			console.log(JSON.stringify(idArray));
			// 调用后台保存
			$.ajax({
				'type':'post',
				'url':'assign/auth/setAuth/'+window.roleId+'.json',
				'contentType':'application/json;charset=utf-8',
				'data':JSON.stringify(idArray),
				'dataType':'json',
				'success':function(res){
					if(res.result === "SUCCESS"){
						layer.msg("执行成功！");
						// 关闭模态框
						$("#authModal").modal("hide");
					}
					if(res.result === "FAILD"){
						layer.msg(res.message);
					}
				},
				'error':function(res){
					if(res.message){
						layer.msg(res.message);
						return ;
					}
					layer.msg("授权失败！");
				}
			});
		});
		
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
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" id="keywordInput" type="text"
										placeholder="请输入查询条件">
								</div>
							</div>
							<button type="button" id="searchBtn" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger" id="dele"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary" id="roleAddBtn"
							style="float: right;">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox" id="allChecked"></th>
										<th>名称</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody id="rolePageBody">
									<!-- <tr>
										<td>1</td>
										<td><input type="checkbox"></td>
										<td>PM - 项目经理</td>
										<td>
											<button type="button" class="btn btn-success btn-xs">
												<i class=" glyphicon glyphicon-check"></i>
											</button>
											<button type="button" class="btn btn-primary btn-xs">
												<i class=" glyphicon glyphicon-pencil"></i>
											</button>
											<button type="button" class="btn btn-danger btn-xs">
												<i class=" glyphicon glyphicon-remove"></i>
											</button>
										</td>
									</tr> -->
								</tbody>
								<tr>
									<td colspan="6" align="center">
										<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/role-modal.jsp"%>
	<%@ include file="/WEB-INF/role-remove-modal.jsp"%>
	<%@ include file="/WEB-INF/role-auth-modal.jsp"%>
</body>
</html>