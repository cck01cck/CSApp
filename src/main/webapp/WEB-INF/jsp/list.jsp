<!DOCTYPE html>
<html>
<head>
  <title>Customer Support</title>

  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
    }

    .flip-card {
      background-color: transparent;
      width: 300px;
      height: 300px;
      perspective: 1000px;
    }

    .flip-card-inner {
      position: relative;
      width: 100%;
      height: 100%;
      text-align: center;
      transition: transform 0.6s;
      transform-style: preserve-3d;
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    }

    .flip-card:hover .flip-card-inner {
      transform: rotateY(180deg);
    }

    .flip-card-front, .flip-card-back {
      position: absolute;
      width: 100%;
      height: 100%;
      -webkit-backface-visibility: hidden;
      backface-visibility: hidden;
    }

    .flip-card-front {
      background-color: #000000;
      color: black;
    }

    .flip-card-back {
      background-color: #d5ad2b;
      color: white;
      transform: rotateY(180deg);
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
        <a href="#home" class="w3-bar-item w3-button">Photo Blog</a>
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
<h2>Photo</h2>
<center>
<c:choose>
  <c:when test="${fn:length(ticketDatabase) == 0}">
    <i>There are no tickets in the system.</i>
  </c:when>

  <c:otherwise>
      <div class="row">
    <c:forEach var="attachment" items="${UserDatabase}" varStatus="status">
      <c:forEach var="entry" items="${ticketDatabase}" varStatus="innerStatus" begin="0">
        <c:if test="${status.count == innerStatus.count}">
        <div class="column">
            <div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
          <img src="<c:url value="/ticket/1/attachment/${attachment.id}" />" width="300" height="300">
    </div>
    <div class="flip-card-back">
          Ticket ${entry.date}:${entry.id}
          <a href="<c:url value="/ticket/view/${entry.id}" />">
            <c:out value="${entry.subject}"/></a>
          (customer: <c:out value="${entry.customerName}"/>)
          <security:authorize access="hasRole('ADMIN') or
                                principal.username=='${entry.customerName}'">
            [<a href="<c:url value="/ticket/edit/${entry.id}" />">Edit</a>]
          </security:authorize>
          <security:authorize access="hasRole('ADMIN')">
            [<a href="<c:url value="/ticket/delete/${entry.id}" />">Delete</a>]
          </security:authorize>
    </div>
  </div>
</div>
        </div>
        </c:if>
      </c:forEach>
    </c:forEach>
      </div>
    </center>
  </c:otherwise>


</c:choose>
</body>
</html>