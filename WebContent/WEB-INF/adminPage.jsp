<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/FirstProject/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/FirstProject/css/bread-crumbs.css" />
<script src="/FirstProject/js/jquery-3.1.1.js"></script>
<script src="/FirstProject/js/bootstrap.js"></script>
<title></title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form action="/FirstProject/admin/download">
<table class="table table-striped" border="1" style="padding-top:100px">
<tr>
	   <td>CREDIT CARD NO:</td> 
	   <td>EXPIRY DATE</td>
	   <td>STATUS</td>
	   <td></td>
	   <td></td>
	</tr>
<c:forEach var="creditCard" items="${cardList}">
	<tr>
	   <td>${creditCard.creditCardNo}</td> 
	   <td>${creditCard.expiryDate}</td>
	   <td>${creditCard.status}</td>
	   <td><a class="btn btn-success" href="/FirstProject/admin/approve?cardNo=${creditCard.creditCardNo}" >Approve</a></td>
	   <td><a class="btn btn-danger" href="/FirstProject/admin/delete?cardNo=${creditCard.creditCardNo}" >Delete</a></td>
	</tr>
</c:forEach>
</table>
<input type="submit" value="download" class="btn btn-default" />
</form>
</div>
</body>
</html>