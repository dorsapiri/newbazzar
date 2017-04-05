package com.newbaz.service;



import com.newbaz.model.UserProfile;

import java.util.List;

/**
 * Created by dorsa on 1/11/17.
 */
public interface UserProfileService {
    UserProfile findById(int id);

    UserProfile findByType(String type);

    List<UserProfile> findAll();
}
