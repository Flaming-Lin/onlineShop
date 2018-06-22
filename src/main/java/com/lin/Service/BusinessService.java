package com.lin.Service;

import com.lin.Entity.Business;

import java.util.List;

public interface BusinessService {

    public String saveBusiness(Business entity);

    public void deleteBusiness(Business entity);

    public void updateBusiness(Business entity);

    public Business findBusByNameAndPasssword(String username,String password);

    public Business findById(String id);

    public List<Business> findByUsername(String username);
}