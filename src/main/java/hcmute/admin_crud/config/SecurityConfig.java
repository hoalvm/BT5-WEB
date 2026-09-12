package hcmute.admin_crud.config;

import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.savedrequest.NullRequestCache;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            // Disable request cache to prevent redirect loops
            .requestCache(cache -> cache.requestCache(new NullRequestCache()))
            .authorizeHttpRequests(auth -> auth
                // CRITICAL: Permit all FORWARD, INCLUDE, ERROR dispatches
                // This allows JSP rendering via Spring MVC FORWARD to proceed without security checks
                .dispatcherTypeMatchers(
                    DispatcherType.FORWARD,
                    DispatcherType.INCLUDE,
                    DispatcherType.ERROR
                ).permitAll()
                // Public REQUEST paths
                .requestMatchers("/login", "/favicon.ico").permitAll()
                .requestMatchers("/css/**", "/js/**", "/images/**", "/vendor/**").permitAll()
                .requestMatchers("/error").permitAll()
                // Admin requires ROLE_ADMIN
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/admin/dashboard", true)
                .failureUrl("/login?error")
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
            );

        return http.build();
    }
}
