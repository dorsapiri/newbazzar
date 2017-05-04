package com.newbaz.service;

import com.newbaz.dao.CategoryDao;
import com.newbaz.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 2/17/17.
 */
@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    public CategoryDao dao;
    @Override
    public List<Category> findAllCategory() {
        return dao.findAllCategory();
    }

    @Override
    public void insertCategory(Category category) {
        dao.insertCategory(category);
    }

    @Override
    public List<Category> findByParent(Integer parentId) {
        return dao.findByParent(parentId);
    }

    @Override
    public Category findById(Integer id) {
        return dao.findById(id);
    }

    @Override
    public void delete(Category category) {
        dao.deleteCat(category);
    }

    @Override
    public void updateCat(Category category) {
        Category entity = dao.findById(category.getId());
        if (entity!=null){
            entity.setCategoryName(category.getCategoryName());
            entity.setParentId(category.getParentId());
            entity.setCategoryLink(category.getCategoryLink());
            entity.setSortOrder(category.getSortOrder());
        }
    }

    @Override
    public Category findByLink(String catLink) {
        return dao.findByLink(catLink);
    }

    @Override
    public Category findByName(String catName) {
        return dao.findByName(catName);
    }

    @Override
    public List<Category> searchCat(String searchString) {
        String[] catStrs= searchString.split(" ");
        List<Category> categories = findAllCategory();
        List<Category> searchResult= new ArrayList<Category>();
        for (Category category:categories){
            for (String str:catStrs){
                if (category.getCategoryName().contains(str) && !searchResult.contains(category) && !str.equals("")){
                    searchResult.add(category);
                }
            }

        }
        return searchResult;
    }
}
