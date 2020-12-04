package pe.edu.unsch.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.CompradorFrecuente;

@Repository
public interface CompradorFrecuentaDao extends JpaRepository<CompradorFrecuente, Serializable> {
	CompradorFrecuente findByIdcompradorfrecuente(int Idcompradorfrecuente);
}
