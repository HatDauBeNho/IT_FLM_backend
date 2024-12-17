package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.entities.Semester;

import java.util.List;

public interface SemesterService extends Generate<Semester>{
    List<Semester> findBeginNow();


}
