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

        String qName = req.getParameter("questionName");
        String gAnswer = req.getParameter("goodAnswer");
        String wAnswer = req.getParameter("wrongAnswer");

        Question question= new Question(qName, gAnswer, wAnswer);
        repository.addQuestion(question);

        resp.getOutputStream().println("Added!");

    }


}