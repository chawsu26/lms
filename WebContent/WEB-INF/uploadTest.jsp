<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link href="/LMS/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/LMS/css/bread-crumbs.css" />
<title></title>
<script src="jquery-3.1.1.js"></script>
</head>


<body>	
	<br>&nbsp;</br>
	<div class="container" style="padding-top:10px">
	<div class="panel panel-default" class="col-md-8">
		<div class="panel-heading"><strong>Upload Timetable</strong></div>
		<div class="panel-body">
		<form method="POST" action="/LMS/admin/uploadFile" enctype="multipart/form-data">	
			<div class="col-md-6">
		        <div class="form-group">
				<label for="class">Class:</label>
				<select name="class_name" id="class" class="form-control">
					<option>Section-A</option>
					<option>Section-B</option>
					<option>Section-C</option>
					<option>Section-D</option>
					<option>Section-E</option>
				</select>
		    </div>
		      <div>Time Table:<input type="file" name="file"></div><br>
		      <input type="submit" value="Upload"> 
		    </div><!-- col-md-6 END -->
		   </form>
		 </div><!-- Panel End  -->
	</div><!-- Panel END -->
    </div>
</body>
</html>