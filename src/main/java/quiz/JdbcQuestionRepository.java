package quiz;

import java.sql.*;
import java.util.*;


public class JdbcQuestionRepository {

    public JdbcQuestionRepository() {
        getConnection();
    }
    public static final String JDBC_DRIVER = "org.postgresql.Driver";
    public static final String DB_URL = "jdbc:postgresql://localhost:5432/quiz_db";
    public static final String DB_USER = "postgres";
    public static final String DB_PASSWORD = "root";

    public Connection getConnection() {
        try {
            Class.forName(JDBC_DRIVER);
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (Exception e) {
            throw new RuntimeException( "Can't connect to the db" + e.getMessage());
        }
    }

    public void addQuestion(Question question) {
        try (Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO questions (question, rightanswer, answeroption, topics)" +
                            " VALUES (?, ?, ?, ?)")) {

            statement.setString(1, question.getQuestionName());
            statement.setString(2, question.getRightAnswer());
            statement.setString(3, question.getAnswerOption());
            statement.setString(4, question.getTopic().toString());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM questions")) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String questionName = resultSet.getString("question");
                String rightAnswer = resultSet.getString("rightAnswer");
                String answerOption = resultSet.getString("answerOption");
                Topic topic = Topic.valueOf(resultSet.getString("topics"));

                Question question = new Question();
                question.setId((long) id);
                question.setQuestionName(questionName);
                question.setRightAnswer(rightAnswer);
                question.setAnswerOption(answerOption);
                question.setTopic(topic);

                questions.add(question);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questions;
    }

}
