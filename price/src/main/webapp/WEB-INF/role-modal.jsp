<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="roleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">新增/编辑</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-signin" role="form" id="roleForm">
        	  <input type="hidden" name="id" id="id">
			  <div class="form-group has-success has-feedback">
				<input type="text" class="form-control" 
				  placeholder="请输入角色名称" autofocus name="name" >
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			  </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
      </div>
    </div>
  </div>
</div>