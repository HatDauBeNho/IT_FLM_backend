package Haui.ITFacultyLearningManagement.custom.evaluate.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EvaluateRequest {
    private List<AnswerQuestionRequest> answer;
    private String content;
    private int classId;
}
