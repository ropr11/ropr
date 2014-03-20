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

import dao.HibernateUtil;
import dao.Role;
import dao.UserDao;
import dao.UserRoleDao;

import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import model.Customer;
import model.User;
import model.UserRole;
import model.UserRoles;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	UserDao userDao = new UserDao();
	UserRoleDao userRolesDao = new UserRoleDao();
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	@Secured("ROLE_USER")
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView("menu");
		return mv;

	}

   @RequestMapping(value = "/list")
   @Secured("ROLE_USER")
    public ModelAndView listCustomers (){
        ModelAndView mv = new ModelAndView("users");
        String out = "Výpis uživatelù: ";
      try {
            List<User> users = userDao.listUsers();
            for (User user : users) {
				user.setIdUser(String.valueOf(user.getIdUser()));
			}
            mv.addObject("users", users);
        } catch (Exception e) {
           e.printStackTrace();
        }
        mv.addObject("message", out);
        return mv;
    }
   
   @RequestMapping(value = "/new" ,method=RequestMethod.GET )
   @Secured("ROLE_USER")
   public ModelAndView newCustomerForm (){
	   ModelAndView mv= new ModelAndView("new_customer_form");
	   List<UserRole> userRoles = (List<UserRole>)userRolesDao.loadUserRoles();
	   /*List<Role> roles = new ArrayList<Role>();
	   
	   for (Iterator iterator = userRoles.iterator(); iterator.hasNext();) {
		UserRole role = (UserRole) iterator.next();
		roles.add(new Role(role.getRole()));
	   }*/
	  // mv.addObject("userRoles",roles);
       return mv;
   }
    
    @RequestMapping(value = "/new", method=RequestMethod.POST)
    @Secured("ROLE_USER")
    public ModelAndView newCustomer (HttpServletRequest request){
    	User user = new User();
    	user.setName(request.getParameter("jmeno"));
    	user.setUsername(request.getParameter("login"));
    	user.setPassword(request.getParameter("password"));
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView(new RedirectView("list"));
    }
    
}
