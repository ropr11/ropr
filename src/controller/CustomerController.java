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
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.LinkedHashSet;
import javax.validation.Valid;

import model.User;
import model.UserRole;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import dao.HibernateUtil;
import dao.UserDao;
import dao.UserRoleDao;
import edu.emory.mathcs.backport.java.util.Arrays;
import edu.emory.mathcs.backport.java.util.LinkedList;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	private final String URL_USER_LIST =  "<a href='list'><img src='/RoprProjekt/pic/vypuz.jpg' alt='vypis' /><a>";
	private final String URL_USER_NEW = "<a href='new'><img src='/RoprProjekt/pic/novy.jpg' alt='novy' /></a>"; 
    private final String URL_ORDER_LIST = "<a href='/RoprProjekt/order/list'><img src='/RoprProjekt/pic/vypis.jpg' alt='vypis' /></a>"; 
    private final String URL_ORDER_NEW = "<a href='/RoprProjekt/order/new'><img src='/RoprProjekt/pic/nova.jpg' alt='novy' /></a>"; 
	UserDao userDao = new UserDao();
	UserRoleDao userRolesDao = new UserRoleDao();
	UserController userController = new UserController();
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	@Secured({"ROLE_USER",UserController.ADMIN_ROLE,UserController.CUSTOMER_ROLE})
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView("menu");
		Set<String> urls = new LinkedHashSet<String>();
		User currentUser = userController.getCurrentUser();
		if(userController.userHasRole("ROLE_USER")|| userController.userHasRole("ROLE_ADMIN")){
			urls.add("<tr><td>"+URL_USER_LIST+"</td>");
			urls.add("<td>"+URL_USER_NEW+"</td></tr>");
		} 
		
		urls.add("<tr><td>"+URL_ORDER_LIST+"</td>");
		urls.add("<td>"+URL_ORDER_NEW+"</td></tr>");
		//URL url = new URL(base url, relative url);
		mv.addObject("urls",urls);
		return mv;

	}

   @RequestMapping(value = "/list")
   @Secured({"ROLE_USER","ROLE_ADMIN"})
    public ModelAndView listCustomers (){
        ModelAndView mv = new ModelAndView("users");
        String out = "Výpis uživatelù: ";
        List<User> users;
      try {
    	  if(userController.userHasRole(UserController.ADMIN_ROLE)){
    		  users = userDao.listUsers();
              
              for (User user : users) {
              	Hibernate.initialize(user);
  				user.setIdUser(user.getIdUser());
  			}
    	  } else {
    		  users = new ArrayList<User>();
    		  User current = userController.getCurrentUser();
    		  current.setIdUser(current.getIdUser());
    		  users.add(current);
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
	   
	   List<UserRole> roles = userController.setupAvailableUserRoles();
	   mv.addObject("userRoles",roles);
	   mv.addObject("hints",UserController.questions);
	   model.addAttribute("user",new User());
       return mv;
   }


   
    @RequestMapping(value = "/new", method=RequestMethod.POST)
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    //public ModelAndView newCustomer (HttpServletRequest request){
    public ModelAndView newOrUpdateUser(@Valid User user, BindingResult result, Model m) {
        
    	if(result.hasErrors()) {
    		ModelAndView mv= new ModelAndView("/userForm");
    		
                List<UserRole> roles = userController.setupAvailableUserRoles();
                mv.addObject("userRoles",roles);
                mv.addObject("hints",UserController.questions);
                mv.addObject(user);
                
    		return mv;
    	}
    	try {
        	
           
            
            Set<UserRole> newRoles = new HashSet<UserRole>();
            
            //save changes done in user role setup 
            if( user.getUserRoles() != null){
            	for (Object roleToSet : user.getUserRoles()) {
                	UserRole role = userRolesDao.loadUserRoleById(Integer.parseInt((String)roleToSet) , false);
                	newRoles.add(role);
                }
                user.setUserRoles(newRoles);
            }else{
            	//no changes then setup origin roles
            	User userFromDb = userDao.loadUserByUsername(user.getUsername());
            	user.setUserRoles(userFromDb.getUserRoles());
            }
            
            
            
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            if(user.getIdUser() != null && !(user.getIdUser()== 0)){
            	session.update(user);
            }else{
            	session.save(user);
            }
            
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
 	   
 	   User user = userDao.loadUserByUserId(id);
 	   
 	   if(userController.userHasRole(UserController.ADMIN_ROLE)){
 		  mv.addObject("userRoles",userController.setupAvailableUserRoles()); 
 	   }else{
 		  mv.addObject("userRoles",user.getUserRoles());   
 	   }
 	   model.addAttribute("hints",UserController.questions);
 	   model.addAttribute("user",user);
        return mv;
    }
    
    @RequestMapping(value = "/delete" ,method=RequestMethod.GET )
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    public ModelAndView deleteUser (@RequestParam(value="id", required=true) Integer id,Model model){
 	   ModelAndView mv= new ModelAndView(new RedirectView("list"));
 	   
 	   User user = userDao.loadUserByUserId(id);
 	   userDao.deleteUser(user);

        return mv;
    }
    
   
    
}
