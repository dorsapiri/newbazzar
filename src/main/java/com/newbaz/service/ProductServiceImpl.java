package com.newbaz.service;

import com.newbaz.dao.ProductDao;
import com.newbaz.model.Product;
import com.newbaz.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 3/5/17.
 */
@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public List<Product> findAllProducts() {
        return productDao.findAllProduct();
    }

    public void insertP(Product product) {
        productDao.insertP(product);
    }

    public void deleteP(Product product) {

    }

    public Product findProduct(Integer staffId) {
        return null;
    }

    @Override
    public List<Product> findByOwner(User owner) {
        return productDao.findByOwner(owner);
    }

    @Override
    public Product findByProductId(Integer id) {
        return productDao.findByProductId(id);
    }

    @Override
    public void updateProduct(Product product) {
        Product entity = (Product) productDao.findById(product.getId());
        if (entity!=null){
            entity.setPrice(product.getPrice());
            entity.setStatus(product.isStatus());
            entity.setBrandName(product.getBrandName());
            entity.setColor(product.getColor());
            entity.setCompanyProducer(product.getCompanyProducer());
            entity.setFeatures(product.getFeatures());
            entity.setMadeIn(product.getMadeIn());
            entity.setManufactureTechnology(product.getManufactureTechnology());
            entity.setMaterial(product.getMaterial());
            entity.setMaxOrder(product.getMaxOrder());
            entity.setMinOrder(product.getMinOrder());
            entity.setModelName(product.getModelName());
            entity.setNumberInYear(product.getNumberInYear());
            entity.setPerformance(product.getPerformance());
            entity.setProductAbility(product.getProductAbility());
            entity.setProductSpecification(product.getProductSpecification());
            entity.setProductType(product.getProductType());
            entity.setQuantityDegree(product.getQuantityDegree());
            entity.setSalesAmount(product.getSalesAmount());
            entity.setSize(product.getSize());
            entity.setSku(product.getSku());
            entity.setStandards(product.getStandards());
            entity.setUnit(product.getUnit());
            entity.setStock(product.getStock());
            entity.setUseCase(product.getUseCase());
            entity.setCurrency(product.getCurrency());
            entity.setImages(product.getImages());
        }
    }

    @Override
    public void addOrRemoveFavPro(Product product) {
        Product entity = productDao.findByProductId(product.getId());
        entity.setFavorite(product.getFavorite());
    }

}
