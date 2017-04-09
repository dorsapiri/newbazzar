package com.newbaz.dao;

import com.newbaz.model.Slide;

/**
 * Created by dorsa on 4/8/17.
 */
public interface SlideDao {

    void insertSlide(Slide slide);
    Slide findSlideById(Integer id);
    void deleteSlide(Slide slide);
}
