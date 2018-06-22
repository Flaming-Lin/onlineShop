package com.lin.Controller;

import com.lin.Entity.Business;
import com.lin.Service.BusinessService;
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
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/Business")
@SessionAttributes({"business","role"})
public class BusinessController {

    @Autowired
    private BusinessService businessService;

    @RequestMapping(value = "/login")
    public String login(Business business, ModelMap model) {
        System.out.println(business.getUsername() + business.getPassword());
        Business bus = businessService.findBusByNameAndPasssword(business.getUsername(), business.getPassword());
        if (bus != null) {
            model.put("business", bus);
            model.put("role", "bus");
            return "BusinessClient/main";
        } else {
            String result = "错误的用户名或密码！";
            model.addAttribute("result", result);
            return "BusinessClient/login";
        }
    }


    @RequestMapping(value = "/register")
    public String register(Business business, ModelMap model) {
        business.setOpenDate(new Date());
        businessService.saveBusiness(business);
        Business bus = businessService.findBusByNameAndPasssword(business.getUsername(), business.getPassword());
        return "BusinessClient/login";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(ModelMap model, String id, String nickName, String telephone, @RequestParam(value = "file", required = false) MultipartFile file,
                         HttpServletRequest request) throws Exception {
        String pathRoot = request.getSession().getServletContext().getRealPath("");
        String path = "";
        Business bus = businessService.findById(id);
        if (!file.isEmpty()) {
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            String contentType = file.getContentType();
            String imageName = contentType.substring(contentType.indexOf("/") + 1);
            path = "/upload/" + uuid + "." + imageName;
            file.transferTo(new File(pathRoot + path));
            bus.setImgurl(path);
        }
        bus.setNickName(nickName);
        bus.setTelephone(telephone);
        businessService.updateBusiness(bus);
        bus = businessService.findById(id);
        model.put("business", bus);
        return "BusinessClient/main";
    }
}
