package Haui.ITFacultyLearningManagement.custom.lecture.response;

import Haui.ITFacultyLearningManagement.custom.lecture.handle.SearchLectureHandle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchLectureResponse {
    private int total;
    private List<SearchLectureHandle> data;
}
