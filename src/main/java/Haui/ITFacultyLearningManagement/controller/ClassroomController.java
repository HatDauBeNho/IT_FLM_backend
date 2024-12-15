package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.classroom.request.CreateClassroomRequest;
import Haui.ITFacultyLearningManagement.custom.classroom.request.GetClassroomRequest;
import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.entities.Classroom;
import Haui.ITFacultyLearningManagement.service.ClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.JpaSort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@RestController
@RequestMapping("/api/classroom")
public class ClassroomController {
    @Autowired
    private ClassroomService classroomService;

    @PostMapping("/create")
    public ResponseEntity<?>  createClassroom(@RequestBody CreateClassroomRequest request){
        try{
            if (!classroomService.createClassroom(request))
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Can't create classroom"));

            return ResponseEntity.ok(new CustomResponse<>(1, null, "Success create classroom"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @PutMapping("/delete")
    public ResponseEntity<?> deleteClassroom(@RequestParam("classId") int classId)
    {
        try{
            Optional<Classroom> classroomOptional = classroomService.findById(classId);
            if (classroomOptional.isEmpty())
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Classroom isn't exits"));

            Classroom classroom =  classroomOptional.get();
            classroom.setStatus(0);
            classroom.setUpdateTime(LocalDateTime.now());
            classroomService.save(classroom);

            return ResponseEntity.ok(new CustomResponse<>(1, null, "Success delete classroom"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

    @PostMapping("/search")
    public ResponseEntity<?> getClassroomBySearch(@RequestBody GetClassroomRequest request){
        try{
            Pageable pageable;
            if (request.getOption().getOrder().equals("asc")) {
                pageable = PageRequest.of(request.getOption().getOffset() - 1, request.getOption().getLimit(), JpaSort.unsafe("create_time").ascending());
            } else {
                pageable = PageRequest.of(request.getOption().getOffset() - 1, request.getOption().getLimit(), JpaSort.unsafe("create_time").descending());
            }
            return ResponseEntity.ok(new CustomResponse<>(1, classroomService.getClassBySearchAndSemester(request,pageable), "Success get list class"));

        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, e.getMessage()));
        }
    }

}
