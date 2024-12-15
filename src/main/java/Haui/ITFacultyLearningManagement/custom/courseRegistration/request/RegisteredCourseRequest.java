package Haui.ITFacultyLearningManagement.custom.courseRegistration.request;

import Haui.ITFacultyLearningManagement.custom.data.OptionRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisteredCourseRequest {
    private OptionRequest option;
}
