package Haui.ITFacultyLearningManagement.custom.course.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateCourseRequest {
    private int courseId;
    private String courseName;
    private int credit;
}
