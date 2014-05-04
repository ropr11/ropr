package test.java.dao;

import model.Order;
import model.User;
import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;

import controller.OrderController;

public class OrderDaoTest extends AbstractDaoTest {
	
	@Ignore
	@Test
	public void createOrderTest(){
		
		
		User user = userDao.loadUserByUsername("admin");
		
		Order order = new Order();
		order.setCityFrom("Ostrava");
		order.setCityTo("Olomouc");
		order.setStreetFrom("Nad Porubkou 12");
		order.setStreetTo("Brydlova 16");
		order.setDate(calendar.getInstance().getTime());
		
		order.setUserByUserId(user);
		order.setStatus(OrderController.ORDER_STATUS_NEW);
		
		Integer id=(Integer) orderDao.createOrder(order);
		assertNotNull(id);
		
		Order orderFromDb = orderDao.getOrderById(id);
		assertNotNull(orderFromDb);
		assertEquals(id, orderFromDb.getOrderId());
		assertEquals(order.getCityFrom(), orderFromDb.getCityFrom());
		
		//orderDao.deleteOrder(orderFromDb);
		
	}
}
