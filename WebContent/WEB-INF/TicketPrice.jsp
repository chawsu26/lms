<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/FirstProject/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/FirstProject/css/bread-crumbs.css" />
<link rel="stylesheet" type="text/css" href="/FirstProject/css/jcarousel.basic.css">
<script src="/FirstProject/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/FirstProject/js/jcarousel.min.js"></script>
<script type="text/javascript" src="/FirstProject/js/jcarousel.basic.js"></script>
<script src="/FirstProject/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		/*$("#btnNext").click(function(){
			var nextBtn=$(this).attr('#btnNext');
	   		//window.location ="Confirm.jsp";
	   		$("#all-elements").fadeOut(0);
	   		$("nextBtn").fadeIn("slow");
	   		return false;
		});*/
		
		/*$("#btnBack").click(function(){
			var backBtn=$(this).attr("btnBack");
			window.location="index.jsp";
		});*/
	});
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<ul class="breadcrumb">
			<li class="completed"><a href="/FirstProject/home/index">Choose the City</a></li>
			<li class="active"><a href="javascript:void(0);">View the Fees</a></li>
			<li><a href="javascript:void(0);">Payment</a>/li>
			<li><a href="javascript:void(0);">Payment Confirmation</a></li>
		</ul>
	</div>
</div>
 	<center>
 		
 		<h1>Yangon ------> ${city}</h1>
 		<br>
 		<h2>Price: ${price} Ks</h2>
 		<br>
 		<div class="wrapper" id="city">
            <div class="jcarousel-wrapper">
                <div class="jcarousel">
                    <ul>
                        <li><img src="/FirstProject/images/${city}/1.jpg" width="600" height="400" alt=""></li>
                        <li><img src="/FirstProject/images/${city}/2.jpg" width="600" height="400" alt=""></li>
                        <li><img src="/FirstProject/images/${city}/3.jpg" width="600" height="400" alt=""></li>
                    </ul>
                </div>

                <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                <a href="#" class="jcarousel-control-next">&rsaquo;</a>
                
                <p class="jcarousel-pagination">
                    
                </p>
            </div>
       </div>
        
 		<br>
 		<form action="/FirstProject/home/crdCard">
 		<input type="hidden" name="city" value='${city}' />
 		<input type="hidden" name="price" value='${price}' />
 		<input type="submit" value="Next" id="btnNext"/>
 		</form>
 	</center>
</body>
</html>