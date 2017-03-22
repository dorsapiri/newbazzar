package com.newbaz.dao;


import com.newbaz.model.Category;

import java.util.List;

/**
 * Created by dorsa on 2/16/17.
 */
public interface CategoryDao {

    List<Category> findAllCategory();
    void insertCategory(Category category);
    List<Category> findByParent(Integer parentId);
    void delete(Category category);
}
