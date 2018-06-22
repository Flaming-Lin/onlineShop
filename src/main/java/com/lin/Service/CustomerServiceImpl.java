package com.lin.Service;

import com.lin.Dao.CustomerDao;
import com.lin.Entity.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Resource
    private CustomerDao customerDao;

    public String saveCustomer(Customer entity) {

        return customerDao.save(entity);
    }

    public void deleteCustomer(Customer entity) {

        customerDao.delete(entity.getId());
    }

    public void updateCustomer(Customer entity) {

        customerDao.update(entity);
    }

    public Customer findCusByNameAndPasssword(String username, String password) {
        List<Customer> bus = customerDao.findByAccountAndPassword(username, password);
        if(!bus.isEmpty()){
            return bus.get(0);
        }else{
            return null;
        }
    }

    public Customer findById(String id) {

        return customerDao.findObjectById(id);
    }

    public List<Customer> findByUsername(String username){

        return customerDao.findByParam("from Customer where username = ?", new Object[] {username});
    }
}