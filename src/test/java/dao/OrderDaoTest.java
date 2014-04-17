package test.java.dao;

import model.Order;
import model.User;
import static org.junit.Assert.*;

import org.junit.Test;

public class OrderDaoTest extends AbstractDaoTest {
	
	
	@Test
	public void createOrderTest(){
		
		
		User user = userDao.loadUserByUsername("admin");
		
		Order order = new Order();
		order.setCityFrom("Ostrava");
		order.setCityTo("Olomouc");
		order.setStreetFrom("Nad Porubkou 12");
		order.setStreetTo("Brydlova 16");
		order.setDate(calendar.getInstance().getTime());
		
		order.setUser(user);
		
		Integer id=(Integer) orderDao.createOrder(order);
		assertNotNull(id);
		
		Order orderFromDb = orderDao.getOrderById(id);
		assertNotNull(orderFromDb);
		assertEquals(id, orderFromDb.getOrderId());
		assertEquals(order.getCityFrom(), orderFromDb.getCityFrom());
		
		//orderDao.deleteOrder(orderFromDb);
		
	}
}
