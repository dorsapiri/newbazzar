package com.newbaz.dao;

import com.newbaz.model.Stuff;
import com.newbaz.model.User;
import com.newbaz.model.Work;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
        insertS(work);
        persist(work);
    }

    @Override
    public void deleteW(Work work){

    }

    @Override
    public List<Work> searchWork(String string) {
        Criteria criteria = createEntityCriteria().addOrder(Order.desc("createDate"));
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Work> works = (List<Work>) criteria.list();
        List<Work> result = new ArrayList<Work>();
        String[] strArray=string.split(" ");
        for (String str: strArray){
            for (Work work:works){
                if (work.getName().contains(str) || work.getState().contains(str) || work.getProfession().contains(str)){
                    if ( !result.contains(work) && !str.equals("")){
                        result.add(work);
                        Hibernate.initialize(work.getOwner().getSsoId());
                    }
                }
            }
        }

        return result;
    }

    @Override
    public List<Work> findByOwner(User owner) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("owner",owner));
        List<Work> works = (List<Work>) criteria.list();
        if (works!=null){
            for (Work work: works){
                Hibernate.initialize(work.getOwner().getSsoId());
            }
        }
        return works;
    }

    @Override
    public Work findByWorkId(Integer wId) {
        Work work= (Work) getByKey(wId);
        return work;
    }

    @Override
    public List<Work> findAll() {
        List<Stuff> result = new ArrayList<Stuff>();
        Criteria criteria = createEntityCriteria();
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Work> works = (List<Work>) criteria.list();
        for (Work work:works){
            Hibernate.initialize(work.getImages());
        }
        return works;
    }
}
