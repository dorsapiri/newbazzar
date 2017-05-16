package com.newbaz.service;

import com.newbaz.model.Unit;

import java.util.List;

/**
 * Created by dorsa on 5/15/17.
 */
public interface UnitService {
    void insertUnit(Unit unit);
    void deleteUnit(Unit unit);
    Unit findByUnitId(Integer unitId);
    void updateUnit(Unit unit);
    List<Unit> findAll();
}
