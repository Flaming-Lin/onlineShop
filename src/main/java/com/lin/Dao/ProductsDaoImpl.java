package com.lin.Dao;

import com.lin.Entity.Products;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productsDao")
public class ProductsDaoImpl extends BaseDaoImpl<Products, String> implements ProductsDao {

    @SuppressWarnings("unchecked")
    public List<Products> findByParam(String hql, Object[] param) {
        Query q=this.getCurrentSession().createQuery(hql);
        if(param!=null && param.length>0){
            for(int i = 0;i<param.length;i++){
                q.setParameter(i, param[i]);
            }
        }
        return q.list();
    }

    @SuppressWarnings("unchecked")
    public List<Products> findAllForPage(int offset,int length){
        Session session = this.getCurrentSession();
        String hql = "from Products p order by p.onselldate desc";
        Query query = session.createQuery(hql);
        query.setFirstResult(offset);
        query.setMaxResults(length);
        List<Products> products = query.list();
        return products;
    }

    @SuppressWarnings("unchecked")
    public List<Products> findByBusIdForPage(String id,int offset,int length){
        Session session = this.getCurrentSession();
        String hql = "from Products p where businessid = ? order by onselldate desc";
        Query query = session.createQuery(hql);
        query.setParameter(0, id);
        query.setFirstResult(offset);
        query.setMaxResults(length);
        List<Products> products = query.list();
        return products;
    }

    public int findRowCount(String id){
        Session session = this.getCurrentSession();
        Query query = session.createQuery("select count(*) from Products p where businessid = ?");
        query.setParameter(0, id);
        int count = ((Long) query.uniqueResult()).intValue();
        return count;
    }

    public int findALlRowCount(){
        Session session = this.getCurrentSession();
        Query query = session.createQuery("select count(*) from Products p");
        int count = ((Long)query.uniqueResult()).intValue();
        return count;
    }

}