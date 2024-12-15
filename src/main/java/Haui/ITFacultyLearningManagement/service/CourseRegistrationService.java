package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.result.handle.ResultHandle;
import Haui.ITFacultyLearningManagement.custom.result.request.EnterResultRequest;
import Haui.ITFacultyLearningManagement.entities.CourseRegistration;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CourseRegistrationService extends Generate<CourseRegistration> {
    List<ResultHandle> getResult( int studentId, int semesterId);

    boolean enterResult(EnterResultRequest request);
}
