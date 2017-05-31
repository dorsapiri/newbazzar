package com.newbaz.service;

import com.newbaz.model.Product;
import com.newbaz.model.User;

import java.util.List;

/**
 * Created by dorsa on 3/5/17.
 */
public interface ProductService {
    List<Product> findAllProducts();
    void insertP(Product product);
    void deleteP(Product product);
    Product findProduct(Integer staffId);
    List<Product> findByOwner(User owner);
    Product findByProductId(Integer id);
    void updateProduct(Product product);
    void addToFavPro(Product product);
    void removeFromFavPro(Product product);
}
