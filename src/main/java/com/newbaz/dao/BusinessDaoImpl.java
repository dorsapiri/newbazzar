package com.newbaz.dao;

import com.newbaz.model.Business;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 4/1/17.
 */
@Repository("businessDao")
public class BusinessDaoImpl extends AbstractDao<Integer,Business> implements BusinessDao {
    @Override
    public void insert(Business business) {
        persist(business);
    }

    @Override
    public void delete(Business business) {

    }

    @Override
    public Business findByUserId(Integer id) {
        return null;
    }
}
