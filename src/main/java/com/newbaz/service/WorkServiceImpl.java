package com.newbaz.service;

import com.newbaz.dao.CategoryDao;
import com.newbaz.dao.FileBucketDao;
import com.newbaz.dao.WorkDao;
import com.newbaz.model.Category;
import com.newbaz.model.FileBucket;
import com.newbaz.model.Stuff;
import com.newbaz.model.Work;
import org.hibernate.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 3/3/17.
 */
@Service("workService")
@Transactional
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkDao daow;
    @Autowired
    private FileBucketDao fileBucketDao;

    @Autowired
    private CategoryDao categoryDao;

    public void insertW(Work work, Integer stuffId) {
        daow.insertW(work,stuffId);
        for (FileBucket fileBucket:work.getImages()){
            fileBucketDao.insertFile(fileBucket);
        }
    }

    public List<Work> findAll() {
        return daow.findAll();
    }

    public void deleteW(Work work) {

    }

    @Override
    public List<Work> searchWork(String string) {
        return daow.searchWork(string);
    }

    @Override
    public List<Work> findWorkByCat(Category category) {
        List<Work> works = findAll();
        List<Work> result= new ArrayList<>();
        for (Work work: works) {
            for(Category ca:work.getCategories()){
                if (ca==category){
                    result.add(work);
                }
            }
        }
        return result;
    }

}
