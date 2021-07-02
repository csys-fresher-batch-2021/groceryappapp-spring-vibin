package in.vibin.dao;


import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.vibin.model.SellingHistory;

@Repository
public interface SellingRepository extends CrudRepository<SellingHistory, Integer>{
	@Modifying
	@Query("INSERT INTO selling_history(mobilenumber,product_name,price_per_quantity,ordered_quantity,amount) VALUES(:mobileNumber,:name,:price,:orderedQuantity,:amount)")
	void addSellingHistory(@Param("mobileNumber")long mobileNumber,@Param("name") String name,@Param("price")double price,@Param("orderedQuantity") int orderedQuantity,@Param("amount")double amount);
	@Query("SELECT EXISTS (SELECT mobilenumber FROM selling_history WHERE mobilenumber =:mobileNumber)")
	boolean isExistUser(@Param("mobileNumber")Long mobileNumber);
}
