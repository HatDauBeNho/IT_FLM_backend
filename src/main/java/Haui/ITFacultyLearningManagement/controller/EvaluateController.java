package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.custom.evaluate.request.EvaluateRequest;
import Haui.ITFacultyLearningManagement.security.service.UserDetailsImpl;
import Haui.ITFacultyLearningManagement.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/evaluate")
public class EvaluateController {
    @Autowired
    private EvaluateService evaluateService;

    @PostMapping("")
    public ResponseEntity<?> evaluateLecture(@RequestBody EvaluateRequest request){
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            if(!evaluateService.evaluateLecture(request, userDetails.getId())){
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Can't evaluate!"));
            }

            return ResponseEntity.ok(new CustomResponse<>(1, null, "Success evaluate teacher!"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @GetMapping("/question")
    public ResponseEntity<?> getQuestion(){
        try{
            return ResponseEntity.ok(new CustomResponse<>(1, evaluateService.findAllQuestion(), "Success get list question"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }
}
