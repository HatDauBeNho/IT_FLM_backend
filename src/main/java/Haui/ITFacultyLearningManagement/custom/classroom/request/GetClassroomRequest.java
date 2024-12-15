package Haui.ITFacultyLearningManagement.custom.classroom.request;

import Haui.ITFacultyLearningManagement.custom.data.OptionRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GetClassroomRequest {
    private String keySearch;
    private int semesterId;
    private OptionRequest option;
}
