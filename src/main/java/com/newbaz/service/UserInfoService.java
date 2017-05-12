package com.newbaz.service;

import com.newbaz.dao.UserInfoDao;
import com.newbaz.model.User;
import com.newbaz.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by dorsa on 4/30/17.
 */
public interface UserInfoService {

    void insertUserInfo(UserInfo userInfo);
    UserInfo findBySsoId(User owner);
}
