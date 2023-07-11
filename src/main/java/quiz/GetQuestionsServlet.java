package quiz;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/questions")
public class GetQuestionsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JdbcQuestionRepository repository = new JdbcQuestionRepository();
        List<Question> questions = repository.getAllQuestions();

        resp.setContentType("text/html");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head><title>Question List</title></head>");
        resp.getWriter().println("<body>");
        resp.getWriter().println("<h1>Question List</h1>");
        resp.getWriter().println("<table border=\"1\">");
        resp.getWriter().println("<tr><th>ID</th><th>QuestionName</th><th>RightAnswer</th><th>AnswerOption</th><th>Topics</th></tr>");

        for (Question question : questions) {
            resp.getWriter().println("<tr>");
            resp.getWriter().println("<td>" + question.getId() + "</td>");
            resp.getWriter().println("<td>" + question.getQuestionName() + "</td>");
            resp.getWriter().println("<td>" + question.getRightAnswer() + "</td>");
            resp.getWriter().println("<td>" + question.getAnswerOption() + "</td>");
            resp.getWriter().println("<td>" + question.getTopic() + "</td>");
            resp.getWriter().println("</tr>");
        }
        resp.getWriter().println("</table>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }
}
