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
<body style="margin:20px auto ; font-family:Zawgyi-One"> 
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div>
  <form action="<%=path %>/admin/sectionmaterial?classname=${classname}" >
	<div class="container">
		<div class="col-md-4" style="padding-top:100px">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body text-center">
			 <div class="form-group">
				<input type="radio" name="section" value="Section-A"> Section-A<br>
				<input type="radio" name="section" value="Section-B"> Section-B<br>
				<input type="radio" name="section" value="Section-C"> Section-C<br>
				<input type="radio" name="section" value="Section-D"> Section-D<br>
				<input type="radio" name="section" value="Section-E"> Section-E<br>
			 </div>
			  <a href="/LMS/admin/student" class="btn btn-default"><spring:message code="admin.title.back" text="default text" /></a>
		     <input type="submit" class="btn btn-default" value=<spring:message code="admin.title.view" text="default text" />>
	   		</div>
	   	</div>
   	    </div>
	</div>
   </form>
</body>
</html>


