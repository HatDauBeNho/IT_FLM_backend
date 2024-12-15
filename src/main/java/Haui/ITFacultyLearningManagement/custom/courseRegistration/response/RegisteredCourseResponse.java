package Haui.ITFacultyLearningManagement.custom.courseRegistration.response;

import Haui.ITFacultyLearningManagement.custom.courseRegistration.handle.RegisteredCourseHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisteredCourseResponse {
    private List<RegisteredCourseHandle> data;
}
