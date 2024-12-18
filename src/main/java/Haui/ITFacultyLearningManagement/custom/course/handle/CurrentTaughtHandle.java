package Haui.ITFacultyLearningManagement.custom.course.handle;

import java.time.LocalDate;

public interface CurrentTaughtHandle {
    int getClassId();
    String getCourseName();
    int getCurrentStudent();
    int getMaximumStudent();
    LocalDate getStartTime();
    LocalDate getEndTime();
}
