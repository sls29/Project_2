<%@ page import="quiz.Question, quiz.JdbcQuestionRepository" %>

<%
  String qName = request.getParameter("questionName");
  String rAnswer = request.getParameter("rightAnswer");
  String aOption = request.getParameter("answerOption");
  Topic topic = request.getParameter("topic"));

  Question question = new Question(qName, rAnswer, aOption, topic);

  JdbcQuestionRepository questionRepo = new JdbcQuestionRepository();

  questionRepo.addQuestion(question);

%>

  <meta http-equiv="Refresh" content="0; url='/Project_2" />