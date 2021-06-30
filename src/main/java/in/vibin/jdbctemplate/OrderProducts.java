package in.vibin.jdbctemplate;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import in.vibin.model.OrderProduct;

@Repository
public class OrderProducts {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<OrderProduct> getAllOrder() {
		String SQL = "SELECT * FROM order_list";
		return jdbcTemplate.query(SQL, (rs, rowNum) -> new OrderProduct(rs.getInt("ordered_id"), rs.getString("name"),
				rs.getDouble("price_per_quantity"), rs.getInt("ordered_quantity"), rs.getDouble("amount")));

	}
}
