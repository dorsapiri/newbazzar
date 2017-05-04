package com.newbaz.service;

import com.newbaz.dao.ProductAdDao;
import com.newbaz.model.ProductAd;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by dorsa on 5/2/17.
 */
public interface ProductAdService {
    void insertProductAd(ProductAd productAd);
    List<ProductAd> findAllProductAds();
}
