package dao;

import java.io.Serializable;
import java.util.List;

import model.User;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDao  {

	private final String QUERY_USER_BY_USERNAME = "select * from ropr.user where username=:username";
	private final String QUERY_USER_BY_USERID = "select * from ropr.user where ID_User=:userid";
	private final String QUERY_LIST_USERS = "select * from ropr.user";

	public User loadUserByUsername(String username) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		SQLQuery query = session.createSQLQuery(QUERY_USER_BY_USERNAME);
		query.addEntity(User.class);
		query.setParameter("username", username);
		List<User> result = query.list();

		session.getTransaction().commit();
		
		if (result.size() > 0) {
			User user = result.get(0);
			Hibernate.initialize(user);
			return user;
		} else {
			return null;
		}
		
	}
	
	public User loadUserByUserId(Integer userid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		SQLQuery query = session.createSQLQuery(QUERY_USER_BY_USERID);
		query.addEntity(User.class);
		query.setParameter("userid", userid);
		List<User> result = query.list();
		session.getTransaction().commit();
		
		if (result.size() > 0) {
			User user = result.get(0);
			
			return user;
		} else {
			return null;
		}
		
	}
	
	public Serializable createNewUser(User user){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Serializable id = session.save(user);
		transaction.commit();
		return id;
	}
	
	public void deleteUser(User user){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.delete(user);
		transaction.commit();
	}
	
	public List<User> listUsers(){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		  SQLQuery query = session.createSQLQuery(QUERY_LIST_USERS);
		  query.addEntity(User.class);
		  List<User> result = query.list();
		session.getTransaction().commit();
		return result;
	}
	
	
}
