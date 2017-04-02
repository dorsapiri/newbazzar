package com.newbaz.dao;

import com.newbaz.model.Business;

/**
 * Created by dorsa on 4/1/17.
 */
public interface BusinessDao {
    void insert(Business business);
    void delete(Business business);
    Business findByUserId(Integer id);
}
