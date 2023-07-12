package quiz;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "questions")

public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Long id;

    private Topic topic;
    private String questionName;
    private String answerOption;
    private String rightAnswer;

    public Question (String questionName, String rightAnswer, String answerOption, Topic topic) {

        this.questionName = questionName;
        this.rightAnswer = rightAnswer;
        this.answerOption = answerOption;
        this.topic = topic;
    }

    public Question(){

    }
}
