<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<%String path=request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/jcarousel.basic.css">
<script src="<%=path %>/js/jquery-3.1.1.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>

<style type="text/css">
	#container1 {
    background-color:;
}

.centered-form {
    margin-top: 40px;
    margin-bottom: 10px;
}

.centered-form .panel {
    background: rgba(255, 255, 255, 0.8);
    box-shadow: rgba(0, 0, 0, 0.1) 20px 20px 20px;
}

.margin-inner{
	margin-right : 5px;
	margin-left : 1px;
	}
	
.margin-inner-button{
        }
</style>

<body style="font-family:Zawgyi-One">
<% 
	String errMsg = (String) session.getAttribute("errorMsg");
    session.removeAttribute("errorMsg");
	if(errMsg==null) errMsg = "";
%>
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/admin/student"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div>
	<div class="container" style="padding-top: 30px" id="container1">
		<div class="row centered-form">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title text-center"><strong><spring:message code="admin.title.update" text="default text" /></strong></h3></div>
				<div class="panel-body">
				<form action="<%=path %>/admin/update">
							
					<div class="form-group margin-inner">
			  			<label for="email"><spring:message code="admin.title.email" text="default text" />:${email}</label>
					</div>
					<div class="form-group margin-inner">
						<label for="name"><spring:message code="admin.title.name" text="default text" />:</label> <input type="text" name="name" id="name" class="form-control" value="${name}"/>
					</div>
					
					<div class="form-group margin-inner">
						<label for="fathername"><spring:message code="admin.title.fathername" text="default text" />:</label><input type="text" name="fathername" id="fathername" value="${fathername}" class="form-control"/>
					</div>
					<div class="form-group margin-inner">
						<label for="dob"><spring:message code="admin.title.dob" text="default text" />:</label><input type="text" name="dob" id="dob" value='${dob}' class="form-control"/>
					</div>
					<div class="form-group margin-inner">
						<label for="address"><spring:message code="admin.title.address" text="default text" />:</label><input type="text" name="address" id="address"  value='${address}' class="form-control"/>
					</div>
					
					<div class="form-group margin-inner">
						<label for="password"><spring:message code="admin.title.password" text="default text" />:</label><input type="password" name="password" class="form-control" id="pwd1"/>
						<p style="color:red"><spring:message code="admin.title.pwdtext" text="default text" /></p>
					</div>
					
					<div class="form-group margin-inner">
						<label for="confirmpassword"><spring:message code="admin.title.confirmpassword" text="default text" />:</label><input type="password" name="confirmpassword" class="form-control" id="pwd2"/>
					</div>
					
					<div class="form-group margin-inner">
						<select name="classname" id="class" class="form-control">
									<option>Section-A</option>
									<option>Section-B</option>
									<option>Section-C</option>
									<option>Section-D</option>
									<option>Section-E</option>
									<option>Admin</option>
						</select>
					</div>
					
					<div class="form-group margin-inner">
						<select name="type" id="type" class="form-control">
									<option>student</option>
									<option>admin</option>
						</select>
					</div>
					<br>
					<center><input type="submit" value="<spring:message code="admin.title.update" text="default text" />" class="btn btn-default" id="btnUpdate" class="form-control"/></center>
					<input type="hidden" name="email" value="${email}"/>
				</form>	
				</div> <!-- Panel body End -->
			</div> <!-- Panel End -->
		</div>
		</div>	
	</div>
<script type="text/javascript">
$(document).ready(function () {
    $("#btnUpdate").click(function () {
    	 var pwd = $("#pwd1").val();
         var confirmpwd = $("#pwd2").val();
         if (pwd!=confirmpwd) {
             alert("<spring:message code="admin.title.notmatch" text="default text" />");
             return false;
         }
    	var errMsg = "<%=errMsg%>";
    	var name = $("#name").val();
        var fathername = $("#fathername").val();
        var dob = $("#dob").val();
        var address = $("#address").val();
    	var pwd = $("#pwd1").val();
        var confirmpwd = $("#pwd2").val();
        if(name=="" || fathername=="" || dob=="" || address=="" || pwd=="" || confirmpwd==""){
        	alert("<spring:message code="admin.title.fill" text="default text" />");
        	return false;
        }
        // regular expression to match required date format
        re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
        if(dob!='' && !dob.match(re)) {
          alert("<spring:message code="admin.title.datealert" text="default text" />" + dob);
          return false;
        }
      //password check
        var pwdPattern = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[a-z\A-Z\d$@$!%*?&]{8,}/;
        if(pwd!='' && !pwd.match(pwdPattern)) {
           	alert("<spring:message code="admin.title.weakpassword" text="default text" />");
            return false;
          }   
	 return true;

    });
});
</script>	
</body>
</html>