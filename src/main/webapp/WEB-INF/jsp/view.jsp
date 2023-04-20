<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Ticket #${ticketId}: <c:out value="${ticket.subject}"/></h2>
<security:authorize access="hasRole('ADMIN') or
                          principal.username=='${ticket.customerName}'">
    [<a href="<c:url value="/ticket/edit/${ticket.id}" />">Edit</a>]
</security:authorize>
<security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/ticket/delete/${ticket.id}" />">Delete</a>]
</security:authorize>
<br/><br/>
<i>Customer Name - <c:out value="${ticket.date}"/></i><br/><br/>
<c:out value="${ticket.body}"/><br/><br/>
<c:if test="${!empty ticket.attachments}">
    Attachments:
    <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
        <c:if test="${!status.first}">, </c:if>
        <img src="<c:url value="/ticket/${ticketId}/attachment/${attachment.id}" />">
            <c:out value="${attachment.name}"/></img>
        [<a href="<c:url value="/ticket/${ticketId}/delete/${attachment.id}" />">Delete</a>]
    </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="/ticket" />">Return to list tickets</a>

</body>
</html>
