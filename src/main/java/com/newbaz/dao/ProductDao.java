package com.newbaz.dao;

import com.newbaz.model.Product;

/**
 * Created by dorsa on 3/2/17.
 */
public interface ProductDao extends StuffDao<Integer,Product>{
    void insertP(Product product);
    void deleteP(Product product);
    Product findProduct(Integer staffId);
}
