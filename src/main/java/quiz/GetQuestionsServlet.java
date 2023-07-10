package quiz;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/questions")
public class GetQuestionsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JdbcQuestionRepository repository = new JdbcQuestionRepository();
        List<Question> questions = repository.getAllQuestions();

        resp.setContentType("text/html");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head><title>Question List From DO GET method</title></head>");
        resp.getWriter().println("<body>");
        resp.getWriter().println("<h1>Question List From DO GET method</h1>");
        resp.getWriter().println("<table border=\"1\">");
        resp.getWriter().println("<tr><th>ID</th><th>QuestionName</th><th>RightAnswer</th><th>WrongAnswer</th></tr>");

        for (Question question : questions) {
            resp.getWriter().println("<tr>");
            resp.getWriter().println("<td>" + question.getId() + "</td>");
            resp.getWriter().println("<td>" + question.getQuestionName() + "</td>");
            resp.getWriter().println("<td>" + question.getGoodAnswer() + "</td>");
            resp.getWriter().println("<td>" + question.getWrongAnswer()+ "</td>");
            resp.getWriter().println("</tr>");
        }
        resp.getWriter().println("</table>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }
}
