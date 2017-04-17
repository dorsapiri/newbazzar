package com.newbaz.dao;

import com.newbaz.model.Stuff;
import com.newbaz.model.User;
import com.newbaz.model.Work;

import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
public interface WorkDao extends StuffDao<Integer,Work>{
    void insertW(Work work,Integer stuffId);
    List<Work> findAll();
    void deleteW(Work work);
    List<Work> searchWork(String string);
    List<Work> findByOwner(User owner);
}
