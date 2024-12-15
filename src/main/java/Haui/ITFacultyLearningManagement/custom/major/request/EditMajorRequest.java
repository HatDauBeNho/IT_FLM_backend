package Haui.ITFacultyLearningManagement.custom.major.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EditMajorRequest {
    private int majorId;
    private String departmentName;
    private String majorName;
    private String teacherName;
}
