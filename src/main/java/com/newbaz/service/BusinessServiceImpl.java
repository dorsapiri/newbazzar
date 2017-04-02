package com.newbaz.service;

import com.newbaz.dao.BusinessDao;
import com.newbaz.model.Business;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 4/1/17.
 */
@Service("businessService")
@Transactional
public class BusinessServiceImpl implements BusinessService {

    @Autowired
    private BusinessDao businessDao;

    @Override
    public void insert(Business business) {
        businessDao.insert(business);
    }

    @Override
    public void delete(Business business) {

    }

    @Override
    public void update(Business business) {

    }

    @Override
    public Business findByUserId(Integer id) {
        return null;
    }
}
