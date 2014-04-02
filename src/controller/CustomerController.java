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
import java.util.List;

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

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
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
	   
	   List<UserRole> roles = userController.setupAvailableUserRoles();
	   mv.addObject("userRoles",roles);
	   model.addAttribute("user",new User());
       return mv;
   }


   
    @RequestMapping(value = "/new", method=RequestMethod.POST)
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    //public ModelAndView newCustomer (HttpServletRequest request){
    
    public ModelAndView newOrUpdateUser(@Valid User user, BindingResult result, Model m) {
        
    	/*if(result.hasErrors()) {
            return new ModelAndView(new RedirectView("new"));
        }*/
    	try {
        	
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            if(user.getIdUser() != null && !user.getIdUser().isEmpty()){
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
