package Haui.ITFacultyLearningManagement.repository;

import Haui.ITFacultyLearningManagement.custom.dashboard.response.StatisticStudentResponse;
import Haui.ITFacultyLearningManagement.custom.student.handle.SearchStudentHandle;
import Haui.ITFacultyLearningManagement.entities.Info;
import Haui.ITFacultyLearningManagement.entities.Student;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer> {
    @Query(value = """
            select i.full_name as fullName, i.date_of_birth as dateOfBirth, i.gender, i.address,  i.phone_number as phoneNumber, i.email, s.gpa
            from tb_student s left join tb_info i on i.info_id = s.info_id
            WHERE unaccent(i.full_name) ILIKE  %:keySearch%
            """,nativeQuery = true)
    List<SearchStudentHandle> getStudentWithSearch(@Param("keySearch") String keySearch, Pageable pageable);

    @Query(value = """
            select count(s.student_id)
            from tb_student s left join tb_info i on i.info_id = s.info_id
            WHERE unaccent(i.full_name) ILIKE  %:keySearch%
            """,nativeQuery = true)
    Integer getTotal(@Param("keySearch") String keySearch);

    @Query(value = """
            select gpa from tb_student where student_id = studentId
            """,nativeQuery = true)
    double getGpa(@Param("studentId") int studentId);

    @Query(value = """
            select * from tb_student where account_id = :accountId
            """,nativeQuery = true)
    Optional<Student> findByAccountId(@Param("accountId") int accountId);

    @Query(value = """
            select count(student_id) from tb_student
            """,nativeQuery = true)
    int countStudent();

    @Query(value = """
            WITH courseRegistration AS (
                 SELECT cr.point
                 FROM tb_course_registration cr
                 INNER JOIN tb_classroom cl ON cr.class_id = cl.class_id
                 WHERE cr.student_id = :studentId
                 AND cr.create_time IN (SELECT MAX(cr2.create_time)
                    FROM tb_course_registration cr2
                    INNER JOIN tb_classroom cl2 ON cr2.class_id = cl2.class_id
                    WHERE cr2.student_id = :studentId
                    GROUP BY cl2.course_id)
                 )
                 SELECT
                     COUNT(*) FILTER (WHERE point < 4) AS "nhoHon4",
                     COUNT(*) FILTER (WHERE point >= 4 AND point < 5) AS "lonHon4",
                     COUNT(*) FILTER (WHERE point >= 5 AND point < 6) AS "lonHon5",
                     COUNT(*) FILTER (WHERE point >= 6 AND point < 7) AS "lonHon6",
                     COUNT(*) FILTER (WHERE point >= 7 AND point < 8) AS "lonHon7",
                     COUNT(*) FILTER (WHERE point >= 8 AND point < 9) AS "lonHon8",
                     COUNT(*) FILTER (WHERE point >= 9 AND point < 10) AS "lonHon9",
                     COUNT(*) FILTER (WHERE point = 10) AS "bang10"
                 FROM courseRegistration
        """,nativeQuery = true)
    StatisticStudentResponse getStatisticPoint(@Param("studentId") int studentId);
}
