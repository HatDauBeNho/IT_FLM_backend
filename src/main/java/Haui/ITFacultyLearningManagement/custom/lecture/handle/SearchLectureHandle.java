package Haui.ITFacultyLearningManagement.custom.lecture.handle;

import java.time.LocalDate;

public interface SearchLectureHandle {
    String getFullName();
    LocalDate getDateOfBirth();
    Integer getGender();
    String getAddress();
    String getPhoneNumber();
    String getEmail();
    Double getAverageRating();
}
