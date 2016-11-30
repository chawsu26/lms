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
</head>
<body style="margin:20px auto;font-family:Zawgyi-One">
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/student/viewtimetable?className=${className}&email=${email }&Name=${Name}"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div>
<div class="container">
<center><h2><spring:message code="admin.title.sectionmaterial" text="default text" /></h2></center>
<table id="myTable" class="table table-striped" >  
        <thead>  
          <tr>
		   	<td><strong><spring:message code="admin.title.filename" text="default text" /></strong></td>
		   	<td></td>
		  </tr>
        </thead> 
        <tbody>  
        <c:forEach var="material" items="${materiallist}">
		  <tr>
	     	 	<td>${material.filename}</td>	
	     	 	<td><a class="btn btn-success" href="/LMS/student/downloadFile?fileName=${material.filename}"><spring:message code="admin.title.view" text="default text" /></a>	
	      </tr>
		</c:forEach>
        </tbody>  
</table> 
 <a class="btn btn-primary" href="<%=path %>/student/viewtimetable?className=${className}&email=${email}&Name=${Name}" style="float:right"><spring:message code="admin.title.back" text="default text" /></a>
</div> 
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</body>
</html>

