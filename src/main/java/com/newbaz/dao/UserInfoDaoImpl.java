package com.newbaz.dao;

import com.newbaz.model.User;
import com.newbaz.model.UserInfo;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 4/30/17.
 */
@Repository("userInfoDao")
public class UserInfoDaoImpl extends AbstractDao<Integer,UserInfo> implements UserInfoDao {
    @Override
    public void insertUserInfo(UserInfo userInfo) {
        persist(userInfo);
    }

    @Override
    public UserInfo findBySsoId(User owner) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("user", owner));
        UserInfo userInfo = (UserInfo) crit.uniqueResult();
        if (userInfo!=null){
            Hibernate.initialize(userInfo.getCategories());
        }
        return userInfo;
    }

    @Override
    public void deleteUserInfo(User owner) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("user",owner));
        UserInfo userInfo = (UserInfo) criteria.uniqueResult();
        delete(userInfo);
    }
}
