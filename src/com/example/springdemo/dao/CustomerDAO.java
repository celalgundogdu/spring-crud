package com.example.springdemo.dao;

import java.util.List;

import com.example.springdemo.entity.Customer;

public interface CustomerDAO {
	
	public List<Customer> getCustomers(int sortField);

	public void saveCustomer(Customer customer);

	public Customer getCustomerById(int id);

	public void deleteCustomer(int id);

	public List<Customer> searchCustomer(String customerName);

}
