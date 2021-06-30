package in.vibin.dao;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import in.vibin.model.Product;

@Repository
public interface GroceryRepository extends CrudRepository<Product, Integer>{

	@Query("SELECT id FROM grocery_list WHERE name=:productName;")
	Integer getID(@Param("productName") String name);
	@Modifying
	@Query("UPDATE grocery_list SET quantity=quantity+:addingQuantity WHERE id =:id")
	void addQuantity(@Param("id")int id,@Param("addingQuantity") int addingQuantity);
	
	@Modifying
	@Query("UPDATE grocery_list SET quantity=:quantity WHERE id =:id")
	void updateQuantity(@Param("id")int id,@Param("quantity") int quantity);

	@Modifying
	@Query("UPDATE grocery_list SET quantity=quantity+:quantity WHERE name =:name")
	void updateQuantityByName(@Param("name")String name,@Param("quantity") int quantity);
	
}
