package test.java.dao;

import java.util.Calendar;
import java.util.GregorianCalendar;

import dao.OrderDao;
import dao.UserDao;

public class AbstractDaoTest {

	protected OrderDao orderDao = new OrderDao();
	protected UserDao userDao = new UserDao();
	protected Calendar calendar = new GregorianCalendar();
}
