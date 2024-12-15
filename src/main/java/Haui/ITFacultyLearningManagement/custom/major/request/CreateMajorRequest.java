package Haui.ITFacultyLearningManagement.custom.major.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateMajorRequest
{
    private String majorName;
    private String departmentName;
    private String fullName;
}
