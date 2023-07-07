<%@ page import="java.quiz.Question, java.quiz.JdbcQuestionRepository" %>

<%
  String question = request.getParameter("question");
  String goodAnswer = request.getParameter("goodAnswer");
  String badAnswer = request.getParameter("badAnswer");
  Question question = new Question(question, goodAnswer, badAnswer);

  JdbcQuestionRepository questionRepo = new JdbcQuestionRepository();

  questionRepo.addQuestion(question);

%>

  <meta http-equiv="Refresh" content="0; url='/world" />