package com.lin.Dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T ,pk extends Serializable> {

    public String save(T entity);
    public void update(T entity);
    public void delete(pk id);
    public T findObjectById(pk id);
    public List<T> findObjects();
}