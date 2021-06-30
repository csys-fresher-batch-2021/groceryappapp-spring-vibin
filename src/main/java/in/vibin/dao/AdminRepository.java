package in.vibin.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.vibin.model.Admin;

@Repository
public interface AdminRepository extends CrudRepository<Admin, Integer>{
	
	Optional<Admin> findByMobileNumberAndPassword(@Param("mobilenumber") Long mobileNumber, @Param("password") String password);
}
