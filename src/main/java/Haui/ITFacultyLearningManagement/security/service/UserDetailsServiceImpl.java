package Haui.ITFacultyLearningManagement.security.service;



import Haui.ITFacultyLearningManagement.entities.Account;
import Haui.ITFacultyLearningManagement.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private AccountService accountService;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.findAccountByUserName(username)
                .orElseThrow(() -> new UsernameNotFoundException("Account Not Found with username: " + username));
        return UserDetailsImpl.build(account);
    }
}
