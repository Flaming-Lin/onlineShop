package com.lin.Controller;

import com.lin.Entity.*;
import com.lin.Service.CustomerService;
import com.lin.Service.OrderService;
import com.lin.Service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Order")
public class OrderController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductsService productsService;

    @RequestMapping(value = "/orderList")
    public String orderlist(HttpSession session, ModelMap model, HttpServletRequest request) {
        String role = (String) session.getAttribute("role");
        String pageNo = request.getParameter("pageNo");
        System.out.println(pageNo);
        if (role.equals("bus")) {
            Business bus = (Business) session.getAttribute("business");
            String id = bus.getId();
            if (pageNo == null) {
                pageNo = "1";
            }
            Page<Order> page = orderService.findByBusForPage(id, Integer.valueOf(pageNo), 6);
            List<Order> list = page.getList();
            model.put("list", list);
            request.setAttribute("page", page);
            return "BusinessClient/orderManage";
        } else {
            Customer cus = (Customer) session.getAttribute("customer");
            String id = cus.getId();
            if (pageNo == null) {
                pageNo = "1";
            }
            Page<Order> page = orderService.findByCusForPage(id, Integer.valueOf(pageNo), 6);
            List<Order> list = page.getList();
            model.put("list", list);
            request.setAttribute("page", page);
            return "CustomerClient/orderManage";
        }
    }

    @RequestMapping(value = "/create")
    public String create(HttpSession session, String id, String number) {
        Products product = productsService.findById(id);
        Customer customer = (Customer) session.getAttribute("customer");
        Customer cust = customerService.findById(customer.getId());
        Order order = new Order();
        order.setBusiness(product.getBusiness());
        order.setComment("");
        order.setCustomer(cust);
        order.setCustomer_1(cust.getNickname());
        order.setDate(new Date());
        order.setNumber(Integer.parseInt(number));
        order.setProduct(product.getName());
        order.setProducts(product);
        order.setTotalprice(Integer.parseInt(number) * product.getPrice());
        order.setState("未发货");
        String orderID = orderService.saveOrder(order);
        return "forward:/Products/updateInfoByOrder.do?orderID=" + orderID;
    }

    @RequestMapping(value = "/addComment")
    public String addComment(String id, String comment) {
        Order order = orderService.findById(id);
        order.setComment(comment);
        order.setState("已评价");
        orderService.updateOrder(order);
        return "forward:/Order/orderList.do";
    }

    @RequestMapping(value = "confirmOrder")
    public String confirmOrder(String id, ModelMap model) {
        Order order = orderService.findById(id);
        model.put("order", order);
        return "CustomerClient/confirmOrder";
    }

    @RequestMapping(value = "searchOrderInfo")
    public String searchOrderInfo(String id, ModelMap model) {
        Order order = orderService.findById(id);
        model.put("order", order);
        return "CustomerClient/orderInfo";
    }

    @RequestMapping("/sendProduct")
    public String sendproduct(String id) {
        Order order = orderService.findById(id);
        order.setState("已发货");
        orderService.updateOrder(order);
        return "forward:orderList.do";
    }
}
