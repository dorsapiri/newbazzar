package com.newbaz.dao;

import com.newbaz.model.Unit;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 5/15/17.
 */
@Repository("unitDao")
public class UnitDaoImpl extends AbstractDao<Integer,Unit> implements UnitDao {
    @Override
    public void insertUnit(Unit unit) {
        persist(unit);
    }

    @Override
    public void deleteUnit(Unit unit) {
        delete(unit);
    }

    @Override
    public Unit findByUnitId(Integer unitId) {
        Unit unit = getByKey(unitId);
        return unit;
    }

    @Override
    public List<Unit> findAll() {
        Criteria criteria = createEntityCriteria();
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List<Unit> units = (List<Unit>) criteria.list();
        return units;
    }
}
