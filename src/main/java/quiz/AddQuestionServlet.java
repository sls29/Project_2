package quiz;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.ServletException;
import java.io.IOException;
@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JdbcQuestionRepository repository = new JdbcQuestionRepository();


        String questionName = req.getParameter("questionName");
        String goodAnswer = req.getParameter("goodAnswer");
        String wrongAnswer = req.getParameter("wrongAnswer");

        Question question= new Question(questionName, goodAnswer, wrongAnswer);
        repository.addQuestion(question);
        resp.getOutputStream().println("Added!");

    }


}