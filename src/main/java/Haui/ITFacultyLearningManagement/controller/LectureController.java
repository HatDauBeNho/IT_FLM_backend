package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.custom.lecture.handle.SearchLectureHandle;
import Haui.ITFacultyLearningManagement.custom.lecture.request.SearchLectureRequest;
import Haui.ITFacultyLearningManagement.custom.lecture.response.SearchLectureResponse;
import Haui.ITFacultyLearningManagement.custom.student.response.SearchStudentResponse;
import Haui.ITFacultyLearningManagement.service.LectureService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.JpaSort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/lecture")
public class LectureController {
    @Autowired
    private LectureService lectureService;

    @PostMapping("/search")
    public ResponseEntity<?> getLectureWithSearch(@RequestBody SearchLectureRequest request){
        try{
            Pageable pageable;
            if (request.getOption().getOrder().equals("asc")) {
                pageable = PageRequest.of(request.getOption().getOffset() - 1, request.getOption().getLimit(), JpaSort.unsafe("average_rating").ascending());
            } else {
                pageable = PageRequest.of(request.getOption().getOffset() - 1, request.getOption().getLimit(), JpaSort.unsafe("average_rating").descending());
            }

            Integer total = lectureService.getTotalLecture(request.getKeySearch());
            List<SearchLectureHandle> list = lectureService.getLectureWithSearch(request.getKeySearch(), pageable);

            return ResponseEntity.ok(new CustomResponse<>(1, new SearchLectureResponse(total, list), "Success get list lecture"));

        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

}
