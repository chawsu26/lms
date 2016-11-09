<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/LMS/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/LMS/css/bread-crumbs.css" />
<title></title>
<script src="jquery-3.1.1.js"></script>
</head>


<body>	
	<br>&nbsp;</br>
	<div class="container" style="padding-top:10px">
	<div class="panel panel-default" >
		<div class="panel-heading"><strong>Create New Student</strong></div>
		<div class="panel-body">	
			<div class="col-md-8">
		        <form action="/LMS/admin/createButton">
		 		  <div class="form-group">
					<label for="email">Email:</label> <input type="text" name="email" id="email" class="form-control"/>
				  </div>
				  <div class="form-group">
				    <label for="name">Name:</label><input type="text" name="name" id="name"  class="form-control"/>
				  </div>
				<br>
				<input type="submit" class="btn btn-primary" value="Create" style="float:right" />
			   </form>
		    </div><!-- col-md-8 END -->
		 </div><!-- Panel End  -->
	</div><!-- Panel END -->
    </div>
</body>
</html>