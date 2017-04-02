package com.newbaz.service;

import com.newbaz.model.Stuff;
import com.newbaz.model.User;
import com.newbaz.model.Work;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 3/3/17.
 */
public interface WorkService{
    void insertW(Work work, Integer stuffId);
    List<Work> findAll();
    void deleteW(Work work);
    List<Work> findByOwner(User owner);
}
