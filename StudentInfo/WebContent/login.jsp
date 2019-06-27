<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/style/studentInfo.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">



<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理系统登录</title>
<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<SCRIPT language=javascript type=text/javascript>
	
	function loadimage(){
		document.getElementById("randImage").src = "image.jsp?"+Math.random();
	}
	
	
</SCRIPT>
</head>
<body >
<div style="width:100%;text-align:center"> </div>
<br><br><br><br><br><br><br><br><br><br>
<!-- <div style="width:100%;text-align:center">学生信息管理系统</div><br> -->



<div style="width:100%;text-align:center"> 



<FORM id=adminlogin  method=post
	name=adminlogin action="user!login">
			<h4><font color="purple">学生信息管理系统</font></h4>
						<div class="form-group" >
						
					    <label for="exampleInputEmail1">Username</label>
					    <INPUT type="text" placeholder="用户名" class=input  value="${user.userName }" name="user.userName" id="userName"></div>

						 <div class="form-group">
    					<label for="exampleInputPassword1">Password</label>
    					<INPUT type="password" placeholder="密码" class=input  value="${user.password }" name="user.password" id="password"/></div>
						<button  id=btnLogin class="btn btn-primary"  type="submit" name=btnLogin onclick="javascript:adminlogin.submit();return false;">登录</button>				
						<button type="button" id=btnReset class="btn btn-info" type="submit" name=btnReset onclick="javascript:adminlogin.reset();return false;">重置</button>
							
</FORM>
		

</div> 

</body>
</html>
<script type=text/javascript>
	if('${error}'!=''){
		alert('${error}');
	}
</script>