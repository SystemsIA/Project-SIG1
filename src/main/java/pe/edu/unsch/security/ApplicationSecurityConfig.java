package pe.edu.unsch.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import pe.edu.unsch.service.UsuarioLoginService;

@Configuration
@EnableWebSecurity
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UsuarioLoginService loginServiceImpl;
	
	private final PasswordEncoder passwordEncoder;

	@Autowired
	public ApplicationSecurityConfig(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(loginServiceImpl).passwordEncoder(passwordEncoder);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
			.antMatchers("/assets/**","/img/**").permitAll()
			.antMatchers("/", "/front", "/login", "/product/**", "/registrarse").permitAll()
			.antMatchers("/seller/**").hasAuthority("Vendedor")
			.antMatchers("/admin/**").hasAuthority("Administrador")
			.antMatchers("/client/**").hasAuthority("Comprador")
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/login")
				.usernameParameter("username")
				.passwordParameter("password")
				.defaultSuccessUrl("/front", true)
				.permitAll()
				.and()
			.logout()
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.and()
			.httpBasic()
				.and()
			.exceptionHandling()
				.accessDeniedPage("/403");
	}

}
