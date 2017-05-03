package com.newbaz.dao;

import com.newbaz.model.UserInfo;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 4/30/17.
 */
@Repository("userInfoDao")
public class UserInfoDaoImpl extends AbstractDao<Integer,UserInfo> implements UserInfoDao {
    @Override
    public void insertUserInfo(UserInfo userInfo) {
        persist(userInfo);
    }
}
