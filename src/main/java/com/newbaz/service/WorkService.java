package com.newbaz.service;

import com.newbaz.model.Work;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 3/3/17.
 */
public interface WorkService {
    void insertW(Work work, Integer stuffId);
    Work findByStuffId(Integer stuffId);
    void deleteW(Work work);
}
