package com.newbaz.dao;

import com.newbaz.model.Stuff;
import com.newbaz.model.Work;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
@Repository("workDao")
public class WorkDaoImpl extends StuffDaoImpl<Integer,Work> implements WorkDao {


    /*public WorkDaoImpl(){
        super(Work.class);
    }*/

    static final Logger logger = LoggerFactory.getLogger(WorkDaoImpl.class);
    /*@Autowired
    private SessionFactory sessionFactory;*/

    @Override
    public void insertW(Work work,Integer stuffId) {
//        work.setStuffId(stuffId);
        insertS(work);
        persist(work);
    }

    @Override
    public void deleteW(Work work){

    }

    @Override
    public List<Work> findAll() {
        List<Stuff> result = new ArrayList<Stuff>();
        Criteria criteria = createEntityCriteria();
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Work> works = (List<Work>) criteria.list();
        for (Work work:works){
//            result.add(findById(work.getStuffId()));
        }
        return works;
    }
}
