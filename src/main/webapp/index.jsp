<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="quiz.JdbcQuestionRepository" %>
<%@ page import="quiz.Question" %>

<html>
    <body>
        <h1>Add Question</h1>
            <form action="addQuestion.jsp">
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


        <h1>Question List from the index.jsp file</h1>
            <table border="1" class="table table-dark w-25 p-3">
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
