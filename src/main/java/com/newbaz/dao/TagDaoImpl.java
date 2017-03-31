package com.newbaz.dao;

import com.newbaz.model.Tag;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 3/30/17.
 */
@Repository("tagDao")
public class TagDaoImpl extends AbstractDao<Integer,Tag> implements TagDao {
    @Override
    public void insert(Tag tag) {
        persist(tag);
    }

    @Override
    public Tag findByName(String name) {
        return null;
    }
}
