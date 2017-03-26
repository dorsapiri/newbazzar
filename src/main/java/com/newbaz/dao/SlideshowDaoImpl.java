package com.newbaz.dao;

import com.newbaz.model.Slideshow;

import org.springframework.stereotype.Repository;


/**
 * Created by dorsa on 3/26/17.
 */
@Repository("slideshowDao")
public class SlideshowDaoImpl extends AbstractDao<Integer, Slideshow> implements SlideshowDao{

    @Override
    public void insertImage(Slideshow slideshow) {
        persist(slideshow);
    }

    @Override
    public Slideshow findById() {
        return null;
    }

    @Override
    public void deleteImage(Slideshow slideshow) {
        delete(slideshow);
    }
}
