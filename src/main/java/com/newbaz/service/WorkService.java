package com.newbaz.service;

import com.newbaz.model.Work;

/**
 * Created by dorsa on 3/3/17.
 */
public interface WorkService extends StuffService<Work> {
    void insert(Work work, Integer stuffId);
    Work findByStuffId(Integer stuffId);
    void delete(Work work);
}
