package com.newbaz.dao;

import com.newbaz.model.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 3/2/17.
 */
@Repository("workDao")
public class WorkDaoImpl extends StuffDaoImpl<Work> implements WorkDao {

    @Override
    public void insert(Work work,Integer stuffId) {
        work.setStuffId(stuffId);
        persist(work);
    }

    @Override
    public void delete(Work work){

    }

    @Override
    public Work findByStuffId(Integer stuffId) {
        return null;
    }
}
