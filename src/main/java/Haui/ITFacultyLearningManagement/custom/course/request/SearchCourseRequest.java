package Haui.ITFacultyLearningManagement.custom.course.request;

import Haui.ITFacultyLearningManagement.custom.data.OptionRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchCourseRequest {
    private String keySearch;
    private OptionRequest option;
}
