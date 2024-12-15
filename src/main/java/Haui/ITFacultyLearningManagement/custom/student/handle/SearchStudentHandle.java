package Haui.ITFacultyLearningManagement.custom.student.handle;

import java.time.LocalDate;

public interface SearchStudentHandle {
    String getFullName();
    LocalDate getDateOfBirth();
    Integer getGender();
    String getAddress();
    String getPhoneNumber();
    String getEmail();
    Double getGpa();

}
