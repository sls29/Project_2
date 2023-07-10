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
                    "INSERT INTO questions (question, goodanswer, wronganswer)" +
                            " VALUES (?, ?, ?)")) {

            statement.setString(1, question.getQuestionName());
            statement.setString(2, question.getGoodAnswer());
            statement.setString(3, question.getWrongAnswer());
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
                String goodAnswer = resultSet.getString("goodAnswer");
                String wrongAnswer = resultSet.getString("wrongAnswer");

                Question question = new Question();
                question.setId(id);
                question.setQuestionName(questionName);
                question.setGoodAnswer(goodAnswer);
                question.setWrongAnswer(wrongAnswer);

                questions.add(question);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questions;
    }

}
