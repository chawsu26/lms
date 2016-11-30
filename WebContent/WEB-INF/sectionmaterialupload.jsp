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
<body style="font-family:Zawgyi-One">
<div class='navbar navbar-default navbar-static-top'>
		<div class='container'>
			<ul class='nav navbar-nav navbar-right subtitle '>
				<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
			</ul>
			
		</div>
		
	</div>
		<div class="container" style="padding-top: 30px">
			<div class="col-md-8">
				<div class="panel panel-default">
				<div class="panel-heading"><strong><spring:message code="admin.title.sectionmaterialupload" text="default text" /></strong></div>
			<div class="panel-body">
				<div class="col-md-6">
					<form method="POST" action="<%=path%>/admin/uploadSectionMaterial" enctype="multipart/form-data">
						<div class="form-group">
		  					<label for="class"><spring:message code="admin.title.class" text="default text" /></label>
							<select name="classname" id="class" class="form-control">
								<option>Section-A</option>
								<option>Section-B</option>
								<option>Section-C</option>
								<option>Section-D</option>
								<option>Section-E</option>
							</select>
						</div>
						<div class="form-group">
							<label for="fileName"><spring:message code="admin.title.sectionmaterial" text="default text" />:</label><input type="file" name="filename"/>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default" value=<spring:message code="admin.title.upload" text="default text" /> class="btn btn-default"/>
							<a class="btn btn-default" href="<%=path %>/admin/student" style="float:right"><spring:message code="admin.title.back" text="default text" /></a>
						</div>
					</form>		
				</div>
			</div>
			</div>
			</div>
		</div> 
</body>
</html>