package quiz;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JdbcQuestionRepository repository = new JdbcQuestionRepository();


        String questionName = req.getParameter("questionName");
        String rightAnswer = req.getParameter("rightAnswer");
        String answerOption = req.getParameter("answerOption");
        Topic topic = Topic.valueOf(req.getParameter("topic"));

        Question question= new Question( questionName, rightAnswer, answerOption, topic);
        repository.addQuestion(question);

        resp.getOutputStream().println("Added!");
    }


}