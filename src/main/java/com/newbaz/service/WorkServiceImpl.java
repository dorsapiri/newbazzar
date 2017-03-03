package com.newbaz.service;

import com.newbaz.dao.WorkDao;
import com.newbaz.model.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 3/3/17.
 */
@Service("workService")
@Transactional
public class WorkServiceImpl extends StuffServiceImpl<Work> implements WorkService {

    @Autowired
    private WorkDao dao;

    public void insert(Work work, Integer stuffId) {
        dao.insert(work,stuffId);
    }


    public Work findByStuffId(Integer stuffId) {
        return null;
    }

    public void delete(Work work) {

    }
}
