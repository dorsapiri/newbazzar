package com.newbaz.dao;


import com.newbaz.model.UploadFile;

import java.util.List;

/**
 * Created by dorsa on 1/29/17.
 */
public interface FileUploadDao {
    void save(UploadFile uploadFile);
    List<UploadFile> findAll();
}
