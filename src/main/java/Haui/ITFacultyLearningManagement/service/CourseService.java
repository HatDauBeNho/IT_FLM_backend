package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.course.handle.CurrentTaughtHandle;
import Haui.ITFacultyLearningManagement.custom.courseRegistration.handle.RegisteredCourseHandle;
import Haui.ITFacultyLearningManagement.custom.subject.handle.ListSubjectHandle;
import Haui.ITFacultyLearningManagement.custom.course.request.CreateCourseRequest;
import Haui.ITFacultyLearningManagement.custom.course.response.CurrentTaughtResponse;
import Haui.ITFacultyLearningManagement.custom.course.response.ListStudentInCourseResponse;
import Haui.ITFacultyLearningManagement.custom.courseRegistration.response.RegisteredCourseResponse;
import Haui.ITFacultyLearningManagement.entities.Course;
import Haui.ITFacultyLearningManagement.entities.CourseRegistration;
import org.springframework.data.domain.Pageable;


import java.util.List;
import java.util.Optional;

public interface CourseService extends Generate<Course> {
    List<ListSubjectHandle> getCourseBySearch(String keySearch, Pageable pageable);

    Course saveCourse(CreateCourseRequest createCourseRequest);

    Optional<Course> findByCourseName(String courseName);

    Integer totalAllCourse(String keySearch);

    Optional<CourseRegistration> findByName(String name);

    List<CourseRegistration> findByStudentId(Integer studentId);

    double getGPA(Integer studentId);

    boolean registerCourse(int classId,int accountId);

    List<RegisteredCourseHandle> getRegisteredCourse(int studentId);

    Optional<CourseRegistration> findReByStuIdAndCourseId(int courseId,int studentId);

    boolean cancelCourse(int classId, int studentId);

    List<CurrentTaughtHandle> getCurrentTaught(int lectureId);

   ListStudentInCourseResponse getListStuInCourse(int classId, String keySearch, Pageable pageable);

}
