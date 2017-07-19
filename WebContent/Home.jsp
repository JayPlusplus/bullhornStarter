<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<style>
body {background-color: powderblue;}
h1   {color: blue;}
p    {color: red;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome!</title>
</head>

<body>

<jsp:include page="navbar.jsp"></jsp:include>
<img src="bullhornlogo50x50.png" width="88" height="88">
<h1>this is the home page</h1>
<h1>${message}</h1>
<h1>Welcome, ${user.getUsername()}</h1>
<h2>${user.getMotto()}</h2>


<form role="form" action="PostServ" method="post" onsubmit="return validate(this);">

    <div class="form-group">  
       <label for="post">Create New Post (141 char):</label>
       <textarea name= "posttext" id="posttext" class="form-control" rows="6" placeholder= "Express yourself!" maxlength="141"></textarea>
		<div id="textarea_feedback"></div>   
    </div> 
    <div class = "form-group"> 
       <input type="submit" value="Submit" id="submit"/>
       <input type="reset" value="Clear"/>
    </div>  
</form> 
<img src="bullhornlogo.png" width="128" height="128">

<script>
$(document).ready(function() {
    var text_max = 141;
    $('#textarea_feedback').html(text_max + ' characters remaining');

    $('#posttext').keyup(function() {
        var text_length = $('#posttext').val().length;
        var text_remaining = text_max - text_length;

        $('#textarea_feedback').html(text_remaining + ' characters remaining');
    });
});
function validate(form) {
	valid = true;
	if ($('#posttext').val().length==0){
		alert("You may not submit an empty post.");
		valid = false;
	}
	return valid;
}
</script>

</body>
</html>