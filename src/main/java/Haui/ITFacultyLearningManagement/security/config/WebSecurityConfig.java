package Haui.ITFacultyLearningManagement.security.config;


import Haui.ITFacultyLearningManagement.security.jwt.AuthEntryPointJwt;
import Haui.ITFacultyLearningManagement.security.jwt.AuthTokenFilter;
import Haui.ITFacultyLearningManagement.security.jwt.UserAccessDeniedHandler;
import Haui.ITFacultyLearningManagement.security.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    UserDetailsServiceImpl userDetailService;
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(10);
    }

    @Bean(BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
    @Bean
    public AuthEntryPointJwt authEntryPointJwt() {
        return new AuthEntryPointJwt();
    }

    @Bean
    public AuthTokenFilter authTokenFilter() {
        return new AuthTokenFilter();
    }

    @Bean
    public UserAccessDeniedHandler userAccessDeniedHandler() {
        return new UserAccessDeniedHandler();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder());
    }

    String[] adminApi = {
            "/api/course/search",
            "/api/course/create",
            "/api/course/update",
            "/api/course/delete",
            "/api/classroom/create",
            "/api/classroom/delete",
            "/api/classroom/search",
            "/api/dashboard/admin",
            "/api/student/**",
            "/api/lecture/**"
    };

    String[] lectureApi = {
            "/api/course/currentTaught",
            "/api/course/getListStudent",
            "/api/result/enter",
            "/api/dashboard/admin/statisticCurrentTaught",
            "/api/dashboard/lecture"
    };

    String[] studentApi = {
            "/api/course/register",
            "/api/course/registeredCourse",
            "/api/course/cancel",
            "/api/result/get",
            "/api/classroom/search",
            "/api/dashboard/student",
            "/api/dashboard/statisticPoint",

    };

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.exceptionHandling().authenticationEntryPoint(authEntryPointJwt());

        http.authorizeHttpRequests().antMatchers("/api/auth/login").permitAll()
                .antMatchers(adminApi).hasAuthority("1")
                .antMatchers(lectureApi).hasAnyAuthority("1","2")
                .antMatchers(studentApi).hasAuthority("3")
                .anyRequest().authenticated()
                .and().csrf().disable()
                .logout();

        http.addFilterBefore(authTokenFilter(), UsernamePasswordAuthenticationFilter.class)
                .exceptionHandling().accessDeniedHandler(userAccessDeniedHandler());

        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        http.cors().and().csrf().disable();
    }
}
