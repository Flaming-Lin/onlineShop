package com.lin.Service;

import com.lin.Entity.Customer;

import java.util.List;

public interface CustomerService {

    public String saveCustomer(Customer entity);

    public void deleteCustomer(Customer entity);

    public void updateCustomer(Customer entity);

    public Customer findCusByNameAndPasssword(String username,String password);

    public Customer findById(String id);

    public List<Customer> findByUsername(String username);
}
