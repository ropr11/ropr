package test.java.dao;

import dao.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;

public class AbstractDaoTest {
	
	protected Session session;
	
	@Before
	public void setUp(){
		session = HibernateUtil.getSessionFactory().getCurrentSession();
	}
	
	@After
	public void tearDown(){
		session.close();
	}
	
}
