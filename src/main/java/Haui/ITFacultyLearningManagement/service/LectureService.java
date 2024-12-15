package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.lecture.handle.SearchLectureHandle;
import Haui.ITFacultyLearningManagement.entities.Lecture;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface LectureService extends Generate<Lecture> {
    Optional<Lecture> findByName(String name);

    Optional<Lecture> findByAccountId(int accountId);

    List<SearchLectureHandle> getLectureWithSearch(String keySearch, Pageable pageable);

    Integer getTotalLecture(String keySearch);

}
