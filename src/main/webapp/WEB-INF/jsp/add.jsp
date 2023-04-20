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
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Create a Ticket</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="ticketForm">
<div class="grid-container"
     style="width: 40%;">
    <form:label path="subject">Subject</form:label><br/>
    <form:input type="text" path="subject"/><br/><br/>
    <form:label path="body">Body</form:label><br/>
    <form:textarea path="body" rows="5" cols="30"/><br/><br/>
    <b>Attachments</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</div>
</form:form>
</body>
</html>
