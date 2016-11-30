<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<title></title>
<script src="jquery-3.1.1.js"></script>
</head>


<body style="font-family:Zawgyi-One">	
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div>
	<br>&nbsp;</br>
	<div class="container" style="padding-top:100px">
		<div class="col-md-8">
			<div class="panel panel-default">
				<div class="panel-heading"><strong><spring:message code="admin.title.uploadtimetable" text="default text" /></strong></div>
				<div class="panel-body">
				<form method="POST" action="/LMS/admin/uploadFile" enctype="multipart/form-data">	
					<div class="col-md-4">
				        <div class="form-group">
						<label for="class"><spring:message code="admin.title.class" text="default text" />:</label>
						<select name="class_name" id="class" class="form-control">
							<option>Section-A</option>
							<option>Section-B</option>
							<option>Section-C</option>
							<option>Section-D</option>
							<option>Section-E</option>
						</select>
				    </div>
				      <div><spring:message code="admin.title.timetable" text="default text" />:<input type="file" name="file"></div><br>
				      <a href="/LMS/admin/downloadTimeTable" class="btn btn-default"><spring:message code="admin.title.back" text="default text" /></a>
				      <input type="submit" value="<spring:message code="admin.title.upload" text="default text" />" class="btn btn-default"> 
				    </div><!-- col-md-6 END -->
				   </form>
				 </div><!-- Panel End  -->
			</div><!-- Panel END -->
		</div>
    </div>
</body>
</html>