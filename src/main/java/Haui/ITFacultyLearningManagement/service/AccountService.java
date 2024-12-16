package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.entities.Account;

import java.util.Optional;

public interface AccountService extends Generate<Account> {

    Optional<Account> findAccountByUserName(String username);
}
