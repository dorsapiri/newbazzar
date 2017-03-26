package com.newbaz.service;

import com.newbaz.dao.SlideshowDao;
import com.newbaz.model.Slideshow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 3/26/17.
 */
@Service("slideshowService")
@Transactional
public class SlideshowServiceImpl implements SlideshowService {

    @Autowired
    private SlideshowDao sDao;
    @Override
    public void insertImage(Slideshow slideshow) {
        sDao.insertImage(slideshow);
    }

    @Override
    public Slideshow findById() {
        return null;
    }

    @Override
    public void deleteImage(Slideshow slideshow) {
        sDao.deleteImage(slideshow);
    }
}
