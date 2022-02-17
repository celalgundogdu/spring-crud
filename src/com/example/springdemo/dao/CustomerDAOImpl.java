package com.example.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.springdemo.entity.Customer;
import com.example.springdemo.util.SortUtils;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> getCustomers(int sortField) {
		Session session = sessionFactory.getCurrentSession();
		String sortingFieldName = null;
		switch(sortField) {
			case SortUtils.FIRST_NAME:
				sortingFieldName = "firstName";
				break;
			case SortUtils.LAST_NAME:
				sortingFieldName = "lastName";
				break;
			case SortUtils.EMAIL:
				sortingFieldName = "email";
				break;
			default:
					sortingFieldName = "firstName";
			
		}
		Query<Customer> query = session.createQuery("from Customer order by " + sortingFieldName, Customer.class);
		List<Customer> customers = query.getResultList();
		return customers;
	}

	@Override
	public void saveCustomer(Customer customer) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(customer);
	}

	@Override
	public Customer getCustomerById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.get(Customer.class, id);
		return customer;
	}

	@Override
	public void deleteCustomer(int id) {
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.get(Customer.class, id);
		session.delete(customer);
	}

	@Override
	public List<Customer> searchCustomer(String customerName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		if(customerName != null && customerName.trim().length() > 0) {
			query = session.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName", Customer.class);
			query.setParameter("theName", "%" + customerName.toLowerCase() + "%");
		} else {
			query = session.createQuery("from Customer", Customer.class);   
		}
		
		List<Customer> customers = query.getResultList();
		return customers;
	}

}
