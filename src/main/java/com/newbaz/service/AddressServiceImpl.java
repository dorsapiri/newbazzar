package com.newbaz.service;

import com.newbaz.dao.AddressDao;
import com.newbaz.model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by dorsa on 4/22/17.
 */
@Service
@Transactional
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressDao addressDao;

    @Override
    public List<Address> findAllAddress() {
        return addressDao.findAllAddress();
    }

    @Override
    public void insertAddress(Address address) {
        addressDao.insertAddress(address);
    }

    @Override
    public List<Address> findByParent(Integer parentId) {
        return addressDao.findByParent(parentId);
    }

    @Override
    public Address findById(Integer id) {
        return addressDao.findById(id);
    }

    @Override
    public void delete(Address address) {
        addressDao.deleteAddress(address);
    }

    @Override
    public void updateAddress(Address address) {

    }

    @Override
    public List<Address> findByState(String state) {
        return addressDao.findByState(state);
    }
}
