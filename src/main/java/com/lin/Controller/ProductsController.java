package com.lin.Controller;

import com.lin.Entity.Business;
import com.lin.Entity.Order;
import com.lin.Entity.Page;
import com.lin.Entity.Products;
import com.lin.Service.BusinessService;
import com.lin.Service.OrderService;
import com.lin.Service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping("/Products")
public class ProductsController {

    @Autowired
    private ProductsService productsService;
    @Autowired
    private BusinessService businessService;
    @Autowired
    private OrderService orderService;

    @RequestMapping(value="/businessProlist")
    public String prolist(HttpServletRequest request, ModelMap model, HttpSession session){
        String pageNo = request.getParameter("pageNo");
        Business bus = (Business)session.getAttribute("business");
        String id = bus.getId();
        if(pageNo == null){
            pageNo = "1";
        }
        Page<Products> page = productsService.findByBusForPage(id,Integer.valueOf(pageNo),6);
        List<Products> list = page.getList();
        model.put("list", list);
        request.setAttribute("page", page);
        return "BusinessClient/productManage";
    }

    @RequestMapping(value="/customerProList")
    public String customerProList(HttpServletRequest request,ModelMap model){
        String pageNo = request.getParameter("pageNo");
        if(pageNo == null){
            pageNo = "1";
        }
        Page<Products> page = productsService.findAllForPage(Integer.valueOf(pageNo),6);
        List<Products> list = page.getList();
        model.put("list", list);
        request.setAttribute("page", page);
        return "CustomerClient/shopList";
    }

    @RequestMapping(value="/add")
    public String add(ModelMap model,String name,String type,double price,String memo,int instock,@RequestParam(value="file",required=false) MultipartFile file,
                      HttpServletRequest request,HttpSession session)throws Exception{
        Products products = new Products();
        Business business = (Business)session.getAttribute("business");
        Business bus = businessService.findById(business.getId());
        products.setName(name);
        products.setType(type);
        products.setPrice(price);
        products.setMemo(memo);
        products.setInstock(instock);
        products.setBusiness(bus);
        products.setSelled(0);
        products.setOnselldate(new Date());

        String pathRoot = request.getSession().getServletContext().getRealPath("");
        String path="";
        if(!file.isEmpty()){
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            String contentType=file.getContentType();
            String imageName=contentType.substring(contentType.indexOf("/")+1);
            path="/upload/products"+uuid+"."+imageName;
            file.transferTo(new File(pathRoot+path));
            products.setImgurl(path);
        }
        productsService.saveProducts(products);
        return "forward:businessProlist.do";
    }

    @RequestMapping(value="/delete")
    public String delete(String id,HttpServletRequest request){
        Products products = productsService.findById(id);
        productsService.deleteProducts(products);
        return "forward:businessProlist.do";
    }

    @RequestMapping(value="/editUI")
    public String editUI(String id,ModelMap model){
        Products products = productsService.findById(id);
        model.put("product", products);
        return "BusinessClient/productEdit";
    }

    @RequestMapping(value="/edit")
    public String edit(String id,ModelMap model,String name,String type,double price,String memo,int instock,@RequestParam(value="file",required=false) MultipartFile file,
                       HttpServletRequest request)throws Exception{
        Products product = productsService.findById(id);
        product.setName(name);
        product.setType(type);
        product.setPrice(price);
        product.setMemo(memo);
        product.setInstock(instock);
        String pathRoot = request.getSession().getServletContext().getRealPath("");
        String path="";
        if(!file.isEmpty()){
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            String contentType=file.getContentType();
            String imageName=contentType.substring(contentType.indexOf("/")+1);
            path="/upload/products"+uuid+"."+imageName;
            file.transferTo(new File(pathRoot+path));
            product.setImgurl(path);
        }
        productsService.updateProducts(product);
        return "forward:businessProlist.do";
    }

    @RequestMapping(value="/searchProInfo")
    public String searchProInfo(HttpSession session,String id,ModelMap model){
        String role = (String) session.getAttribute("role");
        Products product = productsService.findById(id);
        model.put("product", product);
        Set<Order> orders = product.getOrders();
        model.put("orders", orders);
        if("cus".equals(role)){
            return "CustomerClient/productInfo";
        }
        else if("bus".equals(role)){
            return "BusinessClient/productInfo";
        }
        else{
            return "";
        }
    }

    @RequestMapping(value="/customerBuy")
    public String customerBuy(String id,ModelMap model){
        Products product = productsService.findById(id);
        model.put("product", product);
        return "CustomerClient/buyProducts";
    }

    @RequestMapping(value="/updateInfoByOrder")
    public String updateInfoByOrder(String orderID,ModelMap model){
        Order order = new Order();
        order = orderService.findById(orderID);
        Products product = order.getProducts();
        product.setInstock(product.getInstock() - order.getNumber());
        Set<Order> orderSet = product.getOrders();
        orderSet.add(order);
        product.setOrders(orderSet);
        product.setSelled(product.getSelled() + order.getNumber());
        productsService.updateProducts(product);
        product = productsService.findById(order.getProducts().getId());
        model.put("order",order);
        model.put("product", product);
        return "forward:/Products/customerProList.do";
    }
}