package in.vibin.dao;

import java.util.Optional;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.vibin.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

	Optional<User> findByMobileNumberAndPassword(@Param("mobilenumber") Long mobileNumber,
			@Param("password") String password);

	@Modifying
	@Query("INSERT INTO user_details VALUES(:mobileNumber,:password);")
	int save(@Param("mobileNumber") String mobileNumber, @Param("password") String password);

	@Query("SELECT * FROM user_details")
	Iterable<User> user();
	
	@Query("SELECT id FROM user_details WHERE mobilenumber=:mobileNumber;")
	Integer getID(@Param("mobileNumber") Long mobileNumber);

	
}
