<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="quiz.JdbcQuestionRepository" %>
<%@ page import="quiz.Question" %>
<%@ page import="quiz.Topics" %>

<html>
    <style>
    table, th, td {
      border-collapse: collapse;
    }
    </style>
    <body>
        <head>
        <!-- This will make the table look nicer -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
        </head>

        <h1>Add Question</h1>
            <form action="addQuestion", method="POST">

                <label for="topics">Choose a topic:</label>
                    <select name="topics" id="topics">
                        <option value="topic1"><%=Topics.JAVA %></option>
                        <option value="topic2"><%=Topics.PERL %></option>
                        <option value="topic3"><%=Topics.PYTHON %></option>
                        <option value="topic4"><%=Topics.C %></option>
                    </select>
                <br/>
                <div class="form-outline mb-4">
                    <input type="text" name="questionName" value="QuestionName..." onclick="this.value=''"/><br/>
                </div>
                <div class="form-outline mb-4">
                    <input type="text" name="answerOptions" value="AnswerOptions..." onclick="this.value=''"/><br/>
                </div>
                <div class="form-outline mb-4">
                     <input type="text" name="rightAnswer" value="RightAnswer..." onclick="this.value=''"/><br/>
                </div>
            <br/>
            <input type="submit" value="Add question" class="btn btn-primary btn-block"/>
            </form>

        <br/>
        <h2>Quiz</h2>
            <br/>
            <p2>A question from the quiz previously generated</p2>
            <br/>
            <form method="get" action="getAnswer.jsp" enctype=text/plain>
                <INPUT TYPE="radio" name="command" value="0"/>True
                <INPUT TYPE="radio" NAME="command" VALUE="1"/>False
                <INPUT TYPE="submit" VALUE="submit" class="btn btn-primary btn-block"/>
            </form>
        <br/>


        <h3>Question List</h3>
            <table border="1" class="table table-dark w-125 p-3" style="width:100%">
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>RightAnswer</th>
                    <th>AnswerOptions</th>
                    <th>Topics</th>
                </tr>
                    <%
                    JdbcQuestionRepository repository = new JdbcQuestionRepository();
                //     JpaStudentRepository repository = new JpaStudentRepository();
                    List<Question> questions = repository.getAllQuestions();
                    for (Question question : questions) {
                    %>
                         <tr>
                            <td><%= question.getId() %></td>
                            <td><%= question.getQuestionName() %></td>
                            <td><%= question.getRightAnswer() %></td>
                            <td><%= question.getAnswerOption() %></td>
                            <td><%= question.getTopic() %></td>
                        </tr>
                    <% } %>
            </table>

    </body>
</html>
