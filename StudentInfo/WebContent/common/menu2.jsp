<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript">
	function logOut() {
		if (confirm("您确定要退出系统吗？")) {
			window.location.href = "user!logOut";
		}
	}
</script>
<div class="row-fluid">
	<div class="span12">
		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand" href="ad.jsp">首页</a>
				<ul class="nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">学生信息 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="student2!list">学生信息查询</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">系统管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="user!preSaves">修改密码</a></li>
							<li class="divider"></li>
							<li><a href="javascript:logOut()">退出系统</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>