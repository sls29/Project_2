<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="quiz.JdbcQuestionRepository" %>
<%@ page import="quiz.Question" %>

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
                <div class="form-outline mb-4">
                    <input type="text" name="questionName" value="QuestionName..." onclick="this.value=''"/><br/>
                </div>
                <div class="form-outline mb-4">
                    <input type="text" name="goodAnswer" value="GoodAnswer..." onclick="this.value=''"/><br/>
                </div>
                <div class="form-outline mb-4">
                     <input type="text" name="wrongAnswer" value="WrongAnswer..." onclick="this.value=''"/><br/>
                </div>
            <br/>
            <input type="submit" value="Add question" class="btn btn-primary btn-block"/>
            </form>

        <br/>
        <br/>


        <h1>Question List</h1>
            <table border="1" class="table table-dark w-125 p-3" style="width:100%">
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>RightAnswer</th>
                    <th>WrongAnswer</th>

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
                            <td><%= question.getGoodAnswer() %></td>
                            <td><%= question.getWrongAnswer() %></td>

                        </tr>
                    <% } %>
            </table>

    </body>
</html>
