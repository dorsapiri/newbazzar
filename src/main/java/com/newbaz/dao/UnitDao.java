package com.newbaz.dao;

import com.newbaz.model.Unit;

import java.util.List;

/**
 * Created by dorsa on 5/15/17.
 */
public interface UnitDao {
    void insertUnit(Unit unit);
    void deleteUnit(Unit unit);
    Unit findByUnitId(Integer unitId);
    List<Unit> findAll();
}
