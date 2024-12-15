package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.classroom.request.CreateClassroomRequest;
import Haui.ITFacultyLearningManagement.custom.classroom.request.GetClassroomRequest;
import Haui.ITFacultyLearningManagement.custom.classroom.response.GetClassroomResponse;
import Haui.ITFacultyLearningManagement.entities.Classroom;
import org.springframework.data.domain.Pageable;

public interface ClassroomService extends Generate<Classroom> {
    boolean createClassroom(CreateClassroomRequest request);

    GetClassroomResponse getClassBySearchAndSemester(GetClassroomRequest request, Pageable pageable);


}
