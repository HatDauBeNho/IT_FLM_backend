package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.entities.Info;

import java.util.Optional;

public interface InfoService extends Generate<Info> {
    Optional<Info> findByPhoneNumber(String phoneNumber);

}
