package com.newbaz.service;

import com.newbaz.dao.FileBucketDao;
import com.newbaz.dao.SlideDao;
import com.newbaz.model.FileBucket;
import com.newbaz.model.Slide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dorsa on 4/8/17.
 */
@Service
@Transactional
public class SlideServiceImpl implements SlideService {

    @Autowired
    private SlideDao sDao;

    @Autowired
    private FileBucketDao fileBucketDao;

    @Override
    public void insertSlide(Slide slide, FileBucket fileBucket) {
        fileBucketDao.insertFile(fileBucket);
        sDao.insertSlide(slide);
    }

    @Override
    public Slide findSlideById(Integer id) {
        return null;
    }

    @Override
    public void deleteSlide(Slide slide) {

    }
}
