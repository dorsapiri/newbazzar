package com.newbaz.service;

import java.util.List;

/**
 * Created by dorsa on 3/3/17.
 */
public interface StuffService<T> {
    void insert(T t);

    void delete(T t);

    List<T> findByDiscriminator(char discriminator);
}
