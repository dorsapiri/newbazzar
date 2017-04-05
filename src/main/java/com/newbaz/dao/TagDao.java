package com.newbaz.dao;

import com.newbaz.model.Tag;

/**
 * Created by dorsa on 3/30/17.
 */
public interface TagDao {
    void insert(Tag tag);
    Tag findByName(String name);
}
