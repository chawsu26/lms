<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<script src="<%=path %>/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function(){
	   $("#importfile").click(function(){
	   		alert("Already Imported the File!");
	   });
	});
</script>
<script src="<%=path %>/js/bootstrap.js"></script>
<body style="margin:20px auto"> 
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin">Sign Out</a></li>
     	</ul>
     </div>
</div>
  <form action="<%=path %>/admin/sectionmaterial?classname=${classname}" >
	<div class="container">
		<div class="col-md-4" style="padding-top:100px">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body text-center">
			 <div><p>Are You Sure to Import?</p></div>
			  <a href="/LMS/admin/fileimport" class="btn btn-default">No</a>
		      <a href="/LMS/admin/fileimport" id="importfile" class="btn btn-default">Yes</a>
	   		</div>
	   	</div>
   	    </div>
	</div>
   </form>
</body>
</html>


