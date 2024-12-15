package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.entities.Account;

import java.util.Optional;

public interface AccountService extends Generate<Account> {
    String randomPassword();
    Optional<Account> findAccountByUserName(String username);
}
