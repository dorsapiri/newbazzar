package com.newbaz.dao;

import com.newbaz.model.Slide;

import java.util.List;

/**
 * Created by dorsa on 4/8/17.
 */
public interface SlideDao {

    void insertSlide(Slide slide);
    Slide findSlideById(Integer id);
    List<Slide> findAllSlides();
    void deleteSlide(Slide slide);
}
