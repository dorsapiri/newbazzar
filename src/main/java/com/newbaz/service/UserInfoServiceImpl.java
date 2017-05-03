package com.newbaz.service;

import com.newbaz.dao.UserInfoDao;
import com.newbaz.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 4/30/17.
 */
@Service("userInfoService")
@Transactional
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    public UserInfoDao userInfoDao;
    @Override
    public void insertUserInfo(UserInfo userInfo) {
        userInfoDao.insertUserInfo(userInfo);
    }
}
