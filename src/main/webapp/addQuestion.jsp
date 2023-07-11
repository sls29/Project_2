<%@ page import="quiz.Question, quiz.JdbcQuestionRepository" %>

<%
  String qName = request.getParameter("questionName");
  String gAnswer = request.getParameter("rightAnswer");
  String aOption = request.getParameter("answerOption");
  Topics topic = request.getParameter("topics");

  Question question = new Question(qName, gAnswer, aOption, topic);

  JdbcQuestionRepository questionRepo = new JdbcQuestionRepository();

  questionRepo.addQuestion(question);

%>

  <meta http-equiv="Refresh" content="0; url='/Project_2" />