package Haui.ITFacultyLearningManagement.custom.classroom.handle;

import java.time.LocalDate;

public interface GetClassHandle {
    Integer getClassId();
    String getCourseName();
    int getCurrentStudent();
    int getMaximumStudent();
    String getTeacherName();
    LocalDate getStartTime();
    LocalDate getEndTime();

}
