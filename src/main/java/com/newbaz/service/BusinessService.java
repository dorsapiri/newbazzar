package com.newbaz.service;

import com.newbaz.model.Business;

/**
 * Created by dorsa on 4/1/17.
 */
public interface BusinessService {
    void insert(Business business);
    void delete(Business business);
    void update(Business business);
    Business findByUserId(Integer id);
}
