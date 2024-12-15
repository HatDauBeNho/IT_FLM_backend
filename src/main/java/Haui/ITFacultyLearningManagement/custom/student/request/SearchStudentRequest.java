package Haui.ITFacultyLearningManagement.custom.student.request;

import Haui.ITFacultyLearningManagement.custom.data.OptionRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchStudentRequest {
    private String keySearch;
    private OptionRequest option;
}
