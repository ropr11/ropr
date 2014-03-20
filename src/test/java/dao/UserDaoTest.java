package test.java.dao;

import java.io.Serializable;

import static  org.junit.Assert.*;

import model.User;
import org.junit.Test;

import dao.UserDao;

//@RunWith(SpringJUnit4ClassRunner.class);
//@ContextConfiguration(locations ="classpath:applicationContext.xml"));


public class UserDaoTest  {
	
	UserDao userDao = new UserDao();
	
	@Test
	public void createNewUserTest() {
		User user = new User();
		user.setUsername("test");
		user.setName("test");
		user.setPassword("test");
		user.setSurname("testSurname");
		user.setName("testName");
		user.setEmail("testEmail");
		user.setCity("testCity");
		user.setStreet("testStreet");
		user.setZip("testZip");
		user.setPhone("123456");
		
		Serializable id = userDao.createNewUser(user);
		assertNotNull(id);
		
		//Verify operation
		User userFromDb = userDao.loadUserByUsername(user.getUsername());
		assertNotNull(userFromDb);
		assertEquals(user.getUsername(), userFromDb.getUsername());
		
		//Clean
		userDao.deleteUser(userFromDb);
	}

}
