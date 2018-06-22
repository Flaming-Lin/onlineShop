package com.lin.Dao;

import com.lin.Entity.Order;

import java.util.List;

public interface OrderDao extends BaseDao<Order, String> {

    public List<Order> findByParam(String hql, Object[] param);

    public List<Order> findByBusForPage(String id,int offset,int length);

    public int findBusRowCount(String id);

    public List<Order> findByCusForPage(String id, int offset, int length);

    public int findCusRowCount(String id);
}