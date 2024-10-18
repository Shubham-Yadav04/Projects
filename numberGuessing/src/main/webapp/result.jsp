<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="l" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="result.css">
<title>Result</title>
</head>
<body>

<div>
<l:if test="${sessionScope.gameResult == 'win'}">
    <h1>Congratulations !!! You have guessed the number correctly</h1>
    <p>The number was: <%= session.getAttribute("numberToGuess") %></p>
</l:if>

<l:if test="${sessionScope.gameResult != 'win'}">
    <h1>No more chances left! Try again. The number was: <%= session.getAttribute("numberToGuess") %></h1>
</l:if>

<% session.invalidate(); %>

<button> <a href="home.jsp"> Play Again</a></button>
</div>

</body>
</html>