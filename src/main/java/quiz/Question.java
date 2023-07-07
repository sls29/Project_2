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
    private String questionName;
    private String goodAnswer;
    private String wrongAnswer;

    public Question (String questionName, String goodAnswer, String wrongAnswer) {

        questionName = this.questionName;
        goodAnswer = this.goodAnswer;
        wrongAnswer = this.wrongAnswer;
    }

    public Question(){

    }
}
