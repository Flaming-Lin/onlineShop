package com.lin.Service;

import com.lin.Dao.OrderDao;
import com.lin.Entity.Order;
import com.lin.Entity.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    public String saveOrder(Order entity) {

        return orderDao.save(entity);
    }

    public void deleteOrder(Order entity) {

        orderDao.delete(entity.getId());
    }

    public void updateOrder(Order entity) {

        orderDao.update(entity);
    }

    public Order findById(String id) {

        return orderDao.findObjectById(id);
    }

    public Page<Order> findByBusForPage(String id, int currentPage, int pageSize){
        Page<Order> page = new Page<Order>();
        int allRow = orderDao.findBusRowCount(id);
        int offset = page.countOffset(currentPage, pageSize);
        List<Order> list = orderDao.findByBusForPage(id, offset, pageSize);
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);
        return page;
    }

    public Page<Order> findByCusForPage(String id,int currentPage,int pageSize){
        Page<Order> page = new Page<Order>();
        int allRow = orderDao.findCusRowCount(id);
        int offset = page.countOffset(currentPage, pageSize);
        List<Order> list = orderDao.findByCusForPage(id, offset, pageSize);
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);
        return page;
    }

}
