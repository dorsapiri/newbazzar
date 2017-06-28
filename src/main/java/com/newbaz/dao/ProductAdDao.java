package com.newbaz.dao;

import com.newbaz.model.ProductAd;

import java.util.List;

/**
 * Created by dorsa on 5/2/17.
 */
public interface ProductAdDao {
    void insertProductAd(ProductAd productAd);
    List<ProductAd> findAllProductAds();
    ProductAd findById(Integer pId);
}
