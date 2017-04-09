package com.newbaz.dao;

import com.newbaz.model.Slide;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public List<Slide> findAllSlides() {
        Criteria criteria =createEntityCriteria().addOrder(Order.asc("id"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List<Slide> slides = (List<Slide>) criteria.list();
        for (Slide s:slides){
            Hibernate.initialize(s.getSlideImage());
        }
        return slides;
    }

    @Override
    public void deleteSlide(Slide slide) {
        delete(slide);
    }
}
