package Haui.ITFacultyLearningManagement.custom.result.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultRequest {
    private Integer courseRegistrationId;
    private double point;
}
