<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<script src="<%=path %>/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
</head>
<body style="font-family:Zawgyi-One">
<div class='navbar navbar-default navbar-static-top'>
     <div class='container'>
     	<ul class='nav navbar-nav navbar-right subtitle'>
     		<li><a href="<%=path %>/student/viewtimetable?className=${className}&email=${email }&Name=${Name}"><span class="glyphicon glyphicon-home"></span></a></li>
     		<li><a href="<%=path %>/home/showLogin"><spring:message code="admin.title.signout" text="default text" /></a></li>
     	</ul>
     </div>
</div>

<div ><h1><center><spring:message code="admin.title.hello" text="default text" /> ${Name }</center></h1></div>
<div id="slider">
			<div id="carousel-slider" class="carousel slide" data-ride="carousel">
					<!-- indicators -->
					<ol class="carousel-indicaters visible-xs">
						<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-slider" data-slide-to="1"></li>
						<li data-target="#carousel-slider" data-slide-to="2"></li>	
					</ol>

					<div class="carousel-inner">
						<div class="item active">
							<img src="<%=path %>/images/5.png" class="img-responsive" alt="">
						</div>
						<div class="item">
							<img src="<%=path %>/images/6.png" class="img-responsive" alt="">
						</div>
						<div class="item">
							<img src="<%=path %>/images/7.png" class="img-responsive" alt="">
						</div>
					</div>

					 <a class="left carousel-control" href="#carousel-slider" role="button" data-slide="prev">
    					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    					<span class="sr-only">Previous</span>
  					</a>
					<a class="right carousel-control" href="#carousel-slider" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					</a>

			</div><!--carousel slider -->
	</div>

<div class='container' style="padding-top:50px">
<div class='row'>
<div class='col-md-5'><img class="img-responsive" src="<%=path %>/images/IMG_5953.GIF" /></div>
<div class='col-md-7' style="padding-top:150px">
	<div class='col-md-4'>
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">	
	   			<a href="/LMS/admin/images?fileName=${className}.jpg"><spring:message code="admin.title.viewtimetable" text="default text" /></a></br>
	   		</div>
	   	</div>
	 </div>
	 <div class='col-md-4'>
		<div class="panel panel-default">
			<div class="panel-heading"></div>
	   		<div class="panel-body">
	   		<a href="/LMS/student/studentMaterial?className=${className}&email=${email }&Name=${Name}"><spring:message code="admin.title.viewsectionmaterial" text="default text" /></a>
	   		</div>
	   	</div>
   	</div>
   	<div class='col-md-4'>
		<div class="panel panel-default">
			<div class="panel-heading"></div>
	   		<div class="panel-body">
	   		<a href="/LMS/student/examresultview?className=${className}&email=${email }&Name=${Name}"><spring:message code="admin.title.viewexamresult" text="default text" /></a>
	   		</div>
	   	</div>
   	</div>
</div>
</div>
</div>
</body>
</html>