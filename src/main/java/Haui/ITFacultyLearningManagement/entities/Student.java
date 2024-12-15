package Haui.ITFacultyLearningManagement.entities;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "tb_student")
@NoArgsConstructor
@AllArgsConstructor
public class Student  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private Integer studentId;
    @Column(name = "account_id")
    private Integer accountId;
    @Column(name = "info_id")
    private Integer infoId;
    @Column(name = "gpa")
    private double gpa;
    @Column(name = "status")
    private Integer status;
    @Column(name = "create_time")
    private LocalDateTime createTime;
    @Column(name = "update_time")
    private LocalDateTime updateTime;
}
