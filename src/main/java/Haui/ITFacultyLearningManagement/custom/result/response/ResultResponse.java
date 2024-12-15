package Haui.ITFacultyLearningManagement.custom.result.response;

import Haui.ITFacultyLearningManagement.custom.result.handle.ResultHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultResponse {
    private double gpa;
    private List<ResultHandle> result;
}
