package com.newbaz.service;

import com.newbaz.dao.WorkDao;
import com.newbaz.model.Stuff;
import com.newbaz.model.User;
import com.newbaz.model.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 3/3/17.
 */
@Service("workService")
@Transactional
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkDao daow;


    public void insertW(Work work, Integer stuffId) {
        daow.insertW(work,stuffId);
    }

    public List<Work> findAll() {
        return daow.findAll();
    }

    public void deleteW(Work work) {

    }

    @Override
    public List<Work> findByOwner(User owner) {
        return daow.findByOwner(owner);
    }
}
