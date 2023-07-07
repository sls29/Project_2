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
        <h1>Question List</h1>
        <table border="1" class="table table-dark w-25 p-3"
            <tr>
                <th>ID</th>
                <th>Question</th>
                <th>Good Answer</th>
                <th>Wrong Answer</th>
            </tr>

        </table>

    </body>
</html>
