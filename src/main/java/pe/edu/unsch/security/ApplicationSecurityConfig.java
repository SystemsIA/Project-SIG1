package pe.edu.unsch.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;

import pe.edu.unsch.service.UsuarioService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true, prePostEnabled = true, securedEnabled = true)
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {

	private static final String KEY_SECRET = "miclavesecreta";

	@Autowired
	private UsuarioService usuarioService;

	private final PasswordEncoder passwordEncoder;

	@Autowired
	public ApplicationSecurityConfig(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(usuarioService).passwordEncoder(passwordEncoder);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.anyRequest().permitAll()
				.and()
			.formLogin()
				.loginPage("/login")
				.usernameParameter("username")
				.passwordParameter("password")
				.defaultSuccessUrl("/front", true)
				.permitAll()
				.and()
			.logout()
				.logoutSuccessUrl("/front")
				.invalidateHttpSession(true)
				.clearAuthentication(true)
				.and()
			.rememberMe()
				.rememberMeServices(getRememberMeServices())
				.key(KEY_SECRET)
				.and()
			.exceptionHandling()
				.accessDeniedPage("/403")
				.and()
			.httpBasic();
	}

	private TokenBasedRememberMeServices getRememberMeServices() {
		TokenBasedRememberMeServices service = new TokenBasedRememberMeServices(KEY_SECRET, usuarioService);
		service.setCookieName("remember-cookie");
		service.setTokenValiditySeconds(100);
		return service;
	}
}
