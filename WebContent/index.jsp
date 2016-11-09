<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="jquery.js"></script>
<% response.sendRedirect("/LMS/admin/student"); %>
<script>
var racks;
$(document).ready(function(){
	//Now we will link the select box "change" event with ajax call
	$.ajax({
		    type: "GET",
		    url: "http://localhost:8080/FirstProject/home/hello",
		    contentType: "json",
		    success: function (data) {
		    		//Now let's access the map data
		  		alert(data);
		    }	
	});
	$("#rack").change(function(){
		alert("Hello")
		$("#mytable").html("");
		var selectedRack = racks[$(this).val()];
		for(var i=0;i<selectedRack.length;i++){
			var record = "<tr><td>"+selectedRack[i].author+"</td><td>"+selectedRack[i].name+"</td></tr>";			
			$("#mytable").append(record);
		}
	});
});
</script>
<body>
	
</body>
</html>