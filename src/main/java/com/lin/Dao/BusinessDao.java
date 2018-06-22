package com.lin.Dao;

import com.lin.Entity.Business;

import java.util.List;

public interface BusinessDao extends BaseDao<Business,String>{

    public List<Business> findByAccountAndPassword(String username, String password);

    public List<Business> findByParam(String hql,Object[] param);
}

