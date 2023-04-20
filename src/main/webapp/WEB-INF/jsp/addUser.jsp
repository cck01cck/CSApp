<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href=
                  "https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation.min.css"
          crossorigin="anonymous">
    <script src=
                    "https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/js/foundation.min.js"
            crossorigin="anonymous"></script>
    <title>Customer Support</title>
    <style>
        .error {
            color: red;
            font-weight: bold;
            display: block;
        }
    </style>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <a href="#home" class="w3-bar-item w3-button">Photo Blog</a>
        <!-- Right-sided navbar links. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="<c:url value="/user" />" class="w3-bar-item w3-button">Return to list users</a>
            <a href="#" class="w3-bar-item w3-button"><c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form></a>
        </div>
    </div>
</div>

<h2>Create a User</h2>
<form:form method="POST" modelAttribute="ticketUser">
<div class="grid-container"
     style="width: 40%;">
    <form:label path="username">Username</form:label><br/>
    <form:errors path="username" cssClass="error" />
    <form:input type="text" path="username"/><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:errors path="password" cssClass="error" />
    <form:input type="text" path="password"/><br/><br/>
    <form:label path="confirm_password">Confirm Password</form:label><br/>
    <form:errors path="confirm_password" cssClass="error" />
    <form:input type="text" path="confirm_password" /><br/><br/>
    <form:label path="roles">Roles</form:label><br/>
    <form:errors path="roles" cssClass="error" />
    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
    <br/><br/>
    <input type="submit" value="Add User"/>
</div>
</form:form>
</body>
</html>