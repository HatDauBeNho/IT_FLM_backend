package Haui.ITFacultyLearningManagement.custom.courseRegistration.handle;

import java.time.LocalDate;
import java.time.LocalDateTime;

public interface RegisteredCourseHandle {
    String getClassId();
    String getCourseName();
    String getFullName();
    LocalDate getStartTime();
    LocalDate getEndTime();
    double getPoint();
    LocalDateTime getCreateTime();
}
