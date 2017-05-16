package com.newbaz.service;

import com.newbaz.dao.UnitDao;
import com.newbaz.model.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 5/15/17.
 */
@Service("unitService")
@Transactional
public class UnitServiceImpl implements UnitService {

    @Autowired
    private UnitDao unitDao;
    @Override
    public void insertUnit(Unit unit) {
        unitDao.insertUnit(unit);
    }

    @Override
    public void deleteUnit(Unit unit) {
        unitDao.deleteUnit(unit);
    }

    @Override
    public Unit findByUnitId(Integer unitId) {
        return unitDao.findByUnitId(unitId);
    }

    @Override
    public void updateUnit(Unit unit) {
        Unit entity = unitDao.findByUnitId(unit.getId());
        if (entity!=null){
            entity.setUnitName(unit.getUnitName());
        }
    }

    @Override
    public List<Unit> findAll() {
        return unitDao.findAll();
    }
}
