package quiz;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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
    private int id;
    private Topics topic;
    private String questionName;
    private String answerOption;
    private String rightAnswer;

    public Question (Topics topic, String questionName, String answerOption, String rightAnswer) {

        topic = this.topic;
        questionName = this.questionName;
        rightAnswer = this.rightAnswer;
        answerOption = this.answerOption;
    }

    public Question(){

    }
}
