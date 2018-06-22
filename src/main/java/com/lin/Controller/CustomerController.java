package com.lin.Controller;

import com.lin.Entity.Customer;
import com.lin.Service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping("/Customer")
@SessionAttributes({"customer","role"})
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/login")
    public String login(Customer customer,ModelMap model){
        Customer cus = customerService.findCusByNameAndPasssword(customer.getUsername(), customer.getPassword());
        if(cus!=null){
            model.put("customer", cus);
            model.put("role","cus");
            return "CustomerClient/main";
        }else{
            String result = "错误的用户名或密码！";
            model.addAttribute("result", result);
            return "CustomerClient/login";
        }
    }

    @RequestMapping("/register")
    public String register(Customer customer,ModelMap model){
        customerService.saveCustomer(customer);
        Customer cus = customerService.findCusByNameAndPasssword(customer.getUsername(), customer.getPassword());
        model.put("customer", cus);
        return "CustomerClient/login";
    }

    @RequestMapping(value="/update",method= RequestMethod.POST)
    public String update(ModelMap model,String id,String nickname,String telephone ,@RequestParam(value="file",required=false) MultipartFile file,
                         HttpServletRequest request)throws Exception{

        String pathRoot = request.getSession().getServletContext().getRealPath("");
        String path="";
        Customer cust = customerService.findById(id);
        if(!file.isEmpty()){
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            String contentType=file.getContentType();
            String imageName=contentType.substring(contentType.indexOf("/")+1);
            path="/upload/"+uuid+"."+imageName;
            file.transferTo(new File(pathRoot+path));
            cust.setImgurl(path);
        }
        cust.setNickname(nickname);
        cust.setTelephone(telephone);
        customerService.updateCustomer(cust);
        cust = customerService.findById(id);
        model.put("customer", cust);
        return "CustomerClient/main";
    }

}