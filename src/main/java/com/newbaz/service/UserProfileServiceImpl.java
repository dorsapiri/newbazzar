package com.newbaz.service;


import com.newbaz.dao.UserProfileDao;
import com.newbaz.model.UserProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 1/11/17.
 */
@Service("userProfileService")
@Transactional
public class UserProfileServiceImpl implements UserProfileService {
    @Autowired
    UserProfileDao dao;

    public UserProfile findById(int id) {
        return dao.findById(id);
    }

    public UserProfile findByType(String type){
        return dao.findByType(type);
    }

    public List<UserProfile> findAll() {
        return dao.findAll();
    }
}
