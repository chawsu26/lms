<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<script src="<%=path %>/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%= path %>/css/jquery.dataTables.min.css">
<script type="text/javascript" src="<%= path %>/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
<body>
<div class='navbar navbar-default navbar-static-top'>
		<div class='container'>
			<ul class='nav navbar-nav navbar-right subtitle '>
				<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
			</ul>
			
		</div>
		
	</div>
	<div class="container">
		<div class="row">
				<div class="row header" style="text-align:center;color:green">
					<h3><spring:message code="admin.title.sectionmaterials" text="default text" /></h3>
				</div>
				<table class="table table-striped"id="myTable">
					<thead>
						<tr>
							<td><h4><strong><spring:message code="admin.title.class" text="default text" /></strong></h4></td>
							<td><h4><strong><spring:message code="admin.title.filename" text="default text" /></strong></h4></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="material" items="${materiallist}">
							  <tr>
									<td>${material.classname}</td>
						     	 	<td>${material.filename}</td>
						     	 	<td><a class="btn btn-danger" href="<%=path %>/admin/materialdelete?section=${material.classname}&filename=${material.filename}" ><spring:message code="admin.title.delete" text="default text" /></a></td>	
						      </tr>
						</c:forEach>
						
					</tbody>
				</table>
				<a class="btn btn-primary" href="<%=path%>/admin/uploadsectionmaterial"><spring:message code="admin.title.upload" text="default text" /></a>
				<a class="btn btn-primary" href="<%=path%>/admin/showsectionmaterial" style="float:right"><spring:message code="admin.title.back" text="default text" /></a>
		</div>

	</div>
</body>
</html>