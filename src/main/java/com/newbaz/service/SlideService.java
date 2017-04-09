package com.newbaz.service;

import com.newbaz.model.FileBucket;
import com.newbaz.model.Slide;

/**
 * Created by dorsa on 4/8/17.
 */
public interface SlideService {
    void insertSlide(Slide slide, FileBucket fileBucket);
    Slide findSlideById(Integer id);
    void deleteSlide(Slide slide);
}
