package com.newbaz.dao;

import com.newbaz.model.Stuff;

import java.io.Serializable;
import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
public interface StuffDao<P extends Serializable,T> {
    void insertS(T t);

    void deleteS(T t);

    List<T> findByDiscriminator(char discriminator);
}
