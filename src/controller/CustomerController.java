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
import javax.validation.Valid;

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

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	private static final String ADMIN_ROLE = "ROLE_ADMIN";
	
	UserDao userDao = new UserDao();
	UserRoleDao userRolesDao = new UserRoleDao();
	UserController userController = new UserController();
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView("menu");
		return mv;

	}

   @RequestMapping(value = "/list")
   @Secured({"ROLE_USER","ROLE_ADMIN"})
    public ModelAndView listCustomers (){
        ModelAndView mv = new ModelAndView("users");
        String out = "Výpis uživatelù: ";
      try {
            List<User> users = userDao.listUsers();
            
            for (User user : users) {
            	Hibernate.initialize(user);
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
   @Secured({"ROLE_USER","ROLE_ADMIN"})
   public ModelAndView newCustomerForm (Model model){
	   ModelAndView mv= new ModelAndView("/userForm");
	   //ModelAndView mv= new ModelAndView("new_customer_form");
	   
	   List<UserRole> userRoles = userRolesDao.loadUserRoles();
	   List<Role> roles = new ArrayList<Role>();
	   
	   for (Iterator iterator = userRoles.iterator(); iterator.hasNext();) {
		UserRole role = (UserRole) iterator.next();
		if(role.getRole().equals(ADMIN_ROLE)){
			if(userController.userHasRole(ADMIN_ROLE)){
				roles.add(new Role(role.getRole()));
			} else{
				continue;
			}
		} else{
		roles.add(new Role(role.getRole()));
		}
	   }
	   mv.addObject("userRoles",roles);
	   model.addAttribute("user",new User());
       return mv;
   }
   
    @RequestMapping(value = "/new", method=RequestMethod.POST)
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    //public ModelAndView newCustomer (HttpServletRequest request){
    
    public ModelAndView newCustomer(@Valid User user, BindingResult result, Model m) {
        
    	/*if(result.hasErrors()) {
            return new ModelAndView(new RedirectView("new"));
        }*/
    	try {
        	
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        m.addAttribute("message", "Successfully saved person: " + user.toString());
        return new ModelAndView(new RedirectView("list"));
    }
    
    @RequestMapping(value = "/edit" ,method=RequestMethod.GET )
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    public ModelAndView showUser (@RequestParam(value="id", required=true) Integer id,Model model){
 	   ModelAndView mv= new ModelAndView("userForm");
 	   //ModelAndView mv= new ModelAndView("new_customer_form");
 	   
 	   User user = userDao.loadUserByUserId(id);

 	   mv.addObject("userRoles",user.getUserRoles());
 	   model.addAttribute("user",user);
        return mv;
    }
    
    @RequestMapping(value = "/delete" ,method=RequestMethod.GET )
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    public ModelAndView deleteUser (@RequestParam(value="id", required=true) Integer id,Model model){
 	   ModelAndView mv= new ModelAndView(new RedirectView("list"));
 	   //ModelAndView mv= new ModelAndView("new_customer_form");
 	   
 	   User user = userDao.loadUserByUserId(id);
 	   userDao.deleteUser(user);

        return mv;
    }
    
}
