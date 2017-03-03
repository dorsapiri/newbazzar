package com.newbaz.dao;

import com.newbaz.model.Product;

/**
 * Created by dorsa on 3/2/17.
 */
public interface ProductDao extends StuffDao<Product>{
    void insert(Product product);
    void delete(Product product);
    Product findProduct(Integer staffId);
}
