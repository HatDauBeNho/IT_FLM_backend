package Haui.ITFacultyLearningManagement.custom.classroom.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateClassroomRequest {
    private int courseId;
    private int maximumStudent;
    private int semesterId;
    private int lectureId;
}
