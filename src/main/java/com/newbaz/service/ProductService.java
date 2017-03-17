package com.newbaz.service;

import com.newbaz.model.Product;

/**
 * Created by dorsa on 3/5/17.
 */
public interface ProductService {
    void insertP(Product product);
    void deleteP(Product product);
    Product findProduct(Integer staffId);
}
