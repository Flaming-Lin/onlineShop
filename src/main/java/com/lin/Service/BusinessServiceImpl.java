package com.lin.Service;

import com.lin.Dao.BusinessDao;
import com.lin.Entity.Business;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService {

    @Resource
    private BusinessDao businessDao;

    public String saveBusiness(Business entity) {

        return businessDao.save(entity);
    }

    public void deleteBusiness(Business entity) {

        businessDao.delete(entity.getId());
    }

    public void updateBusiness(Business entity) {

        businessDao.update(entity);
    }

    public Business findBusByNameAndPasssword(String username, String password) {
        List<Business> bus = businessDao.findByAccountAndPassword(username, password);
        if(!bus.isEmpty()){
            return bus.get(0);
        }else{
            return null;
        }
    }

    public Business findById(String id) {

        return businessDao.findObjectById(id);
    }

    public List<Business> findByUsername(String username){

        return businessDao.findByParam("from Business where username = ?", new Object[] {username});
    }

}
