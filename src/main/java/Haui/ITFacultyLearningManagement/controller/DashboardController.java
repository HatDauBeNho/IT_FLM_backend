package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.entities.Lecture;
import Haui.ITFacultyLearningManagement.entities.Student;
import Haui.ITFacultyLearningManagement.security.service.UserDetailsImpl;
import Haui.ITFacultyLearningManagement.service.ClassroomService;
import Haui.ITFacultyLearningManagement.service.DashboardService;
import Haui.ITFacultyLearningManagement.service.StudentService;
import Haui.ITFacultyLearningManagement.service.LectureService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {
    @Autowired
    private ClassroomService classroomService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/student")
    public ResponseEntity<?> getDashboardForStudent(){
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            Optional<Student> studentOptional = studentService.findByAccountId(userDetails.getId());
            if (studentOptional.isEmpty()){
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Student isn't exits"));
            }

            return ResponseEntity.ok(new CustomResponse<>(1,
                    dashboardService.getDashboardStudent(studentOptional.get().getStudentId()),
                    "Success get dashboard"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }

    }

    @GetMapping("statisticPoint")
    public ResponseEntity<?> getStatisticStudent(){
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            Optional<Student> studentOptional = studentService.findByAccountId(userDetails.getId());
            if (studentOptional.isEmpty()){
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Student isn't exits"));
            }

            return ResponseEntity.ok(new CustomResponse<>(1,
                    dashboardService.getStatisticStudent(studentOptional.get().getStudentId()),
                    "Success get statistic for student"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @GetMapping("/lecture")
    public ResponseEntity<?> getDashboardForLecture(){
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            Optional<Lecture> lectureOptional = lectureService.findByAccountId(userDetails.getId());
            if (lectureOptional.isEmpty())
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Lecture isn't exits"));

            return ResponseEntity.ok(new CustomResponse<>(1,
                    dashboardService.getDashboardLecture(lectureOptional.get().getLectureId()),
                    "Success get dashboard for lecture"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @GetMapping("/statisticCurrentTaught")
    public ResponseEntity<?> getStatisticForLecture(){
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            Optional<Lecture> lectureOptional = lectureService.findByAccountId(userDetails.getId());
            if (lectureOptional.isEmpty())
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Lecture isn't exits"));

            return ResponseEntity.ok(new CustomResponse<>(1,
                    dashboardService.getStatisticForLecture(lectureOptional.get().getLectureId()),
                    "Success get statistic for lecture"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @GetMapping("/admin")
    public ResponseEntity<?> getDashboardAdmin(){
        try{
            return ResponseEntity.ok(new CustomResponse<>(1,
                    dashboardService.getDashboardAdmin(),
                    "Success get dashboard for admin"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }
}
