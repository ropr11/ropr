package controller;

import java.util.Date;
import java.util.Set;

import model.User;

public class OrderDTO {

	private Integer orderId;
	private User userByIdUserDriver;
	private Set<User> drivers;
	
	public Set<User> getDrivers() {
		return drivers;
	}

	public void setDrivers(Set<User> drivers) {
		this.drivers = drivers;
	}

	private User userByUserId;
	private String cityFrom;
	private String cityTo;
	private String streetFrom;
	private String streetTo;
	private Integer countOfKm;
	private Date date;
	private String status;

	public OrderDTO() {
	}

	public OrderDTO(User userByUserId, String cityFrom, String cityTo, String streetFrom, String streetTo, Date date, String status) {
		this.userByUserId = userByUserId;
		this.cityFrom = cityFrom;
		this.cityTo = cityTo;
		this.streetFrom = streetFrom;
		this.streetTo = streetTo;
		this.date = date;
		this.status = status;
	}

	public OrderDTO(User userByIdUserDriver, User userByUserId, String cityFrom, String cityTo, String streetFrom, String streetTo, Integer countOfKm, Date date,
			String status) {
		this.userByIdUserDriver = userByIdUserDriver;
		this.userByUserId = userByUserId;
		this.cityFrom = cityFrom;
		this.cityTo = cityTo;
		this.streetFrom = streetFrom;
		this.streetTo = streetTo;
		this.countOfKm = countOfKm;
		this.date = date;
		this.status = status;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public User getUserByIdUserDriver() {
		return this.userByIdUserDriver;
	}

	public void setUserByIdUserDriver(User userByIdUserDriver) {
		this.userByIdUserDriver = userByIdUserDriver;
	}

	public User getUserByUserId() {
		return this.userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	public String getCityFrom() {
		return this.cityFrom;
	}

	public void setCityFrom(String cityFrom) {
		this.cityFrom = cityFrom;
	}

	public String getCityTo() {
		return this.cityTo;
	}

	public void setCityTo(String cityTo) {
		this.cityTo = cityTo;
	}

	public String getStreetFrom() {
		return this.streetFrom;
	}

	public void setStreetFrom(String streetFrom) {
		this.streetFrom = streetFrom;
	}

	public String getStreetTo() {
		return this.streetTo;
	}

	public void setStreetTo(String streetTo) {
		this.streetTo = streetTo;
	}

	public Integer getCountOfKm() {
		return this.countOfKm;
	}

	public void setCountOfKm(Integer countOfKm) {
		this.countOfKm = countOfKm;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
