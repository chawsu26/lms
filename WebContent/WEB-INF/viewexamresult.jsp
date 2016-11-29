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
</head>
<body>
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/student/viewtimetable?className=${className}&email=${email }&Name=${Name}"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin">Sign Out</a></li>
     	</ul>
     </div>
</div>

<div class="container">
<center><h2>Your Result is Here!!</h2></center>
<table id="myTable" class="table table-striped" >  
        <thead>  
          <tr>
		   	<td><strong>Email</strong></td>
		   	<td><strong>Subject Name</strong></td>
		   	<td><strong>Grade</strong></td>
		  </tr>
        </thead> 
        <tbody>  
        <c:forEach var="exm" items="${examresults}">
		  <tr>
	     	 	<td>${exm.email}</td>
	     	 	<td>${exm.subject.subjectName}</td>	
	     	 	<td>${exm.mark}</td>	
	      </tr>
		</c:forEach>
        </tbody>  
</table> 
<div><a class="btn btn-primary" href="<%=path %>/student/viewtimetable?className=${className}&email=${email }&Name=${Name}" style="float:right">Back</a></div>
 <div class="col-md-6">
 <table id="mytable" class="table table-striped" >  
        <thead>  
         <tr>
		   <td><strong>Grade</strong></td> 
		   <td><strong>Mark</strong></td>
	    </tr> 
        </thead> 
        <tbody>  
          <tr>
		   <td>A</td> 
		   <td>80-100</td>
	    </tr> 
	    <tr>
		   <td>B</td> 
		   <td>60-79</td>
	    </tr>
	    <tr>
		   <td>C</td> 
		   <td>40-59</td>
	    </tr>
	    <tr>
		   <td>D</td> 
		   <td>20-39</td>
	    </tr>
	    <tr>
		   <td>E</td> 
		   <td>0-19</td>
	    </tr>
        </tbody>  
      </table>
 </div>  
</div> 
<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</body>
</html>
