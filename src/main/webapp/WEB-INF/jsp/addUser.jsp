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
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

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