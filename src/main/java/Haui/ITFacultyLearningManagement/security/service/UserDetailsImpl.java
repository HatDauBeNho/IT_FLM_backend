package Haui.ITFacultyLearningManagement.security.service;


import Haui.ITFacultyLearningManagement.entities.Account;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Objects;

public class UserDetailsImpl implements UserDetails {
    @Serial
    private static final long serialVersionUID = 1L;

    private int id;
    private String userName;
    private String password;
    private final Collection<? extends GrantedAuthority> authorities;
    private int status;

    public UserDetailsImpl(int id, String userName, String password, Collection<? extends GrantedAuthority> authorities, int status) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.authorities = authorities;
        this.status = status;
    }

    public static UserDetailsImpl build(Account account){
        List<GrantedAuthority> authorities = Arrays.asList(new SimpleGrantedAuthority(account.getRole().toString()));
        return new UserDetailsImpl(
                account.getAccountId(),
                account.getUserName(),
                account.getPassword(),
                authorities,
                account.getStatus()
        );
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public int getId() {
        return id;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        UserDetailsImpl user = (UserDetailsImpl) obj;
        return Objects.equals(id, user.id);
    }

    @Override
    public int hashCode()
    {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + getId();
        return result;
    }
}
