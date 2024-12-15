package Haui.ITFacultyLearningManagement.custom.student.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreateStudentRequest {
    @Pattern(regexp = "^[a-zA-Z ]{5,50}$")
    private String fullName;

    private LocalDate dateOfBirth;
    private int gender;
    private String address;
    private String phoneNumber;

    @Pattern(regexp = ".*@gmail\\.com$")
    private String email;

    private String className;
}
