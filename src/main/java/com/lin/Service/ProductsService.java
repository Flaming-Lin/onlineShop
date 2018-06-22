package com.lin.Service;

import com.lin.Entity.Page;
import com.lin.Entity.Products;

public interface ProductsService {

    public String saveProducts(Products entity);

    public void deleteProducts(Products entity);

    public void updateProducts(Products entity);

    public Products findById(String id);

    public Page<Products> findByBusForPage(String id, int currentPage, int pageSize);

    public Page<Products> findAllForPage(int currentPage,int PageSize);
}
