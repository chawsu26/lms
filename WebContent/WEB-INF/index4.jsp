<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<script src="js/bootstrap.js"></script>
<script src="jquery-3.1.1.js"></script>
<body>
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/home/showLogin">Sign Out</a></li>
     	</ul>
     </div>
</div>
<br>&nbsp;</br>
	<div class="container" style="padding-top:10px">
	<div class="panel panel-default" >
		<div class="panel-heading"><strong>Confirmation</strong></div>
		<div class="panel-body">
<center>
<p>EMAIL : ${email}</p></br>
<p>USERNAME : ${name}</p></br>
<p>FATHERNAME : ${fathername}</p></br>
<p>DATE OF BIRTH : ${dob}</p></br>
<p>ADDRESS : ${address}</p></br>
<p>CLASS: ${classname}</p></br>
<p>TYPE : ${type}</p></br>
<a class="btn btn-primary" href="<%=path %>/admin/student">Confirm</a>
</center>
 </div><!-- Panel End  -->
	</div><!-- Panel END -->
    </div>
</body>
</html>