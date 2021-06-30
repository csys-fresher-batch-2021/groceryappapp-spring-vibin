package in.vibin.jdbctemplate;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class Discount {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public int getDiscount() {
		String SQL = "SELECT discount FROM discount WHERE sno=1";
		return jdbcTemplate.queryForObject(SQL, int.class);

	}
}
