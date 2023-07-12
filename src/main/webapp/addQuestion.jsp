<%@ page import="quiz.Question, quiz.JdbcQuestionRepository, quiz.Topic" %>

<%
  String questionName = request.getParameter("questionName");
  String rightAnswer = request.getParameter("rightAnswer");
  String answerOption = request.getParameter("answerOption");
  Topic topic = Topic.valueOf(request.getParameter("topic"));

  Question question = new Question(questionName, rightAnswer, answerOption);

  JdbcQuestionRepository repository = new JdbcQuestionRepository();

  repository.addQuestion(question);

%>

  <meta http-equiv="Refresh" content="0; url='/Project_2" />