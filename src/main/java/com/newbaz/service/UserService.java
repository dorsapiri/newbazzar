package com.newbaz.service;



import com.newbaz.model.User;

import java.util.List;

/**
 * Created by dorsa on 1/11/17.
 */
public interface UserService {
    User findById(int id);

    User findBySSO(String sso);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserBySSO(String sso);

    List<User> findAllUsers();

    boolean isUserSSOUnique(Integer id, String sso);
}
