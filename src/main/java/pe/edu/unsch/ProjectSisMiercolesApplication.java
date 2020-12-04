package pe.edu.unsch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ProjectSisMiercolesApplication implements CommandLineRunner {

	static final Logger LOGGER = LoggerFactory.getLogger(ProjectSisMiercolesApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(ProjectSisMiercolesApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

	}

}
