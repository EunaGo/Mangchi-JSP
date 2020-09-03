package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {

		loadJdbcDriver();
		initConnectionPool();

	}

	private void loadJdbcDriver() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {
		
		try {


			String jdbcDriver = "jdbc:mysql://mangchi1.cynhwcnt3hk0.ap-northeast-2.rds.amazonaws.com:3306/project?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";


			String username = "bit";
			String pw = "bit";
			
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcDriver, username, pw);
			
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			
			poolConfig.setMinIdle(4);
			poolConfig.setMaxTotal(50);
			GenericObjectPool<PoolableConnection> connectionPool =
			new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			
			driver.registerPool("pool", connectionPool); 
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}