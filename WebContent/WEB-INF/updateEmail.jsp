<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String path = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/css/bread-crumbs.css" />
<title></title>
<script src="jquery-3.1.1.js"></script>
</head>


<body>	
	<br>&nbsp;</br>
	<div class="container" style="padding-top:10px">
	<div class="panel panel-default" >
		<div class="panel-heading"><strong>Update Student Information</strong></div>
		<div class="panel-body">	
			<div class="col-md-8">
		        <form action="<%=path %>/admin/update">
		 		  <div class="form-group">
		 		  <label for="email">Email:${email}<input type="hidden" name="email" value='${email}'></label> 
				  </div>
				  <div class="form-group">
				    <label for="name">Name:</label><input type="text" name="name" id="name" value='${name}' class="form-control"/>
				  </div>
				  <br>
				  <div class="form-group">
							<label for="class">Class:</label>
								<select name="classname" id="class" class="form-control">
									<option>Section-A</option>
									<option>Section-B</option>
									<option>Section-C</option>
									<option>Section-D</option>
									<option>Section-E</option>
								</select>
						 </div>
				<br>
				<input type="submit" class="btn btn-primary" value="Confirm" style="float:right" />
			   </form>
		    </div><!-- col-md-8 END -->
		 </div><!-- Panel End  -->
	</div><!-- Panel END -->
    </div>
</body>
</html>