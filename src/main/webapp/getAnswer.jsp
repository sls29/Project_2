<%@ page import="quiz.Question, quiz.JdbcQuestionRepository" %>

<%
String sCommand = request.getParameter("command");
out.println(sCommand);
%>
