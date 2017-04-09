package com.newbaz.dao;

import com.newbaz.model.Slide;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 4/8/17.
 */
@Repository("slideDao")
public class SlideDaoImpl extends AbstractDao<Integer,Slide> implements SlideDao {
    @Override
    public void insertSlide(Slide slide) {
        persist(slide);
    }

    @Override
    public Slide findSlideById(Integer id) {
        return null;
    }

    @Override
    public void deleteSlide(Slide slide) {
        delete(slide);
    }
}
