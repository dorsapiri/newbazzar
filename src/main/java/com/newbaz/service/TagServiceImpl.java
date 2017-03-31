package com.newbaz.service;

import com.newbaz.dao.TagDao;
import com.newbaz.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 3/30/17.
 */
@Service
@Transactional
public class TagServiceImpl implements TagService {
    @Autowired
    public TagDao tagdao;

    @Override
    public void insert(Tag tag) {
        tagdao.insert(tag);
    }

    @Override
    public Tag findByName(String name) {
        return tagdao.findByName(name);
    }
}
