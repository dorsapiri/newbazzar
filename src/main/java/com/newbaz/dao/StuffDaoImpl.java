package com.newbaz.dao;

import com.newbaz.model.Stuff;
import org.springframework.stereotype.Repository;
import org.springframework.ui.context.Theme;

import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
@Repository("stuffDao")
public class StuffDaoImpl<T> extends AbstractDao<Integer,T> implements StuffDao<T> {

    @Override
    public void insert(T stuff) {
        persist(stuff);
    }

    @Override
    public void delete(T stuff){

    }

    @Override
    public List<T> findByDiscriminator(char discriminator) {
        return null;
    }
}
