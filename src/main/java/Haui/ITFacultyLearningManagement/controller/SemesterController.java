package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.service.SemesterService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/semester")
public class SemesterController {
    @Autowired
    private SemesterService semesterService;
    @GetMapping("/get")
    public ResponseEntity<?> getAll(){
        try{
            return ResponseEntity.ok(new CustomResponse<>(1, semesterService.findBeginNow(), "Success get semester"));

        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }
}
