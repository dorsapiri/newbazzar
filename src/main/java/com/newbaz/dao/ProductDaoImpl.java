package com.newbaz.dao;

import com.newbaz.model.Product;
import com.newbaz.model.User;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
@Repository("productDao")
public class ProductDaoImpl extends StuffDaoImpl<Integer,Product> implements ProductDao {

static final Logger logger = LoggerFactory.getLogger(ProductDaoImpl.class);
@Autowired
private SessionFactory sessionFactory;

    @Override
    public List<Product> findAllProduct() {
        Criteria criteria = createEntityCriteria().addOrder(Order.desc("createDate"));
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Product> products = (List<Product>) criteria.list();
        for (Product pr:products){
            List<User> users = pr.getFavorite();
            if (users==null){
                pr.setCountFav(0);
            }else
                pr.setCountFav(users.size());
        }
        return products;
    }

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

    @Override
    public List<Product> findByOwner(User owner) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("owner",owner));
        List<Product> works = (List<Product>) criteria.list();
        if (works!=null){
            for (Product product: works){
                Hibernate.initialize(product.getOwner().getSsoId());
            }
        }
        return works;
    }

    @Override
    public Product findByProductId(Integer id) {
        Product product = (Product) getByKey(id);
        return product;
    }

    @Override
    public List<Product> searchProduct(String string) {
        Criteria criteria = createEntityCriteria().addOrder(Order.desc("createDate"));
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Product> products = criteria.list();
        List<Product> result = new ArrayList<>();
        String[] strArray=string.split(" ");
        for (String str: strArray){
            for (Product product:products){
                if (product.getName().contains(str) || product.getBrandName().contains(str) || product.getMadeIn().contains(str)){
                    if ( !result.contains(product) && !str.equals("")){
                        result.add(product);
                        Hibernate.initialize(product.getOwner().getSsoId());
                    }
                }
            }
        }
        return result;
    }
}
