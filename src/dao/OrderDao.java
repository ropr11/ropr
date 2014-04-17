package dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Order;

public class OrderDao {
	private final String QUERY_LIST_ORDERS = "select * from ropr.order";
	private final String QUERY_LIST_ORDERS_BY_USERID = "select * from ropr.order where User_ID =:userId";
	
	public Order getOrderById(Integer id){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		Transaction transaction = session.getTransaction();
		transaction.begin();
		Order order = (Order) session.get(Order.class, id);
		transaction.commit();
		
		return order;
				
	}
	
	public List<Order> getAllOrdersByUserId(Integer userId){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.getTransaction();
		
		transaction.begin();
		List<Order> orders = new ArrayList<Order>();
		SQLQuery query = session.createSQLQuery(QUERY_LIST_ORDERS_BY_USERID);
		query.addEntity(Order.class);
		query.setParameter("userId", userId);
		orders = query.list();
		transaction.commit();
		
		return orders;
	}
	
	public List<Order> getAllOrders(){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.getTransaction();
		
		transaction.begin();
		List<Order> orders = new ArrayList<Order>();
		SQLQuery query = session.createSQLQuery(QUERY_LIST_ORDERS);
		query.addEntity(Order.class);
		orders = query.list();
		transaction.commit();
		
		return orders;
	}
	
	public void saveOrder(Order order){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.getTransaction();
		transaction.begin();
		session.saveOrUpdate(order);
		transaction.commit();
		
	}
	
	public Serializable createOrder(Order order){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.getTransaction();
		transaction.begin();
		Serializable id = session.save(order);
		transaction.commit();
		
		return id;
		
	}
	
	public void deleteOrder(Order order){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction transaction = session.getTransaction();
		transaction.begin();
		session.delete(order);
		transaction.commit();
	}
}
