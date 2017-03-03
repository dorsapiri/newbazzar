package com.newbaz.dao;

import com.newbaz.model.Stuff;

import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
public interface StuffDao<T> {
    void insert(T t);

    void delete(T t);

    List<T> findByDiscriminator(char discriminator);
}
