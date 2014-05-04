package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import model.Order;
import model.User;

import org.hibernate.Hibernate;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import dao.OrderDao;
import dao.UserDao;
import dao.UserRoleDao;
import edu.emory.mathcs.backport.java.util.Arrays;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	public static final String ORDER_STATUS_NEW = "NEW";
	public static final String ORDER_STATUS_DONE = "DONE";
	public static final String ORDER_STATUS_PREPARE= "PREPARE";
        
        
	

	Calendar calendar = new GregorianCalendar();
	UserController userController = new UserController();
	OrderDao orderDao = new OrderDao();
    UserRoleDao userRoleDao = new UserRoleDao();
    UserDao userDao = new UserDao();

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	@Secured({ "ROLE_USER", "ROLE_ADMIN",UserController.CUSTOMER_ROLE })
	public ModelAndView newOrder(Model model) {
		ModelAndView mv = new ModelAndView("orderForm");
		Order order = new Order();
		order.setDate(calendar.getTime());
		
		if(order.getStatus() == null){
			order.setStatus(ORDER_STATUS_NEW);
		}
		model.addAttribute(order);
		model.addAttribute("isDisabled",false);

		mv.addObject("isCustomer", userController.userHasRole("ROLE_CUSTOMER"));
		return mv;
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	
	
	public ModelAndView saveOrder(Order order, HttpServletRequest request,   @RequestParam(value="driver", required=false) String driverId) {
		
		if (driverId != null){
			User driver = userDao.loadUserByUserId(Integer.parseInt(driverId));
			order.setUserByIdUserDriver(driver);
                         order.setStatus(ORDER_STATUS_PREPARE);
		}
                
		order.setUserByUserId(userController.getCurrentUser());
		if(order.getCountOfKm() != null && order.getCountOfKm() != 0){
			order.setStatus(ORDER_STATUS_DONE);
		}
		
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
				orders.addAll(orderDao.getAllOrdersByUserId(current.getIdUser()));
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
		boolean isDisabled = (order.getStatus().equalsIgnoreCase(ORDER_STATUS_DONE)) ? true : false;
		
        Set<User> drivers = userRoleDao.loadUsersByRoleName(UserController.EMPLOYEE_ROLE);
        
        /*
        List<String> driversDto = new ArrayList(); 
        for (User user : drivers) {
        	driversDto.add(user.getName());
		}
        
        OrderDTO orderDto = new OrderDTO();
        
        orderDto.setCityFrom(order.getCityFrom());
        orderDto.setStreetFrom(order.getStreetFrom());
        orderDto.setCityTo(order.getCityTo());
        orderDto.setStreetTo(order.getStreetTo());
        
        orderDto.setCountOfKm(order.getCountOfKm());
        orderDto.setDate(order.getDate());
        orderDto.setOrderId(order.getOrderId());
        orderDto.setStatus(order.getStatus());
        orderDto.setUserByUserId(order.getUserByUserId());
        orderDto.setDrivers(drivers);*/
        
        
		mv.addObject("isCustomer", userController.userHasRole("ROLE_CUSTOMER"));
		model.addAttribute("order", order);
		model.addAttribute("drivers", drivers);
		model.addAttribute("isDisabled",isDisabled);
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
