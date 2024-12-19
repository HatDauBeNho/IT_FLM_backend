package Haui.ITFacultyLearningManagement.custom.course.response;

import Haui.ITFacultyLearningManagement.custom.courseRegistration.handle.RegisteredCourseHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisteredResponse {
    private int statusEvaluate;
    private List<RegisteredCourseHandle> data;
}
