package com.lin.Dao;

import com.lin.Entity.Customer;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("customerDao")
public class CustomerDaoImpl extends BaseDaoImpl<Customer, String> implements CustomerDao {

    @SuppressWarnings("unchecked")
    public List<Customer> findByAccountAndPassword(String username, String password) {
        Query query = this.getCurrentSession().createQuery("from Customer where username = ? and password = ?");
        query.setParameter(0, username);
        query.setParameter(1, password);
        return query.list();
    }

    @SuppressWarnings("unchecked")
    public List<Customer> findByParam(String hql, Object[] param) {
        Query q=this.getCurrentSession().createQuery(hql);
        if(param!=null && param.length>0){
            for(int i = 0;i<param.length;i++){
                q.setParameter(i, param[i]);
            }
        }
        return q.list();
    }

}
