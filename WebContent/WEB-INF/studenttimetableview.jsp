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
<div class="row header" style="text-align:center;color:green">
<h3>TimeTableLists</h3>
</div>
<table id="myTable" class="table table-striped" >  
        <thead>  
           <tr>
	         <td><strong>Class</strong></td>
	         <td><Strong>TimeTable</Strong></td>
	         <td></td>
	         <td></td>
	      </tr>
        </thead> 
        <tbody>  
          <c:forEach var="std" items="${classList}">
	     	 <tr>
	   			<td>${std.class_name}</td>
	   			<td>${std.file_name}</td>
	   			<td><a class="btn btn-success" href="<%=path %>/admin/images?fileName=${std.file_name}" >View</a></td>
		  	</tr>
		  </c:forEach>
        </tbody>  
      </table>
	  </div>
</body>  
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</html>