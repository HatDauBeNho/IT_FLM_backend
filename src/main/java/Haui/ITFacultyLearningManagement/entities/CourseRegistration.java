package Haui.ITFacultyLearningManagement.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_course_registration")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CourseRegistration  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_registration_id")
    private Integer courseRegistrationId;
    @Column(name = "student_id")
    private Integer studentId;
    @Column(name = "class_id")
    private Integer classId;
    @Column(name = "point")
    private double point;
    @Column(name = "create_time")
    private LocalDateTime createTime;
    @Column(name = "update_time")
    private LocalDateTime updateTime;

    public CourseRegistration(Integer studentId, Integer classId) {
        this.studentId = studentId;
        this.classId = classId;
        this.point = -1;
        this.createTime = LocalDateTime.now();
        this.updateTime = LocalDateTime.now();
    }
}
