package Haui.ITFacultyLearningManagement.service.impl;

import Haui.ITFacultyLearningManagement.entities.Semester;
import Haui.ITFacultyLearningManagement.repository.SemesterRepository;
import Haui.ITFacultyLearningManagement.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SemesterServiceImpl implements SemesterService {
    @Autowired
    private SemesterRepository semesterRepository;

    @Override
    public List<Semester> findAll() {
        return semesterRepository.findAll();
    }

    @Override
    public Optional<Semester> findById(Integer id) {
        return semesterRepository.findById(id);
    }

    @Override
    public Semester save(Semester semester) {
        return semesterRepository.save(semester);
    }

    @Override
    public void deleteById(Integer id) {
        semesterRepository.deleteById(id);
    }

    @Override
    public List<Semester> findBeginNow() {
        return semesterRepository.findBeginNow();
    }
}
