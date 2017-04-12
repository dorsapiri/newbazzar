package com.newbaz.dao;

import com.newbaz.model.FileBucket;
import com.newbaz.model.Stuff;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by dorsa on 3/2/17.
 */
//@Repository("stuffDao")
public class StuffDaoImpl<P extends Serializable,T> extends AbstractDao<Integer,T> implements StuffDao<P,T> {


    private Class<T> persistenceClass;
    /*@PersistenceContext
    protected EntityManager entityManager;*/
    public StuffDaoImpl(final Class<T> persistenceClass){
        this.persistenceClass = persistenceClass;
    }

    /*public final EntityManager getEntityManager() {
        return entityManager;
    }*/

    /*public final void setEntityManager(EntityManager entityManager){
        this.entityManager = entityManager;
    }*/
    /*@Autowired
    private SessionFactory sessionFactory;*/

    /*@PersistenceContext
    protected EntityManager em;*/

    private Class<T> type;

    public StuffDaoImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        type = (Class) pt.getActualTypeArguments()[0];

    }

    @Override
    public void insertS(T stuff) {
        persist(stuff);

    }

    @Override
    public void deleteS(T stuff){

    }

    @SuppressWarnings("unchecked")
    public Stuff findById(Integer stuffId) {

        Stuff stuff = (Stuff) getByKey(stuffId);
        return stuff;
    }
}
