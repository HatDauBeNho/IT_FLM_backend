package Haui.ITFacultyLearningManagement.repository;

import Haui.ITFacultyLearningManagement.custom.classroom.handle.GetClassHandle;
import Haui.ITFacultyLearningManagement.custom.course.handle.CurrentTaughtHandle;
import Haui.ITFacultyLearningManagement.entities.Classroom;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClassroomRepository extends JpaRepository<Classroom,Integer> {
    @Query(value = """
            select c.course_name as courseName, l.current_student as currentStudent, l.maximum_student as maximumStudent, i.full_name as teacherName,
                s.start_time as startTime, s.end_time as endTime
            from tb_classroom l
            inner join tb_course c on c.course_id=l.course_id
            inner join tb_semester s on s.semester_id=l.semester_id
            inner join tb_teacher t on t.lecture_id = l.lecture_id
            inner join tb_info i on i.info_id = t.info_id
            WHERE unaccent(c.course_name) ILIKE  %:keySearch% and l.status = 1 and s.semester_id = :semesterId
            """,nativeQuery = true)
    List<GetClassHandle> getClassBySearchAndSemester(@Param("keySearch") String keySearch,
                                                     @Param("semesterId") int semesterId,
                                                     Pageable pageable);

    @Query(value = """
            select count(c.course_name)
            from tb_classroom l
            inner join tb_course c on c.course_id=l.course_id
            inner join tb_semester s on s.semester_id=l.semester_id
            inner join tb_teacher t on t.lecture_id = l.lecture_id
            inner join tb_info i on i.info_id = t.info_id
            WHERE unaccent(c.course_name) ILIKE  %:keySearch% and l.status = 1 and s.semester_id = :semesterId
            """,nativeQuery = true)
    int getTotalBySearchAndSemester(@Param("keySearch") String keySearch,
                                    @Param("semesterId") int semesterId);

    @Query(value = """
            select c.course_id as courseId,c.course_name as courseName, l.current_student as currentStudent, l.maximum_student as maximumStudent,
                s.start_time as startTime,s.end_time as endTime
            from tb_classroom l
            left join tb_course c on l.course_id = c.course_id
            left join tb_semester s on s.semester_id = l.semester_id
            where l.lecture_id = ?1 and l.status=1
            """,nativeQuery = true)
    List<CurrentTaughtHandle> getCurrentTaught(int lectureId);

    @Query(value = """
            select * from tb_classroom where course_id = :courseId limit 1
            """, nativeQuery = true)
    Optional<Classroom> findByCourseId(@Param("courseId") int courseId);

}
