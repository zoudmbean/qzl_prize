<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="zh_CN">

  <!-- 引入head标签体内容-->
  <%@ include file="/WEB-INF/admin-head.jsp" %>
  
  <body>
    <!-- 引入左侧导航 -->
  	<%@include file="/WEB-INF/admin-nav.jsp" %>
  	
    <div class="container-fluid">
      <div class="row">
        <!-- 引入头部面板 -->
  		<%@ include file="/WEB-INF/admin-sider.jsp" %>
  		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">控制面板</h1>
          <div class="row placeholders">
          	<security:authorize access="hasRole('经理')">
	            <div class="col-xs-6 col-sm-3 placeholder">
	              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
	              <h4>Label</h4>
	              <span class="text-muted">Something else</span>
	            </div>
          	</security:authorize>
          	<security:authorize access="hasRole('部长')">
	            <div class="col-xs-6 col-sm-3 placeholder">
	              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
	              <h4>Label</h4>
	              <span class="text-muted">Something else</span>
	            </div>
          	</security:authorize>
          	<security:authorize access="hasAuthority('user:get')">
	            <div class="col-xs-6 col-sm-3 placeholder">
	              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
	              <h4>Label</h4>
	              <span class="text-muted">Something else</span>
            	</div>
          	</security:authorize>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
