package Haui.ITFacultyLearningManagement.custom.student.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentReponse {
    private String fullName;
    private LocalDate dateOfBirth;
    private int gender;
    private String address;
    private String phoneNumber;
    private String email;
    private double gpa;
    private String className;
}
