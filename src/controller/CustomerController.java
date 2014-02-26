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
import model.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CustomerController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr,
                                      HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("customer");
        String out = "Výpis uživatelů: ";
      try {
            
    	  SessionFactory sessionFactory = new Configuration()
    	  .configure("hibernate.cfg.xml").buildSessionFactory();
    	  
    	   Session session = sessionFactory.getCurrentSession();
    	  //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            List result = session.createQuery("from Customer").list();
            mv.addObject("customer", result);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("message", out);
        return mv;
    }
}
