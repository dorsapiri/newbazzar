package com.newbaz.service;

import com.newbaz.dao.TagDao;
import com.newbaz.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by dorsa on 3/30/17.
 */
public interface TagService {
    void insert(Tag tag);
    Tag findByName(String name);
}
