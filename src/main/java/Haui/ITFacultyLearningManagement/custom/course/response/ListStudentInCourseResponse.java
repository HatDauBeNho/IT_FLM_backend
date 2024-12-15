package Haui.ITFacultyLearningManagement.custom.course.response;

import Haui.ITFacultyLearningManagement.custom.course.handle.ListStudentInClassHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListStudentInCourseResponse {
    private int total;
    private List<ListStudentInClassHandle> data;
}
