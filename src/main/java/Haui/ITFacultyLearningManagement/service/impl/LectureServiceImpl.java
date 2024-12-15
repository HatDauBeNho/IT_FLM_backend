package Haui.ITFacultyLearningManagement.service.impl;

import Haui.ITFacultyLearningManagement.custom.lecture.handle.SearchLectureHandle;
import Haui.ITFacultyLearningManagement.entities.Lecture;
import Haui.ITFacultyLearningManagement.repository.AccountRepository;
import Haui.ITFacultyLearningManagement.repository.LectureRepository;
import Haui.ITFacultyLearningManagement.service.AccountService;
import Haui.ITFacultyLearningManagement.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class LectureServiceImpl implements LectureService {

    @Autowired
    private LectureRepository lectureRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private AccountService accountService;

    @Override
    public List<Lecture> findAll() {
        return lectureRepository.findAll();
    }

    @Override
    public Optional<Lecture> findById(Integer id) {
        return lectureRepository.findById(id);
    }

    @Override
    public Lecture save(Lecture lecture) {
        return lectureRepository.save(lecture);
    }

    @Override
    public void deleteById(Integer id) {
        lectureRepository.deleteById(id);
    }

    @Override
    public Optional<Lecture> findByName(String name) {
        return lectureRepository.findByName(name);
    }

    @Override
    public Optional<Lecture> findByAccountId(int accountId) {
        return lectureRepository.findByAccountId(accountId);
    }

    @Override
    public List<SearchLectureHandle> getLectureWithSearch(String keySearch, Pageable pageable) {
        return lectureRepository.getLectureWithSearch(keySearch,pageable);
    }

    @Override
    public Integer getTotalLecture(String keySearch) {
        return lectureRepository.getTotalLecture(keySearch);
    }
}
