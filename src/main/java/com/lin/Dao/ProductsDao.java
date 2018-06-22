package com.lin.Dao;

import com.lin.Entity.Products;

import java.util.List;

public interface ProductsDao extends BaseDao<Products, String> {

    public List<Products> findByParam(String hql, Object[] param);

    public List<Products> findAllForPage(int offset,int length);

    public List<Products> findByBusIdForPage(String id, int offset, int length);

    public int findRowCount(String id);

    public int findALlRowCount();
}