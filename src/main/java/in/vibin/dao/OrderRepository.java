package in.vibin.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import in.vibin.model.OrderProduct;

@Repository
public interface OrderRepository extends CrudRepository<OrderProduct, Integer>{

	
}
