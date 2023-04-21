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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Customer Support</title>
</head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <a href="${pageContext.request.contextPath}/ticket/list" class="w3-bar-item w3-button">Photo Blog</a>
        <!-- Right-sided navbar links. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="<c:url value="/ticket" />" class="w3-bar-item w3-button">Return to list tickets</a>
            <a href="#" class="w3-bar-item w3-button"><c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form></a>
        </div>
    </div>
</div>


<h2>Edit Ticket #${ticket.id}</h2>
<h2>Edit #${ticket.id}</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="ticketForm">
<div class="grid-container"
     style="width: 40%;">
    <form:label path="subject">Subject</form:label><br/>
    <form:input type="text" path="subject" /><br/><br/>
    <form:label path="body">Body</form:label><br/>
    <form:textarea path="body" rows="5" cols="30" /><br/><br/>
    <b>Add more attachments</b><br />
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Save"/><br/><br/>
</div>
</form:form>

</body>
</html>