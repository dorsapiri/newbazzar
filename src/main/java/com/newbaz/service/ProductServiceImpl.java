package com.newbaz.service;

import com.newbaz.dao.ProductDao;
import com.newbaz.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 3/5/17.
 */
@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    public void insertP(Product product) {
        productDao.insertP(product);
    }

    public void deleteP(Product product) {

    }

    public Product findProduct(Integer staffId) {
        return null;
    }
}
