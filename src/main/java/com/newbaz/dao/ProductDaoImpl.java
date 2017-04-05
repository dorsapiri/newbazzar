package com.newbaz.dao;

import com.newbaz.model.Product;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 3/2/17.
 */
@Repository("productDao")
public class ProductDaoImpl extends StuffDaoImpl<Integer,Product> implements ProductDao {

static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);
@Autowired
private SessionFactory sessionFactory;

    @Override
    public void insertP(Product product) {
        insertS(product);
        persist(product);
    }

    @Override
    public void deleteP(Product product){

    }

    @Override
    public Product findProduct(Integer staffId) {
        return null;
    }
}
