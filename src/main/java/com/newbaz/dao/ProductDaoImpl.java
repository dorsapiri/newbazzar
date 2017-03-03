package com.newbaz.dao;

import com.newbaz.model.Product;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 3/2/17.
 */
@Repository("productDao")
public class ProductDaoImpl extends StuffDaoImpl<Product> implements ProductDao {
    @Override
    public void insert(Product product) {
        insert(product);
        persist(product);
    }

    @Override
    public void delete(Product product){

    }

    @Override
    public Product findProduct(Integer staffId) {
        return null;
    }
}
