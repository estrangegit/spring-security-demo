<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>luv2code Company Home Page</title>
	</head>
	<body>
		<h2>lu2code Company Home Page</h2>
		<p>Welcome to the luv2code Company Home Page</p>
		
		<hr>
		
		<!-- display user name and role -->
		<p>
			User: <security:authentication property="principal.username" />
			<br><br>
			Role(s): <security:authentication property="principal.authorities" />
		</p>
		
		<security:authorize access="hasRole('MANAGER')">
			<hr>		
			<!-- Add a link to point to /leaders ... this is for the managers -->
			<p>
				<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
			</p>
		</security:authorize>
				
		<security:authorize access="hasRole('ADMIN')">
			<hr>				
			<!-- Add a link to point to /systems ... this is for the admins -->
			<p>
				<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			</p>
		</security:authorize>		
		
		<hr>
		
		<!-- Add a logout button -->
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">		
			<input type="submit" value="Logout"/>
		</form:form>		
	</body>
</html>