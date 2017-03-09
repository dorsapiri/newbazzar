package com.newbaz.service;

import com.newbaz.model.Stuff;

import java.io.Serializable;
import java.util.List;

/**
 * Created by dorsa on 3/4/17.
 */
public interface StuffService<P extends Serializable,T> {
    void insertS(T t);

    void deleteS(T t);

    List<T> findByDiscriminator(char discriminator);
}
