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
import model.UserRole;
import dao.HibernateUtil;
import dao.UserDao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class UserController implements UserDetailsService {
	
	private UserDao userDao = new UserDao();
	
	private String username;
	private String password;

	private boolean accountNonExpired = true;
	private boolean accountNonLocked = true;
	private boolean credentialsNonExpired = true;
	private boolean enabled = true;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelMap model) {
		ModelAndView mv = new ModelAndView("login");
		return mv;

	}

	

	/*
	 * public ModelAndView userAuthentication (Customer customerForm) throws
	 * Exception { ModelAndView mv = new ModelAndView("customer");
	 * 
	 * String out =
	 * "ovìøení uživatele: nesprávné heslo nebo uživatel neexistuje  "; try {
	 * 
	 * SessionFactory sessionFactory = new Configuration() //
	 * .configure("c:/Eclipse_workspaces/letecka_posta/ropr/src/hibernate.cfg.xml"
	 * ).buildSessionFactory();
	 * .configure("hibernate.cfg.xml").buildSessionFactory();
	 * 
	 * Session session = sessionFactory.getCurrentSession(); // Session session
	 * = // HibernateUtil.getSessionFactory().getCurrentSession();
	 * if(hsr.getParameter("j_username")!= null){
	 * 
	 * 
	 * Customer customer =
	 * loadCustomerByUsername(session,customerForm.getParameter("j_username"));
	 * if(customer != null &&
	 * customerForm.getPassword().equalsIgnoreCase(hsr.getParameter
	 * ("j_password"))){ mv.addObject("customer", Arrays.asList(customer));
	 * 
	 * return mv; }
	 * 
	 * }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } //User not exists or wrong
	 * password provided mv.addObject("message", out); return mv; }
	 */

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {

		model.User user = null;
		List<GrantedAuthorityImpl> authority = new ArrayList<>();
		try {

			/*
			 * SessionFactory sessionFactory = new Configuration().configure(
			 * "hibernate.cfg.xml").buildSessionFactory();
			 */
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			user = userDao.loadUserByUsername(username);
			Set<UserRole> role = (Set<UserRole>) user.getUserRoles();
			for (UserRole item :role ) {
				authority.add(new GrantedAuthorityImpl(item.getRole()));
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user == null) {
			throw new UsernameNotFoundException(username);
		}

		org.springframework.security.core.userdetails.User userDetail = new org.springframework.security.core.userdetails.User(user.getUsername(),
				user.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authority);
		return userDetail;

		
	}
}
