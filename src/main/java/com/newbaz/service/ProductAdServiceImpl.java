package com.newbaz.service;

import com.newbaz.dao.ProductAdDao;
import com.newbaz.model.ProductAd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 5/2/17.
 */
@Service("productAdService")
@Transactional
public class ProductAdServiceImpl implements ProductAdService {

    @Autowired
    private ProductAdDao productAdDao;
    @Override
    public void insertProductAd(ProductAd productAd) {
        productAdDao.insertProductAd(productAd);
    }

    @Override
    public List<ProductAd> findAllProductAds() {
        return productAdDao.findAllProductAds();
    }

    @Override
    public ProductAd findById(Integer pId) {
        return productAdDao.findById(pId);
    }
}
