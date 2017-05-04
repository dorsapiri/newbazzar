package com.newbaz.dao;

import com.newbaz.model.ProductAd;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 5/2/17.
 */
@Repository("productAdDao")
public class ProductAdDaoImpl extends AbstractDao<Integer,ProductAd> implements ProductAdDao {
    @Override
    public void insertProductAd(ProductAd productAd) {
        persist(productAd);
    }

    @Override
    public List<ProductAd> findAllProductAds() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("createDate"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<ProductAd> productAds = (List<ProductAd>) criteria.list();
        return productAds;
    }
}
