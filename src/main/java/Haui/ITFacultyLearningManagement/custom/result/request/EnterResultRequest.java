package Haui.ITFacultyLearningManagement.custom.result.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnterResultRequest {
    private int classId;
    private int studentId;
    private double point;
}
