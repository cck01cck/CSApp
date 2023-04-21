<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .column {
            float: left;
            width: 18%;
            padding: 1px;
            height: 300px; /* Should be removed. Only for demonstration */
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body {font-family: "Times New Roman", Georgia, Serif;}
        h1, h2, h3, h4, h5, h6 {
            font-family: "Playfair Display";
            letter-spacing: 5px;
        }
    </style>
</head>
<body>

<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <a href="${pageContext.request.contextPath}/ticket/list" class="w3-bar-item w3-button">Photo Blog</a>
        <!-- Right-sided navbar links. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="<c:url value="/ticket/create" />" class="w3-bar-item w3-button">Create a Ticket</a>
            <security:authorize access="hasRole('ADMIN')">
                <a href="<c:url value="/user" />" class="w3-bar-item w3-button">Manage User Accounts</a>
            </security:authorize>
            <a href="#" class="w3-bar-item w3-button"><c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form></a>
        </div>
    </div>
</div>

<h2>Tickets</h2>
<h2>History</h2>
<center>
    <c:choose>
    <c:when test="${fn:length(ticketDatabase) == 0}">
        <i>There are no tickets in the system.</i>
    </c:when>

    <c:otherwise>
    <div class="row">
        <table id="customers">
            <tr>
                <th>Username</th>
                <th>Photoname</th>
                <th>Date and Time</th>
            </tr>
            <c:forEach items="${ticketDatabase}" var="entry" >
                <tr>
                    <td>${entry.customerName}</td>
                    <td>${entry.subject}</td>
                    <td>${entry.date}</td>
                </tr>
            </c:forEach>
        </table>
        <c:forEach var="entry" items="${ticketDatabase}" varStatus="innerStatus" begin="0">

        </c:forEach>
</center>
</c:otherwise>


</c:choose>
</body>
</html>