package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import model.Order;
import model.User;

import org.hibernate.Hibernate;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import dao.OrderDao;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

	Calendar calendar = new GregorianCalendar();
	UserController userController = new UserController();
	OrderDao orderDao = new OrderDao();

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	@Secured({ "ROLE_USER", "ROLE_ADMIN",UserController.CUSTOMER_ROLE })
	public ModelAndView newOrder(Model model) {
		ModelAndView mv = new ModelAndView("orderForm");
		Order order = new Order();
		order.setDate(calendar.getTime());
		model.addAttribute(order);

		mv.addObject("isCustomer", userController.userHasRole("ROLE_CUSTOMER"));
		return mv;
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public ModelAndView saveOrder(Order order) {
		order.setUser(userController.getCurrentUser());

		orderDao.saveOrder(order);
		return new ModelAndView(new RedirectView("list"));
	}

	@RequestMapping(value = "/list")
	@Secured({ "ROLE_USER", "ROLE_ADMIN",UserController.CUSTOMER_ROLE })
	public ModelAndView listCustomers() {
		ModelAndView mv = new ModelAndView("orders");
		List<Order> orders = new ArrayList<Order>();
		try {
			if (userController.userHasRole(UserController.ADMIN_ROLE) || userController.userHasRole(UserController.EMPLOYEE_ROLE)) {
				orders.addAll(orderDao.getAllOrders());

				for (Order order : orders) {
					Hibernate.initialize(order);
				}
			} else {
				User current = userController.getCurrentUser();
				orders.addAll(orderDao.getAllOrdersByUserId(Integer.parseInt(current.getIdUser())));
			}

			mv.addObject("orders", orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	@Secured({ "ROLE_USER", "ROLE_ADMIN",UserController.CUSTOMER_ROLE })
	public ModelAndView showUser(@RequestParam(value = "id", required = true) Integer id, Model model) {
		ModelAndView mv = new ModelAndView("orderForm");

		Order order = orderDao.getOrderById(id);

		mv.addObject("isCustomer", userController.userHasRole("ROLE_CUSTOMER"));
		model.addAttribute("order", order);
		return mv;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@Secured({ "ROLE_USER", "ROLE_ADMIN",UserController.CUSTOMER_ROLE })
	public ModelAndView deleteUser(@RequestParam(value = "id", required = true) Integer id, Model model) {
		ModelAndView mv = new ModelAndView(new RedirectView("list"));

		Order order = orderDao.getOrderById(id);
		orderDao.deleteOrder(order);

		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.initDirectFieldAccess();
		/* register appropriate date editor */
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
