package com.newbaz.dao;

import com.newbaz.model.Work;

/**
 * Created by dorsa on 3/2/17.
 */
public interface WorkDao extends StuffDao<Work>{
    void insert(Work work,Integer stuffId);
    Work findByStuffId(Integer stuffId);
    void delete(Work work);
}
