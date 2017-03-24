package com.newbaz.service;


import com.newbaz.model.Category;

import java.util.List;

/**
 * Created by dorsa on 2/17/17.
 */
public interface CategoryService {

    List<Category> findAllCategory();
    void insertCategory(Category category);
    List<Category> findByParent(Integer parentId);
    Category findById(Integer id);
    void delete(Category category);
}
