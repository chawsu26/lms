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
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
<script>
$(document).ready(function(){
	   $("#importfile").click(function(){
	   		alert('<spring:message code="admin.title.fileimport" text="default text" />');
	   });
	});
</script>
<body style="margin:20px auto; font-family=Zawgyi-One">
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/admin/downloadTimeTable"><spring:message code="admin.title.showtimetable" text="default text" /></a></li>
     		<li><a href="<%=path %>/admin/showsectionmaterial"><spring:message code="admin.title.sectionmaterial" text="default text" /></a></li>
     		<li><a href="<%=path %>/admin/examresultchart"><spring:message code="admin.title.examresultchart" text="default text" /></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div>
<div class="container">
<center><h2><spring:message code="admin.title.studentlist" text="default text" /></h2></center>
<table id="myTable" class="table table-striped" >  
        <thead>  
         <tr>
		   <td><strong><spring:message code="admin.title.email" text="default text" /></strong></td> 
		   <td><strong><spring:message code="admin.title.name" text="default text" /></strong></td>
		   <td><strong><spring:message code="admin.title.fathername" text="default text" /></strong></td>
		   <td><strong><spring:message code="admin.title.dob" text="default text" /></strong></td>
		   <td><strong><spring:message code="admin.title.address" text="default text" /></strong></td>
		   <td><strong><spring:message code="admin.title.class" text="default text" /></strong></td>
		   <td><strong></strong></td>
		   <td></td>
		   <td></td>
	    </tr> 
        </thead> 
        <tbody>  
          <c:forEach var="std" items="${studentList}">
			<tr>
			   <td>${std.email}</td> 
			   <td>${std.name}</td>
			   <td>${std.fathername}</td>
			   <td>${std.dob}</td>
			   <td>${std.address}</td>
			   <td>${std.classname}</td>
			   <td>${std.type}</td>
			   <td><a class="btn btn-success" href="<%=path %>/admin/emailupdate?email=${std.email}&name=${std.name}&fathername=${std.fathername}&dob=${std.dob}&address=${std.address}" ><spring:message code="admin.title.update" text="default text" /></a></td>
			   <td><a class="btn btn-danger" href="<%=path %>/admin/delete?email=${std.email}" ><spring:message code="admin.title.delete" text="default text" /></a></td>
			</tr>
		  </c:forEach>
        </tbody>  
      </table>  
<a class="btn btn-default btn-primary" href="<%=path %>/admin/register"><spring:message code="admin.title.newstudent" text="default text" /></a>
<a class="btn btn-default btn-primary" href="<%=path %>/admin/downloadTimeTable"><spring:message code="admin.title.showtimetable" text="default text" /></a>
<a class="btn btn-default btn-primary" href="<%=path %>/admin/showsectionmaterial"><spring:message code="admin.title.sectionmaterial" text="default text" /></a>
<a class="btn btn-default btn-primary" href="<%=path %>/admin/examresultchart"><spring:message code="admin.title.examresultchart" text="default text" /></a>
<a class="btn btn-default btn-primary" href="<%=path %>/admin/fileimport" id="importfile" style="float:right"><spring:message code="admin.title.importfile" text="default text" /></a>
</div>
</body>
</html>