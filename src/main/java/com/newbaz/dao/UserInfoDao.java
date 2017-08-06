package com.newbaz.dao;

import com.newbaz.model.User;
import com.newbaz.model.UserInfo;

/**
 * Created by dorsa on 4/30/17.
 */
public interface UserInfoDao {
    void insertUserInfo(UserInfo userInfo);
    UserInfo findBySsoId(User owner);
    void deleteUserInfo(User owner);

}
