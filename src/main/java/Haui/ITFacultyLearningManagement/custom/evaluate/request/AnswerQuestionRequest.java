package Haui.ITFacultyLearningManagement.custom.evaluate.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AnswerQuestionRequest {
    private int questionId;
    private int score;
}
