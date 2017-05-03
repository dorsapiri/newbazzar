package com.newbaz.dao;

import com.newbaz.model.ProductAd;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 5/2/17.
 */
@Repository("productAdDao")
public class ProductAdDaoImpl extends AbstractDao<Integer,ProductAd> implements ProductAdDao {
    @Override
    public void insertProductAd(ProductAd productAd) {
        persist(productAd);
    }
}
