package com.lin.Dao;

import com.lin.Entity.Business;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("businessDao")
public class BusinessDaoImpl extends BaseDaoImpl<Business, String> implements BusinessDao {

    @SuppressWarnings("unchecked")
    public List<Business> findByAccountAndPassword(String username, String password) {
        Query query =  this.getCurrentSession().createQuery("from Business where username = ? and password = ?");
        query.setParameter(0,username);
        query.setParameter(1,password);
        return query.list();
    }

    @SuppressWarnings("unchecked")
    public List<Business> findByParam(String hql,Object[] param){
        Query q=this.getCurrentSession().createQuery(hql);
        if(param!=null && param.length>0){
            for(int i = 0;i<param.length;i++){
                q.setParameter(i, param[i]);
            }
        }
        return q.list();
    }

}
