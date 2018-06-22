package com.lin.Service;

import com.lin.Entity.Order;
import com.lin.Entity.Page;

public interface OrderService {

    public String saveOrder(Order entity);

    public void deleteOrder(Order entity);

    public void updateOrder(Order entity);

    public Order findById(String id);

    public Page<Order> findByBusForPage(String id, int currentPage, int pageSize);

    public Page<Order> findByCusForPage(String id,int currentPage,int pageSize);
}