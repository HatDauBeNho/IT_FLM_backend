package Haui.ITFacultyLearningManagement.custom.student.response;

import Haui.ITFacultyLearningManagement.custom.student.handle.SearchStudentHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.poi.util.NotImplemented;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchStudentResponse {
    private int total;
    private List<SearchStudentHandle> data;
}
