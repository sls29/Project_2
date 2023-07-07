<%@ page import="quiz.Question, quiz.JdbcQuestionRepository" %>

<%
  String questionName = request.getParameter("questionName");
  String goodAnswer = request.getParameter("goodAnswer");
  String wrongAnswer = request.getParameter("wrongAnswer");
  Question question = new Question(questionName, goodAnswer, wrongAnswer);

  JdbcQuestionRepository questionRepo = new JdbcQuestionRepository();

  questionRepo.addQuestion(question);

%>

  <meta http-equiv="Refresh" content="0; url='/world" />