package Haui.ITFacultyLearningManagement.service.impl;

import Haui.ITFacultyLearningManagement.entities.Info;
import Haui.ITFacultyLearningManagement.repository.InfoRepository;
import Haui.ITFacultyLearningManagement.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoRepository infoRepository;
    @Override
    public List<Info> findAll() {
        return infoRepository.findAll();
    }

    @Override
    public Optional<Info> findById(Integer id) {
        return infoRepository.findById(id);
    }

    @Override
    public Info save(Info info) {
        return infoRepository.save(info);
    }

    @Override
    public void deleteById(Integer id) {
        infoRepository.deleteById(id);
    }

    @Override
    public Optional<Info> findByPhoneNumber(String phoneNumber) {
        return infoRepository.findByPhoneNumber(phoneNumber);
    }
}
