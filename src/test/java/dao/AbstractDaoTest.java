package test.java.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;

public class AbstractDaoTest {
	
	protected Session session;
	
	@Before
	public void setUp(){
		SessionFactory sessionFactory = new Configuration().configure(
				"hibernate.cfg.xml").buildSessionFactory();
		session = sessionFactory.getCurrentSession();
	}
	
	@After
	public void tearDown(){
		session.close();
	}
	
}
