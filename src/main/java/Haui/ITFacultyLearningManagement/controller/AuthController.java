package Haui.ITFacultyLearningManagement.controller;

import Haui.ITFacultyLearningManagement.custom.auth.login.request.LoginRequest;
import Haui.ITFacultyLearningManagement.custom.auth.login.response.LoginResponse;
import Haui.ITFacultyLearningManagement.custom.data.CustomResponse;
import Haui.ITFacultyLearningManagement.entities.Account;
import Haui.ITFacultyLearningManagement.security.jwt.JwtUtils;
import Haui.ITFacultyLearningManagement.security.service.UserDetailsImpl;
import Haui.ITFacultyLearningManagement.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    private AccountService accountService;

    @Autowired
    AuthenticationManager authenticationManager;

    @PostMapping("/login")
    @Transactional
    public ResponseEntity<?> login(@RequestBody LoginRequest request)
    {
        try{
            Optional<Account> accountOptional = accountService.findAccountByUserName(request.getUserName());
            if (accountOptional.isEmpty()){
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "login failed!"));
            }
            if (accountOptional.get().getStatus() == 0)
            {
                return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "Account is not active"));
            }

            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getUserName(), request.getPassword()));

            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtUtils.generateJwtToken(authentication);
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            return ResponseEntity.ok()
                    .body(new CustomResponse<>(1,
                            new LoginResponse(userDetails.getUsername(),accountOptional.get().getRole(),jwt),
                            "Success login"));
        }catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new CustomResponse<>(0, null, "login failed!"));
        }
    }


}
