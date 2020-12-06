package pe.edu.unsch.annotation.permisos;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import org.springframework.security.access.prepost.PreAuthorize;

/*
 * Anotación para que cada usuario ingresado en el sistema pueda acceder a una ruta arbitraria
 * pero tiene que estar autentivado en el sistema 
 *
 */
@Documented
@Retention(RUNTIME)
@Target({ TYPE, METHOD })
@PreAuthorize("hasAnyAuthority('Comprador','Vendedor','Administrador')")
public @interface IsAuthenticated {

}
