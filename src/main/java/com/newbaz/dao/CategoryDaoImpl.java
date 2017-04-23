package com.newbaz.dao;

import com.newbaz.model.Category;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 2/16/17.
 */
@Repository("categoryDao")
public class CategoryDaoImpl extends AbstractDao<Integer,Category> implements CategoryDao {
    @Override
    public List<Category> findAllCategory() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("parentId"));
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Category> categories = (List<Category>) criteria.list();
        return categories;
    }

    @Override
    public void insertCategory(Category category) {
        persist(category);
    }

    @Override
    public List<Category> findByParent(Integer parentId) {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("sortOrder"));
        criteria.add(Restrictions.eq("parentId",parentId));
        List<Category> categories = (List<Category>) criteria.list();
        return categories;
    }

    @Override
    public Category findById(Integer id) {
        Category category = getByKey(id);
        return category;
    }

    @Override
    public void deleteCat(Category category) {
        delete(category);
    }

    @Override
    public Category findByName(String catName) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("categoryName", catName));
        Category category = (Category) crit.uniqueResult();

        return category;
    }

}
