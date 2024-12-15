package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.student.handle.SearchStudentHandle;
import Haui.ITFacultyLearningManagement.entities.Student;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface StudentService  extends  Generate<Student>{
    List<SearchStudentHandle> getStudentWithSearch(String keySearch, Pageable pageable);

    Integer getTotal(String keySearch);

    Optional<Student> findByAccountId( int accountId);


}
