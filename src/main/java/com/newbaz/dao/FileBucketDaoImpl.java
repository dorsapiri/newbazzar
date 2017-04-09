package com.newbaz.dao;

import com.newbaz.model.FileBucket;
import org.springframework.stereotype.Repository;

/**
 * Created by dorsa on 4/8/17.
 */
@Repository("fileBucketDao")
public class FileBucketDaoImpl extends AbstractDao<Integer,FileBucket> implements FileBucketDao{
    @Override
    public void insertFile(FileBucket fileBucket) {
        persist(fileBucket);
    }

    @Override
    public void deleteFile(FileBucket fileBucket) {
        delete(fileBucket);
    }

    @Override
    public FileBucket findFileById(Integer id) {
        return null;
    }
}
