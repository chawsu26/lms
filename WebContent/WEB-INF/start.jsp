<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div class="container">
<center><h2>Student List</h2></center>
<a class="btn btn-default btn-primary" href="<%=path %>/admin/register" style="float:right" >New</a><br>
<table id="myTable" class="table table-striped" >  
        <thead>  
         <tr>
		   <td><strong>Email</strong></td> 
		   <td><strong>Name</strong></td>
		   <td><strong>Class</strong></td>>
		   <td></td>
		   <td></td>
	    </tr> 
        </thead> 
        <tbody>  
          <c:forEach var="std" items="${studentList}">
			<tr>
			   <td>${std.email}</td> 
			   <td>${std.name}</td>
			   <td>${std.classname}</td>
			   <td><a class="btn btn-success" href="<%=path %>/admin/emailupdate?email=${std.email}&name=${std.name}" >Update</a></td>
			   <td><a class="btn btn-danger" href="<%=path %>/admin/delete?email=${std.email}" >Delete</a></td>
			</tr>
		  </c:forEach>
        </tbody>  
      </table>  
<a class="btn btn-default btn-primary" href="<%=path %>/admin/downloadTimeTable">Show Timetable</a>
<a class="btn btn-default btn-primary" href="<%=path %>/admin/showUpload" style="float:right" >Upload</a>
</div>
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</body>
</html>