package Haui.ITFacultyLearningManagement.custom.lecture.request;

import Haui.ITFacultyLearningManagement.custom.data.OptionRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchLectureRequest {
    private String keySearch;
    private OptionRequest option;
}
