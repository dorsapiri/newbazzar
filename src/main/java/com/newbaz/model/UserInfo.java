package com.newbaz.model;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.List;

/**
 * Created by dorsa on 4/20/17.
 */
public class UserInfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;

    private String name;
    private String family;
    private List<Category> categories;
    private String businessType;
    private String businessName;
    private String brandName;
    private String address;
    private String establishedYear;
    private Integer staffNumber;
    private Integer stock;
    private double totalRevenue;
    private String contactName;
    private String contactPhone;
    private String contactMobil;
    private String contactFax;
    private String contactEmail;
    private String contactWebsite;
    private String contactSocial;
    private String transmissionMethod;
    private String paymentMethod;
    private String deliveryPlace;
    private String keywords;
    private String businessInfo;
    private String howToFamiliarity;
}
