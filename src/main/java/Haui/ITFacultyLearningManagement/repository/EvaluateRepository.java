package Haui.ITFacultyLearningManagement.repository;

import Haui.ITFacultyLearningManagement.entities.Evaluate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EvaluateRepository extends JpaRepository<Evaluate,Integer> {
    @Query(value = """
            select * from tb_evaluate where student_id = :studentId and class_id = :classId
            """,nativeQuery = true)
    Optional<Evaluate> findByStuAndClass(@Param("studentId") int studentId,
                                         @Param("classId") int classId);
}
