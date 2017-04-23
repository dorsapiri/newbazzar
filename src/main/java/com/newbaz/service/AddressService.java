package com.newbaz.service;

import com.newbaz.model.Address;

import java.util.List;

/**
 * Created by dorsa on 4/22/17.
 */
public interface AddressService {
    List<Address> findAllAddress();
    void insertAddress(Address address);
    List<Address> findByParent(Integer parentId);
    Address findById(Integer id);
    void delete(Address address);
    void updateAddress(Address address);
}
