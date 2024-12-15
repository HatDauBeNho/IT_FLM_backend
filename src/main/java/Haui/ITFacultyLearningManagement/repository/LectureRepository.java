package Haui.ITFacultyLearningManagement.repository;

import Haui.ITFacultyLearningManagement.custom.dashboard.handle.StatisticForLectureHandle;
import Haui.ITFacultyLearningManagement.custom.lecture.handle.SearchLectureHandle;
import Haui.ITFacultyLearningManagement.entities.Info;
import Haui.ITFacultyLearningManagement.entities.Lecture;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LectureRepository extends JpaRepository<Lecture,Integer> {
    @Query(value = """
            SELECT * FROM tb_lecture t
            LEFT OUTER JOIN tb_info i on t.infoId = i.infoId
            WHERE  full_name= ?1 LIMIT 1
            """, nativeQuery = true)
    Optional<Lecture> findByName(String name);

    @Query(value = "SELECT * FROM tb_lecture t LEFT OUTER JOIN infos i on t.infoId = i.infoId WHERE  lecture_id= ?1 LIMIT 1", nativeQuery = true)
    Optional<Info> getTeacherInfo(int id);

    @Query(value = """
            select * from tb_lecture where account_id =:accountId limit 1
            """,nativeQuery = true)
    Optional<Lecture> findByAccountId(@Param("accountId") int accountId);

    @Query(value = """
            select count(lecture_id) from tb_lecture
            """,nativeQuery = true)
    int countLecture();

    @Query(value = """
            SELECT s.name AS semesterName, COUNT(DISTINCT c.class_id) AS count
            FROM tb_semester AS s
            JOIN tb_classroom AS c ON s.semester_id = c.semester_id
            JOIN tb_lecture AS l ON c.lecture_id = l.lecture_id
            WHERE l.lecture_id = :lectureId
            GROUP BY s.semester_id;
            """,nativeQuery = true)
    List<StatisticForLectureHandle> getStatisticForLecture(@Param("lectureId") int lectureId);

    @Query(value = """
            select
                i.full_name as fullName, i.date_of_birth as dateOfBirth,
                i.gender, i.address,  i.phone_number as phoneNumber, i.email, l.average_rating as averageRating
            from tb_lecture l
            left join tb_info i on i.info_id = l.info_id
            where unaccent(i.full_name) ILIKE  %:keySearch%
            """,nativeQuery = true)
    List<SearchLectureHandle> getLectureWithSearch(@Param("keySearch") String keySearch, Pageable pageable);

    @Query(value = """
            select count(i.full_name)
            from tb_lecture l
            left join tb_info i on i.info_id = l.info_id
            WHERE unaccent(i.full_name) ILIKE  %:keySearch%
            """,nativeQuery = true)
    Integer getTotalLecture(@Param("keySearch") String keySearch);
}
