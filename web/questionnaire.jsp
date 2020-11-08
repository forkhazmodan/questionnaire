<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>

<body>

<% String username = (String)session.getAttribute("username"); %>

<% if (username == null || "".equals(username)) { %>
<h1>You have no access to this page</h1>
<a href="/">Return back</a>
<% } else { %>
<h1>You are logged in as: <%= username %></h1>

<form action="/questionnaire" method="POST">
    <fieldset>
        <legend>Question 1?</legend>
        <p>
            <input type="radio" name="answers[0]" value="yes"> создание пунктуальности (никогда не
            будете никуда опаздывать);<Br>
            <input type="radio" name="answers[0]" value="no"> излечение от пунктуальности (никогда
            никуда не будете торопиться);<Br>
            <input type="radio" name="answers[0]" value="other"> изменение восприятия времени и часов.
        </p>
    </fieldset>

    <fieldset>
        <legend>Question 2?</legend>
        <p>
            <input type="radio" name="answers[1]" value="yes"> создание пунктуальности (никогда не
            будете никуда опаздывать);<Br>
            <input type="radio" name="answers[1]" value="no"> излечение от пунктуальности (никогда
            никуда не будете торопиться);<Br>
            <input type="radio" name="answers[1]" value="other"> изменение восприятия времени и часов.
        </p>
    </fieldset>

    <fieldset>
        <legend>Question 3?</legend>
        <p>
            <input type="radio" name="answers[2]" value="yes"> создание пунктуальности (никогда не
            будете никуда опаздывать);<Br>
            <input type="radio" name="answers[2]" value="no"> излечение от пунктуальности (никогда
            никуда не будете торопиться);<Br>
            <input type="radio" name="answers[2]" value="other"> изменение восприятия времени и часов.
        </p>
    </fieldset>
    <br>
    <input type="submit" value="Submit">
</form>
<% } %>



</body>
</html>