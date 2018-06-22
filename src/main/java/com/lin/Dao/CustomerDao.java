package com.lin.Dao;

import com.lin.Entity.Customer;

import java.util.List;

public interface CustomerDao extends BaseDao<Customer,String>{

    public List<Customer> findByAccountAndPassword(String username, String password);

    public List<Customer> findByParam(String hql,Object[] param);
}
