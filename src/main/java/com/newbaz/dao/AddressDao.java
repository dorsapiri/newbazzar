package com.newbaz.dao;

import com.newbaz.model.Address;

import java.util.List;

/**
 * Created by dorsa on 4/22/17.
 */
public interface AddressDao {
    List<Address> findAllAddress();
    void insertAddress(Address address);
    List<Address> findByParent(Integer parentId);
    Address findById(Integer id);
    void deleteAddress(Address address);
}
