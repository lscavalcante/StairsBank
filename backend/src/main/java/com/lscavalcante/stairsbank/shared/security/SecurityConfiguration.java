package com.lscavalcante.stairsbank.shared.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfiguration {

    private final JwtAuthenticationFilter jwtAuthFilter;
    private final AuthenticationProvider authenticationProvider;
    private final ChainExceptionHandlerFilter chainExceptionHandlerFilter;

    public SecurityConfiguration(JwtAuthenticationFilter jwtAuthFilter,
                                 AuthenticationProvider authenticationProvider,
                                 ChainExceptionHandlerFilter chainExceptionHandlerFilter
    ) {
        this.jwtAuthFilter = jwtAuthFilter;
        this.authenticationProvider = authenticationProvider;
        this.chainExceptionHandlerFilter = chainExceptionHandlerFilter;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .addFilterBefore(chainExceptionHandlerFilter, LogoutFilter.class)
                .authorizeHttpRequests((e) -> {
                    e.requestMatchers(
                                    new AntPathRequestMatcher("/api/auth/**"),
                                    new AntPathRequestMatcher("/v2/api-docs"),
                                    new AntPathRequestMatcher("/v3/api-docs"),
                                    new AntPathRequestMatcher("/v3/api-docs/**"),
                                    new AntPathRequestMatcher("/swagger-resources"),
                                    new AntPathRequestMatcher("/swagger-resources/**"),
                                    new AntPathRequestMatcher("/configuration/ui"),
                                    new AntPathRequestMatcher("/configuration/security"),
                                    new AntPathRequestMatcher("/swagger-ui/**"),
                                    new AntPathRequestMatcher("/webjars/**"),
                                    new AntPathRequestMatcher("/swagger-ui.html")
                            ).permitAll()
                            .requestMatchers(new AntPathRequestMatcher("/api/users/**")).hasRole("ADMIN")
                            .requestMatchers(new AntPathRequestMatcher("/api/blogs/**")).authenticated()
                            .requestMatchers(new AntPathRequestMatcher("/auth/**")).permitAll()
                            .anyRequest().permitAll();
                    ;
                })
                .sessionManagement((e) -> {
                    e.sessionCreationPolicy(SessionCreationPolicy.STATELESS);
                })
                .authenticationProvider(authenticationProvider)
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
                .logout((e) -> {})
                .exceptionHandling((e) -> {})
        ;

        return http.build();
    }
}