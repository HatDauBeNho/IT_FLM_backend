package Haui.ITFacultyLearningManagement.custom.subject.handle;

import java.time.LocalDateTime;

public interface ListSubjectHandle {
    Integer getCourseId();
    String getCourseName();
    Integer getCredit();
    LocalDateTime getCreateTime();
}
