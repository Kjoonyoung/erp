package erp.backend.global.config.security;

import erp.backend.global.config.security.jwt.JwtAuthenticationEntryPoint;
import erp.backend.global.config.security.jwt.JwtSecurityFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@EnableWebSecurity
@EnableMethodSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

    private final JwtSecurityFilter jwtSecurityFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(AbstractHttpConfigurer::disable)
                .httpBasic(AbstractHttpConfigurer::disable)
                .formLogin(AbstractHttpConfigurer::disable)
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .sessionManagement(sessionManagement -> sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .exceptionHandling(handling -> handling.authenticationEntryPoint(jwtAuthenticationEntryPoint))
                .authorizeHttpRequests(authorize ->
                        authorize
//                                .requestMatchers(
//                                        "/api/**"
//                                ).hasAnyRole("ADMIN_총무부", "ADMIN_재무부", "ADMIN_콘텐츠관리부", "ADMIN_회원관리부")
//                                .requestMatchers(
//                                        "/main"
//                                ).hasRole("USER")
                                .requestMatchers(
                                        "/api/sign-up",
                                        "/api/sign-in",
                                        "/api/emp/fix-info",
                                        "/api/emp/list",
                                        "/api/emp/list/{empName}",
                                        "/api/salary/insert",
                                        "/api/salary/detail/{id}",
                                        "/api/salary/delete/{id}",
                                        "/api/main",
                                        "/api/notice",
                                        "/api/notice/{id}",
                                        "/api/notice/first-list",
                                        "/api/board",
                                        "/api/board/{id}",
                                        "/api/comment/{boardId}",
                                        "/api/comment/{boardId}/{commentId}",
                                        "/api/approval",
                                        "/api/approval/success/{id}",
                                        "/api/approval/reject/{id}"
                                ).permitAll()
                                .anyRequest().hasRole("USER")
                )
                .addFilterBefore(jwtSecurityFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();

        configuration.setAllowCredentials(true);
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE"));
        // TODO 운영반영 시 addAllowedOriginPattern(https://domain.com) 주소로 변경
        configuration.addAllowedOriginPattern("*");
        configuration.addAllowedHeader("*");

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}
