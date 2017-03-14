package com.newbaz.dao;

import com.newbaz.model.Stuff;
import com.newbaz.model.Work;

import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
public interface WorkDao extends StuffDao<Integer,Work>{
    void insertW(Work work,Integer stuffId);
    List<Stuff> findAll();
    void deleteW(Work work);
}
