<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <title>Register</title>
</head>
<body>
<h1>Register</h1>

<c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
</c:if>

<c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
</c:if>

<form name="register2" method="GET" action="register2">
        <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username">
        </div>
        <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
</form>
</body>
</html>