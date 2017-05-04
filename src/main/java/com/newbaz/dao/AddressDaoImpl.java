package com.newbaz.dao;

import com.newbaz.model.Address;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 4/22/17.
 */
@Repository("addressDao")
public class AddressDaoImpl extends AbstractDao<Integer,Address> implements AddressDao {
    @Override
    public List<Address> findAllAddress() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("parentId"));
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        List<Address> addresses = (List<Address>) criteria.list();
        return addresses;
    }

    @Override
    public void insertAddress(Address address) {
        persist(address);
    }

    @Override
    public List<Address> findByParent(Integer parentId) {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("state"));
        criteria.add(Restrictions.eq("parentId",parentId));
        List<Address> addresses = (List<Address>) criteria.list();
        return addresses;
    }

    @Override
    public Address findById(Integer id) {
        return null;
    }

    @Override
    public void deleteAddress(Address address) {
        delete(address);
    }
}
