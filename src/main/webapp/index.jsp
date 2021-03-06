<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="container">
		<header>
			<h1>
				<span>Scalini Mode</span>
			</h1>
			<nav>
				<ul>
					<li id="actual"><a href="Servlet?command=Home">Home</a></li>
					<li><a href="Servlet?command=Overview">Overview</a></li>
					<li><a href="Servlet?command=Register">Register</a></li>
					<li><a href="Servlet?command=Reservation">Reservation</a></li>
					<c:if test="${person!=null}">
						<li><a href="Servlet?command=RegisterTests">Register Test Result</a></li>
					</c:if>
					<li><a href="Servlet?command=Contacts">Contacts</a></li>
				</ul>
			</nav>
			<h2>Home</h2>

		</header>
		<main>
			<c:if test="${not empty errors}">
				<div class="alert-danger">
					<ul>
						<c:forEach items="${errors}" var="error">
							<li>${error}</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${person==null}">
				<h3>Please log in</h3>
				<form method="post" novalidate="novalidate" action="Servlet?command=LogIn">
					<p><label for="userid">User id</label><input type="text" id="userid" name="userid" required></p>
					<p><label for="password">Password</label><input type="password" id="password" name="password" required></p>
					<p><input type="submit" id="logIn" value="Log in"></p>
				</form>
			</c:if>
			<c:if test="${person!=null}">
				<h3>Welcome <c:out value="${person.getFirstName()}"/></h3>
				<form method="post" action="Servlet?command=LogOut" novalidate="novalidate">
					<p><input type="submit" id="logOut" value="Log Out"></p>
				</form>
			</c:if>
		</main>
		<footer> &copy; Webontwikkeling 3, UC Leuven-Limburg </footer>
	</div>
</body>
</html>