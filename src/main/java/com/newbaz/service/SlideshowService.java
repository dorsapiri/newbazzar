package com.newbaz.service;

import com.newbaz.model.Slideshow;

/**
 * Created by dorsa on 3/26/17.
 */
public interface SlideshowService {
    void insertImage(Slideshow slideshow);
    Slideshow findById();
    void deleteImage(Slideshow slideshow);
}
