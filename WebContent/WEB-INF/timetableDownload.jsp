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
<body style="margin:20px auto"> 
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div> 
<div class="container">
<div class="row header" style="text-align:center;color:green">
<h3><spring:message code="admin.title.timetablelist" text="default text" /></h3>
</div>
<table id="myTable" class="table table-striped" >  
        <thead>  
           <tr>
	         <td><strong><spring:message code="admin.title.class" text="default text" /></strong></td>
	         <td><Strong><spring:message code="admin.title.timetablelist" text="default text" /></Strong></td>
	         <td></td>
	         <td></td>
	      </tr>
        </thead> 
        <tbody>  
          <c:forEach var="std" items="${classList}">
	     	 <tr>
	   			<td>${std.class_name}</td>
	   			<td>${std.file_name}</td>
	   			<td><a class="btn btn-success" href="<%=path %>/admin/images?fileName=${std.file_name}" ><spring:message code="admin.title.view" text="default text" /></a></td>
	   			<td><a class="btn btn-danger" href="<%=path %>/admin/classdelete?class_name=${std.class_name}" ><spring:message code="admin.title.delete" text="default text" /></a></td>
		  	</tr>
		  </c:forEach>
        </tbody>  
      </table>
      	<a class="btn btn-default btn-primary" href="<%=path %>/admin/showUpload"><spring:message code="admin.title.uploadtimetable" text="default text" /></a>
        <a class="btn btn-primary" href="<%=path %>/admin/student" style="float:right"><spring:message code="admin.title.back" text="default text" /></a>
	  </div>
</body>  
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</html>