package Haui.ITFacultyLearningManagement.custom.major.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MajorResponse {
    private int majorId;
    private String majorName;
    private String departmentName;
    private String fullName;
    private LocalDateTime createAt;
    private LocalDateTime updateAt;

}
