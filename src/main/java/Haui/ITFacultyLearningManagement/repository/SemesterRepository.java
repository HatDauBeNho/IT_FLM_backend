package Haui.ITFacultyLearningManagement.repository;

import Haui.ITFacultyLearningManagement.custom.dashboard.handle.DashboardLectureHandle;
import Haui.ITFacultyLearningManagement.custom.dashboard.handle.DashboardStudentHandle;
import Haui.ITFacultyLearningManagement.entities.Semester;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SemesterRepository extends JpaRepository<Semester,Integer> {
    @Query(value = """
            SELECT
                s.gpa, COUNT(cr.course_registration_id) AS countRegisteredCourse, sem.name as semesterName
            FROM tb_student s
            LEFT JOIN tb_course_registration cr ON s.student_id = cr.student_id
            LEFT JOIN tb_classroom c ON cr.class_id = c.class_id
            LEFT JOIN tb_semester sem ON c.semester_id = sem.semester_id
            WHERE
                s.student_id = :studentId
                AND NOW() BETWEEN sem.start_time AND sem.end_time
            GROUP BY s.gpa,sem.name
            """,nativeQuery = true)
    DashboardStudentHandle getDashboardStudent(@Param("studentId") int studentId);

    @Query(value = """
            SELECT
                l.average_rating as averageRating, count(DISTINCT c.class_id) as countCurrentTaught, s.name as semesterName
            FROM tb_lecture l
            LEFT JOIN tb_classroom c ON l.lecture_id = c.lecture_id
            LEFT JOIN tb_semester s ON c.semester_id = s.semester_id
            WHERE
                l.lecture_id = :lectureId
                AND NOW() BETWEEN s.start_time AND s.end_time
            GROUP BY l.average_rating,s.name
            """,nativeQuery = true)
    DashboardLectureHandle getDashboardLecture(@Param("lectureId") int lectureId);

}
