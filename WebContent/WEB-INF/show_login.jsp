<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<script src="<%=path %>/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<script>
	/* function getAuthor(){
		$.ajax({
			  url: "/LMS/home/hello",
			  context: document.body
			}).done(function(result) {
			  alert(result[0].name);
			});
	}
	$(document).ready(function(){
		//document load
		$("#btnGet").click(function(){
			getAuthor();
		});
		
		
	}); */
</script>
<body style="margin:20px auto">
<div class="container" style="padding-top:150px">
	<div class='row'>
	<div class='col-md-7'><img class="img-responsive" src="<%=path %>/images/UIT_Logo_Nero.jpg" /></div>
	<div class='col-md-4 col-md-offset-1'>
	<form action="<%=path %>/home/executelogin">
		<h2 class="form-signin-heading">Please sign in</h2> 
		<input type="text" name="email" class="form-control" placeholder="email"/><br>
		<input type="password" name="password" class="form-control" placeholder="password"/><br>
		<input type="submit" value="Sign In" class="btn btn-md btn-primary btn-block"/></br>
	</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>