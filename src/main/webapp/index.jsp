<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.quiz.JdbcQuestionRepository" %>
<%@ page import="java.quiz.Question" %>

<html>
    <body>
        <h1>Add Question</h1>
            <form action="addQuestion.jsp">
                <div class="form-outline mb-4">
                    <input type="text" name="question" value="..." onclick="this.value=''"/><br/>
                </div>
                <div class="form-outline mb-4">
                    <input type="text" name="goodAnswer" value="..." onclick="this.value=''"/><br/>
                </div>
                <div class="form-outline mb-4">
                     <input type="text" name="badAnswer" value="..." onclick="this.value=''"/><br/>
                </div>
            <br/>
            <input type="submit" value="Add question" class="btn btn-primary btn-block"/>
            </form>

        <br/>
        <br/>
        <h1>Question List</h1>
        <table border="1" class="table table-dark w-25 p-3"
            <tr>
                <th>ID</th>
                <th>Question</th>
                <th>Good Answer</th>
                <th>Bad Answer</th>
            </tr>
            <%
                JdbcQuestionRepository repository = new JdbcQuestionRepository();
                LinkedList<Question> questions = repository.getAllQuestions();
                for (Question question : questions) {
            %>
                <tr>
                    <td><%=question.getId() %></td>

                    <td><%=question.getGoodAnswer() %></td>
                    <td><%=question.getBadAnswer() %></td>
                </td>
            <% } %>
        </table>

    </body>
</html>
