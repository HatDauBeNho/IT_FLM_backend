package Haui.ITFacultyLearningManagement.custom.lecture.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreateTeacherRequest {
    private String fullName;
    private LocalDate dateOfBirth;
    private int gender;
    private String address;
    private String phoneNumber;
    private String email;
}
