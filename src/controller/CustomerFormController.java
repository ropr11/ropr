package controller;

import model.HibernateUtil;
import model.Customer;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public class CustomerFormController extends SimpleFormController {

    public CustomerFormController() {
        setCommandClass(Customer.class);
        setCommandName("customer");
        setSuccessView("customer");
        setFormView("new_customer_form");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Customer customer = (Customer) command;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(customer);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView(new RedirectView("customer.htm"));
    }
}