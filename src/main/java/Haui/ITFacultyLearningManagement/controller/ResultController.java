package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.custom.result.request.EnterResultRequest;
import Haui.ITFacultyLearningManagement.entities.Student;
import Haui.ITFacultyLearningManagement.repository.CourseRegistrationRepository;
import Haui.ITFacultyLearningManagement.security.service.UserDetailsImpl;
import Haui.ITFacultyLearningManagement.service.CourseRegistrationService;
import Haui.ITFacultyLearningManagement.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.html.Option;
import java.util.Optional;

@RestController
@RequestMapping("api/result")
public class ResultController {
    @Autowired
    private CourseRegistrationService courseRegistrationService;

    @Autowired
    private StudentService studentService;

    @GetMapping("/get")
    public ResponseEntity<?> getResult(@RequestParam("semesterId") int semesterId){
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            Optional<Student> studentOptional = studentService.findByAccountId(userDetails.getId());
            if (studentOptional.isEmpty())
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Student isn't exits"));

            return ResponseEntity.ok(new CustomResponse<>(1, courseRegistrationService.getResult(studentOptional.get().getStudentId(),semesterId), "Success get result"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @PostMapping("/enter")
    public ResponseEntity<?> enterResult(@RequestBody EnterResultRequest request){
        try{
            if (!courseRegistrationService.enterResult(request))
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Can't enter result"));

            return ResponseEntity.ok(new CustomResponse<>(1, null, "Success enter result"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }
}
