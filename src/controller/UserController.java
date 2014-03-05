/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

/**
 *
 * @author Gahybook
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.HibernateUtil;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserController implements Controller, UserDetailsService {
	
	private String username;
    private String password;
  
 
     private boolean accountNonExpired = true;
     private boolean accountNonLocked = true;
     private boolean credentialsNonExpired=true;
     private boolean enabled=true;
     
	@Override
	public ModelAndView handleRequest(HttpServletRequest hsr,
			HttpServletResponse hsr1) throws Exception {
		ModelAndView mv = new ModelAndView("customer");

		String out = "ovìøení uživatele: nesprávné heslo nebo uživatel neexistuje  ";
		try {

			SessionFactory sessionFactory = new Configuration()
			// .configure("c:/Eclipse_workspaces/letecka_posta/ropr/src/hibernate.cfg.xml").buildSessionFactory();
					.configure("hibernate.cfg.xml").buildSessionFactory();

			Session session = sessionFactory.getCurrentSession();
			// Session session =
			// HibernateUtil.getSessionFactory().getCurrentSession();
			if(hsr.getParameter("j_username")!= null){
				
				
				Customer customer = loadCustomerByUsername(session,hsr.getParameter("j_username"));
				if(customer != null && customer.getPassword().equalsIgnoreCase(hsr.getParameter("j_password"))){
					mv.addObject("customer", Arrays.asList(customer));
					
					return mv;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//User not exists or wrong password provided
		mv.addObject("message", out);
		return mv;
	}

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {

		try {

			SessionFactory sessionFactory = new Configuration()
					.configure("hibernate.cfg.xml").buildSessionFactory();

			Session session = sessionFactory.getCurrentSession();
			
			
			Customer customer = loadCustomerByUsername(session,username);
			
			
			if (customer == null) {
				throw new UsernameNotFoundException(username);

			}
			
			User user = new User(customer.getLogin(), customer.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, Arrays.asList(new GrantedAuthorityImpl("ROLE_USER")));
			return user;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private Customer loadCustomerByUsername(Session session, String username){
		
		session.beginTransaction();
		
		String queryString = "select * from ropr.customer where login=:username";
		SQLQuery query = session.createSQLQuery(queryString);
		query.addEntity(Customer.class);
		query.setParameter("username", username);
		List<Customer> result = query.list();
		
		session.getTransaction().commit();
		
		Customer customer = result.get(0);
		return customer;
	}
}
