package quiz;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JdbcQuestionRepository repository = new JdbcQuestionRepository();

        Topics topic = Topics.valueOf(req.getParameter("questionTopics"));
        String qName = req.getParameter("questionName");
        String aOptions = req.getParameter("answerOption");
        String rAnswer = req.getParameter("rightAnswer");

        Question question= new Question(topic, qName, aOptions, rAnswer);
        repository.addQuestion(question);

        resp.getOutputStream().println("Added!");
    }


}