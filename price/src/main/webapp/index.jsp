<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 
		base 标签必须写在 head 标签内部
		base 标签必须在所有“带具体路径” 的标签的前面
		serverName 部分 EL 表达式和 serverPort 部分 EL 表达式之间必须写“:”
		serverPort 部分 EL 表达式和 contextPath 部分 EL 表达式之间绝对不能写“/”
			因为 ${pageContext.request.contextPath} 获取到的字符串是以 “/” 开头的
		serverPort 部分 EL 表达式后面必须写“/”
	 -->
	<base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
	<script type="text/javascript" src="jquery/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="layer-v3.1.1/layer/layer.js"></script>
	<script>
		$(function(){
			$("#btn4").click(function(){
				layer.msg("xxx");
			});
			$("#btn3").click(function(){
				let student = {
						"stuId":1001,
						"stuName":"张三",
						"address":{
							"province":'湖北省',
							"city":"武汉",
							"street":"江夏区"
						},
						"subjectList":[
							{"subjectName":"语文","subjectScore":59},
							{"subjectName":"数学","subjectScore":138},
							{"subjectName":"英语","subjectScore":66},
							{"subjectName":"化学","subjectScore":99}
						],
						"map":{
							"k1":"v1",
							"k2":"v2",
							"k3":"v3"
						}
				};
				$.ajax({
					"url":'send/object/compose.html',		// 请求URL
					"data":JSON.stringify(student),
					"type":'post',						// 请求方式
					"dataType":'text',					// 服务端返回的数据格式
					"contentType":"application/json;charset=UTF-8",  // 设置请求体的内容类型为json格式的数据
					"success":function(res){
						alert(res);
					},
					"error":function(res){
						alert(res);
					}
				});
			});
			$("#btn2").click(function(){
				console.log(JSON.stringify([1,2,3,4,5]));
				$.ajax({
					"url":'send/array/two.html',		// 请求URL
					"data":JSON.stringify([1,2,3,4,5]),
					"type":'post',						// 请求方式
					"dataType":'text',					// 服务端返回的数据格式
					"contentType":"application/json;charset=UTF-8",  // 设置请求体的内容类型为json格式的数据
					"success":function(res){
						alert(res);
					},
					"error":function(res){
						alert(res);
					}
				});
			});
			$("#btn1").click(function(){
				$.ajax({
					"url":'send/array/one.html',		// 请求URL
					"data":{							// 请求体
						"array":[1,2,3,4,5]
					},
					"type":'post',						// 请求方式
					"dataType":'text',					// 服务端返回的数据格式
					"success":function(res){
						alert(res);
					},
					"error":function(res){
						alert(res);
					}
				});
			});
		});
	</script>
</head>
<body>
	<!-- 这里的url与base标签做拼接，url不能以 / 开头，否则不与base标签拼接 -->
	<a href="test/ssm.html">点击跳转</a><br>
	<button id="btn1">发送数组1</button><br>
	<button id="btn2">发送数组2</button><br>
	<button id="btn3">发送复杂对象</button><br>
	<button id="btn4">layer弹窗</button><br>
</body>
</html>