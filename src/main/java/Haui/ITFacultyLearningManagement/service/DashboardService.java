package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.dashboard.handle.DashboardLectureHandle;
import Haui.ITFacultyLearningManagement.custom.dashboard.handle.DashboardStudentHandle;
import Haui.ITFacultyLearningManagement.custom.dashboard.handle.StatisticForLectureHandle;
import Haui.ITFacultyLearningManagement.custom.dashboard.response.DashboardAdminResponse;
import Haui.ITFacultyLearningManagement.custom.dashboard.response.StatisticStudentResponse;

import java.util.List;

public interface DashboardService {
    DashboardStudentHandle getDashboardStudent(int studentId);

    DashboardLectureHandle getDashboardLecture(int lectureId);

    DashboardAdminResponse getDashboardAdmin();

    StatisticStudentResponse getStatisticStudent(int studentId);

    List<StatisticForLectureHandle> getStatisticForLecture(int lectureId);

}
