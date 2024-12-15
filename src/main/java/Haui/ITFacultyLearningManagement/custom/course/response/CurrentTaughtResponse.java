package Haui.ITFacultyLearningManagement.custom.course.response;

import Haui.ITFacultyLearningManagement.custom.course.handle.CurrentTaughtHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CurrentTaughtResponse {
    private List<CurrentTaughtHandle> data;
}
