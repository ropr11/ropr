package test.java.dao;

import controller.UserController;
import java.io.Serializable;

import static  org.junit.Assert.*;

import model.User;
import org.junit.Test;

import dao.UserDao;
import java.util.Set;
import model.UserRole;
import org.junit.Ignore;

//@RunWith(SpringJUnit4ClassRunner.class);
//@ContextConfiguration(locations ="classpath:applicationContext.xml"));


public class UserDaoTest extends AbstractDaoTest  {
	
	@Ignore
	@Test
	public void createNewUserTest() {
		User user = new User();
		user.setUsername("test");
		user.setName("test");
		user.setPassword("test");
		user.setSurname("testSurname");
		user.setName("testName@test.com");
		user.setEmail("testEmail");
		user.setCity("testCity");
		user.setStreet("testStreet");
		user.setZip("testZip");
		user.setPhone("123456");

		Serializable id = userDao.createNewUser(user);
		assertNotNull(id);

		// Verify operation
		User userFromDb = userDao.loadUserByUsername(user.getUsername());
		assertNotNull(userFromDb);
		assertEquals(user.getUsername(), userFromDb.getUsername());

		// Clean
		userDao.deleteUser(userFromDb);
	}
        @Test
        public void LoadUserRoleIdByNameTest (){
           Integer id = userRoleDao.loadUserRoleIdByName(UserController.EMPLOYEE_ROLE);
            assertEquals(2,id.intValue());
        }

        @Test
        public void LoadUsersByRoleNameTest (){
          Set<User> users = userRoleDao.loadUsersByRoleName(UserController.EMPLOYEE_ROLE);
            assertTrue(!users.isEmpty());
            
}
        
        
}
