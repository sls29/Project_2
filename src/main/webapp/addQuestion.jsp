<%@ page import="quiz.Question, quiz.JdbcQuestionRepository" %>

<%
  String qName = request.getParameter("questionName");
  String gAnswer = request.getParameter("goodAnswer");
  String wAnswer = request.getParameter("wrongAnswer");

  Question question = new Question(qName, gAnswer, wAnswer);

  JdbcQuestionRepository questionRepo = new JdbcQuestionRepository();

  questionRepo.addQuestion(question);

%>

  <meta http-equiv="Refresh" content="0; url='/Project_2" />