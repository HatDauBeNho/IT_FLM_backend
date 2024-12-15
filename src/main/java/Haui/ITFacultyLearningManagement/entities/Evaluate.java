package Haui.ITFacultyLearningManagement.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tb_evaluate")
public class Evaluate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "evaluate_id")
    private Integer evaluateId;
    @Column(name = "class_id")
    private Integer classId;
    @Column(name = "student_id")
    private Integer studentId;
    @Column(name = "content")
    private String content;
    @Column(name = "rating")
    private double rating;
    @Column(name = "create_time")
    private LocalDateTime createTime;
    @Column(name = "update_time")
    private LocalDateTime updateTime;

    public Evaluate(Integer classId, Integer studentId, String content, double rating) {
        this.classId= classId;
        this.studentId = studentId;
        this.content = content;
        this.rating = rating;
        this.updateTime =  LocalDateTime.now();
        this.createTime = LocalDateTime.now();
    }
}
