package Haui.ITFacultyLearningManagement.service.impl;

import Haui.ITFacultyLearningManagement.custom.result.handle.ResultHandle;
import Haui.ITFacultyLearningManagement.custom.result.request.EnterResultRequest;
import Haui.ITFacultyLearningManagement.entities.CourseRegistration;
import Haui.ITFacultyLearningManagement.repository.CourseRegistrationRepository;
import Haui.ITFacultyLearningManagement.service.CourseRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class CourseRegistrationServiceImpl implements CourseRegistrationService {
    @Autowired
    private CourseRegistrationRepository courseRegistrationRepository;

    @Override
    public List<CourseRegistration> findAll() {
        return courseRegistrationRepository.findAll();
    }

    @Override
    public Optional<CourseRegistration> findById(Integer id) {
        return courseRegistrationRepository.findById(id);
    }

    @Override
    public CourseRegistration save(CourseRegistration courseRegistration) {
        return courseRegistrationRepository.save(courseRegistration);
    }

    @Override
    public void deleteById(Integer id) {
        courseRegistrationRepository.deleteById(id);
    }

    @Override
    public List<ResultHandle> getResult(int studentId, int semesterId) {
        return courseRegistrationRepository.getResultWithSemesterId(studentId,semesterId);
    }

    @Transactional
    @Override
    public boolean enterResult(EnterResultRequest request) {
        Optional<CourseRegistration> courseRegistrationOptional =  courseRegistrationRepository.findByStuAndClass(request.getStudentId(), request.getClassId());
        if (courseRegistrationOptional.isEmpty()){
            return false;
        }
        CourseRegistration courseRegistration = courseRegistrationOptional.get();
        courseRegistration.setPoint(request.getPoint());
        courseRegistration.setUpdateTime(LocalDateTime.now());
        courseRegistrationRepository.save(courseRegistration);
        return true;
    }
}
