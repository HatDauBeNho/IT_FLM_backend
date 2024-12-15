package Haui.ITFacultyLearningManagement.custom.dashboard.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DashboardAdminResponse {
    private int countLecture;
    private int countStudent;
}
