<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function loadClassInfo() {
		var s_gradeId = $("#s_gradeId").val();
		$("#s_classId option[value!='-1']").remove();
		if (s_gradeId == -1) {
			$("#s_classId").val("-1");
			return;
		}
		$.post("class!getClassByGradeId", {
			s_gradeId : s_gradeId
		}, function(result) {
			$("#s_classId").val("-1");
			var result = eval("(" + result + ")");
			$.each(result, function(i, item) {
				$(
						"<option value='"+item.classId+"'>" + item.className
								+ "</option>").appendTo($("#s_classId"));
			});
		});
	}

	function resetValue() {
		$("#s_stuNo").val("");
		$("#s_stuName").val("");
		$("#s_stuSex").val("-1");
		$("#s_stuNation").val("-1");
		$("#s_gradeId").val("-1");
		$("#s_classId").val("-1");
		$("#s_b_stuBirthday").val("");
		$("#s_e_stuBirthday").val("");
		$("#s_b_stuRxsj").val("");
		$("#s_e_stuRxsj").val("");
	}
</script>
<div class="data_list">
	<div class="search_content">
		<form action="${pageContext.request.contextPath}/student2!list"
			method="post">
			<table align="center">
				<tr>
					<td><lable>学号：</lable></td>
					<td><input type="text" id="s_stuNo" name="s_student.stuNo"
						value="${s_student.stuNo }" /></td>
					<td width="30px;">&nbsp;</td>
					<td><lable>姓名：</lable></td>
					<td><input type="text" id="s_stuName" name="s_student.stuName"
						value="${s_student.stuName }" /></td>
				</tr>
				<tr>
					<td><lable>性别：</lable></td>
					<td><select id="s_stuSex" name="s_student.stuSex">
							<option value="-1">请选择性别...</option>
							<c:forEach var="sexData" items="${s_sexDataDicList }">
								<option value="${sexData.ddValue }"
									${s_student.stuSex==sexData.ddValue?'selected':'' }>${sexData.ddValue }</option>
							</c:forEach>
					</select></td>
					<td>&nbsp;</td>
					<td><lable>民族：</lable></td>
					<td><select id="s_stuNation" name="s_student.stuNation">
							<option value="-1">请选择民族...</option>
							<c:forEach var="nationData" items="${s_nationDataDicList }">
								<option value="${nationData.ddValue }"
									${s_student.stuNation==nationData.ddValue?'selected':'' }>${nationData.ddValue }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><lable>所在年级：</lable></td>
					<td><select id="s_gradeId" name="s_student.gradeId"
						onchange="loadClassInfo()">
							<option value="-1">请选择年级...</option>
							<c:forEach var="grade" items="${s_gradeList }">
								<option value="${grade.gradeId }"
									${s_student.gradeId==grade.gradeId?'selected':'' }>${grade.gradeName }</option>
							</c:forEach>
					</select></td>
					<td>&nbsp;</td>
					<td><lable>所在班级：</lable></td>
					<td><select id="s_classId" name="s_student.classId">
							<option value="-1">请选择班级...</option>
							<c:forEach var="c" items="${s_classList }">
								<option value="${c.classId }"
									${s_student.classId==c.classId?'selected':'' }>${c.className }</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td colspan="2">
						<button class="btn btn-primary" type="submit">查询</button>
					</td>
					<td>&nbsp;</td>
					<td colspan="2">
						<button class="btn btn-primary" type="button"
							onclick="resetValue()">重置</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="data_content">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>所在班级</th>
				<th>所在年级</th>
			</tr>
			<c:forEach var="student" items="${studentList}" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${student.stuNo }</td>
					<td>${student.stuName }</td>
					<td>${student.stuSex }</td>
					<td>${student.className }</td>
					<td>${student.gradeName }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="pagination pagination-centered">
		<ul>${pageCode }
		</ul>
	</div>
</div>