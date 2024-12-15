package Haui.ITFacultyLearningManagement.custom.course.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateCourseRequest {
    private String courseName;
    private Integer condition;
    private Integer credit;
}
