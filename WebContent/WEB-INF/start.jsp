<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/LMS/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/LMS/css/bread-crumbs.css" />
<script src="/LMS/js/jquery-3.1.1.js"></script>
<script src="/LMS/js/bootstrap.js"></script>
<body>
<div class="container">
<center><h2>Student List</h2></center>
<a class="btn btn-default btn-primary" href="/LMS/admin/register" style="float:right" >New</a><br><br>
<table class="table table-striped" border="1" style="padding-top:100px">
<tr>
	   <td>Email</td> 
	   <td>Name</td>
	   <td>Update</td>
	   <td>Delete</td>
	</tr>
<c:forEach var="std" items="${studentList}">
	<tr>
	   <td>${std.email}</td> 
	   <td>${std.name}</td>
	   <td><a class="btn btn-success" href="/LMS/admin/emailupdate?email=${std.email}&name=${std.name}" >Update</a></td>
	   <td><a class="btn btn-danger" href="/LMS/admin/delete?email=${std.email}" >Delete</a></td>
	</tr>
</c:forEach>
</table>
<a class="btn btn-default btn-primary" href="/LMS/admin/downloadTimeTable">Show Timetable</a>
<a class="btn btn-default btn-primary" href="/LMS/admin/showUpload" style="float:right" >Upload</a>
</div>
</body>
</html>