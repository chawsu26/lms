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
<h2>Students</h2>
<table class="table table-striped" border="1" style="padding-top:100px">
		  <tr>
	         <td>Class</td>
	         <td>TimeTable</td>
	         <td></td>
	      </tr>
	<c:forEach var="std" items="${classList}">
	      <tr>
	   		<td>${std.class_name}</td>
	   		<td>${std.file_name}</td>
	   		<td><a class="btn btn-success" href="/LMS/images/${std.file_name}" >View</a></td>
		  </tr>
	</c:forEach>
</table>
</div>
</body>
</html>