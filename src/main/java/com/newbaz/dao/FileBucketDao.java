package com.newbaz.dao;

import com.newbaz.model.FileBucket;

/**
 * Created by dorsa on 4/8/17.
 */
public interface FileBucketDao {
    void insertFile(FileBucket fileBucket);
    void deleteFile(FileBucket fileBucket);
    FileBucket findFileById(Integer id);
}
