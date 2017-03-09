package com.newbaz.service;

import com.newbaz.dao.StuffDao;
import com.newbaz.model.Stuff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by dorsa on 3/4/17.
 */
@Service("stuffService")
@Transactional
public class StuffServiceImpl<P extends Serializable,T> implements StuffService<P,T> {

    @Autowired
    private StuffDao<P,T> dao;

    public void insertS(T stuff) {
        dao.insertS(stuff);
    }

    @Override
    public void deleteS(T t) {

    }

    @Override
    public List<T> findByDiscriminator(char discriminator) {
        return null;
    }
}
