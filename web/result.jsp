<%@ page import="java.util.Map" %><%--<%@ page import="java.util.List" %>--%>

<%--
  Created by IntelliJ IDEA.
  User: wowpr
  Date: 03.11.2020
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<style>
    .separator {
        display: flex;
        align-items: center;
        text-align: center;
    }
    .separator::before, .separator::after {
        content: '';
        flex: 1;
        border-bottom: 1px solid #000;
    }
    .separator::before {
        margin-right: .25em;
    }
    .separator::after {
        margin-left: .25em;
    }
</style>
<body>

<% Map<String, HttpSession> sessions = (Map<String, HttpSession>) request.getAttribute("sessions"); %>
<%--<% HttpSession session = (HttpSession) request.getAttribute("session"); %>--%>


<div class="separator">Your results:</div>
<table border="1">
    <caption>Hello, <strong><%= session.getAttribute("username") %></strong>, your questionnaire results is:</caption>
    <tr>
        <th>Question number</th>
        <th>Answer</th>
    </tr>
    <% int i = 1; %>
    <% for (String answer : (String[]) session.getAttribute("answers")) { %>
    <tr>
        <td>Question№ <%= i++ %></td>
        <td><%= answer %></td>
    </tr>
    <% } %>
</table>

<div class="separator">All user results:</div>
<% for (Map.Entry<String, HttpSession> userSession : sessions.entrySet()) { %>
<% String username = (String) userSession.getValue().getAttribute("username"); %>
<% String[] answers = (String[]) userSession.getValue().getAttribute("answers"); %>
<% if(username == null) continue; %>
<% if(answers == null) continue; %>

<table border="1">
    <caption><%= username %> questionnaire results:</caption>
    <tr>
        <th>Question number</th>
        <th>Answer</th>
    </tr>

    <% int j = 1; %>
    <% for (String answer : answers) { %>
    <tr>
        <td>Question№ <%= j++ %></td>
        <td><%= answer %></td>
    </tr>
    <% } %>

</table>

<% } %>

</body>
</html>
