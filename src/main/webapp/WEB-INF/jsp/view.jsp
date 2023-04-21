<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
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
            <a href="<c:url value="/ticket" />" class="w3-bar-item w3-button">Return to list tickets</a>
            <a href="#" class="w3-bar-item w3-button"><c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form></a>
        </div>
    </div>
</div>
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
    <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
        <c:if test="${!status.first}">, </c:if>
        <img class="w3-image" src="<c:url value="/ticket/${ticketId}/attachment/${attachment.id}" />" alt="Hamburger Catering" width="1600" height="800">
    </c:forEach>

    <div class="w3-display-bottomleft w3-padding-large w3-opacity">
    </div>
</header>

<div class="w3-content" style="max-width:1100px">

    <!-- About Section -->
    <div class="w3-row w3-padding-64" id="about">

            <h1 class="w3-center"><c:out value="${ticket.subject}"/></h1><br>
            <h5 class="w3-center"><c:out value="${ticket.date}"/></h5>
            <p class="w3-large"><c:out value="${ticket.body}"/></p>
        <center>
            <p class="w3-large"><span class="w3-tag w3-light-grey"><security:authorize access="hasRole('ADMIN') or
                          principal.username=='${ticket.customerName}'">
                [<a href="<c:url value="/ticket/edit/${ticket.id}" />">Edit</a>]
            </security:authorize></br>
<security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/ticket/delete/${ticket.id}" />">Delete</a>]
</security:authorize><c:if test="${!empty ticket.attachments}">

                <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
                    <c:if test="${!status.first}">, </c:if>
                </c:forEach><br/><br/>
            </c:if></span></p>
        </center>
        <form id="comment-form" method="Get" action="comments">
            <div>
                <label for="message">留言：</label>
                <input id="id" name="id" value="${ticket.id}" hidden>
                <textarea id="message" name="message" rows="3"></textarea>
            </div>
            <button >提交留言</button>
        </form>

    </div>
</div>
</body>
</html>
