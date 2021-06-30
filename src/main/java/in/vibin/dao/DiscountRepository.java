package in.vibin.dao;


import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.vibin.model.Discounts;

@Repository
public interface DiscountRepository extends CrudRepository<Discounts, Integer>{
	@Modifying
	@Query("UPDATE discount SET discount=:discount WHERE sno =1")
	void updateDiscount(@Param("discount")int discount);
}
