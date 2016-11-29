<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=path %>/js/jquery-3.1.1.js"></script>
<script src="jquery.slides.min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<body style="font-family:Zawgyi-One">
<% 
	String errMsg = (String) session.getAttribute("errorMsg");
    session.removeAttribute("errorMsg");
	if(errMsg==null) errMsg = "";
%>
<div class="container" style="padding-top:150px">
	<div class='row'>
	<div class='col-md-7'><img class="img-responsive" src="<%=path %>/images/UIT_Logo_Nero.jpg" /></div>
	<div class='col-md-4 col-md-offset-1'>
	<form action="<%=path %>/home/executelogin">
		<h2 class="form-signin-heading"><spring:message code="admin.title.signin" text="default text" /></h2> 
		<input type="text" name="email" class="form-control" placeholder="email@gmail.com"/><br>
		<input type="password" name="password" patttern="(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*?&])[a-z\d$@$!%*?&]{8,}" class="form-control" placeholder="password"/><br>
		<input type="submit" value="<spring:message code="admin.title.signin" text="default text" />" class="btn btn-md btn-primary btn-block"/></br>
		
		<ul class="nav nav-pills">
			<li><a href="/LMS/home/showLogin?lang=en"><spring:message code="admin.title.english" text="default text" /></a></li><li><a href="/LMS/home/showLogin?lang=mm"><spring:message code="admin.title.myanmar" text="default text" /></a></li>
		</ul>
	</form>
	</div>
	</div>
	</div>
</div>
<script>
var errMsg = "<%=errMsg%>";
if(errMsg!=""){
	alert(errMsg);
}
</script>
</body>
</html>