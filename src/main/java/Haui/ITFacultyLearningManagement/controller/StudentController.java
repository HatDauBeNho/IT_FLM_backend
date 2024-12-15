package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.custom.student.handle.SearchStudentHandle;
import Haui.ITFacultyLearningManagement.custom.student.request.SearchStudentRequest;
import Haui.ITFacultyLearningManagement.custom.student.response.SearchStudentResponse;
import Haui.ITFacultyLearningManagement.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.JpaSort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @PostMapping("/search")
    public ResponseEntity<?> getListStudentWithSearch(@RequestBody SearchStudentRequest request)
    {
        try {
            Pageable pageable;
            if (request.getOption().getOrder().equals("asc")) {
                pageable = PageRequest.of(request.getOption().getOffset() - 1, request.getOption().getLimit(), JpaSort.unsafe("gpa").ascending());
            } else {
                pageable = PageRequest.of(request.getOption().getOffset() - 1, request.getOption().getLimit(), JpaSort.unsafe("gpa").descending());
            }

            Integer total = studentService.getTotal(request.getKeySearch());
            List<SearchStudentHandle> searchStudentHandleList= studentService.getStudentWithSearch(request.getKeySearch(), pageable);

            return ResponseEntity.ok(new CustomResponse<>(1, new SearchStudentResponse(total, searchStudentHandleList), "Success get list student"));

        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }
}
