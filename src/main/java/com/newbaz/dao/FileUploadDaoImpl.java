package com.newbaz.dao;

import com.newbaz.model.UploadFile;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 1/29/17.
 */
@Repository("uploadFileDao")
public class FileUploadDaoImpl extends AbstractDao<Long,UploadFile> implements FileUploadDao {
    static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    @Autowired
    private SessionFactory sessionFactory;

    public FileUploadDaoImpl() {
    }

    public FileUploadDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void save(UploadFile uploadFile) {
        sessionFactory.getCurrentSession().save(uploadFile);
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<UploadFile> findAll() {
//        Criteria criteria = createEntityCriteria().addOrder(Order.asc("fileName"));
//        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//        List<UploadFile> ufs = (List<UploadFile>)criteria.list();
        List<UploadFile> ufs = (List<UploadFile>) sessionFactory.getCurrentSession().createCriteria(UploadFile.class).list();
        for (UploadFile uf:ufs){
            Hibernate.initialize(uf.getData());
        }
        return ufs;
//        return sessionFactory.getCurrentSession().createCriteria(UploadFile.class).list();
    }
}
