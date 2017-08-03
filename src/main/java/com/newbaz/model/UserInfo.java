package com.newbaz.model;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * Created by dorsa on 4/20/17.
 */
@Entity
@Table(name = "USER_INFO")
public class UserInfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinTable(name = "USER_INFO_USER",
            joinColumns = { @JoinColumn(name = "INFO_ID") },
            inverseJoinColumns = { @JoinColumn(name = "USER_ID") })
    private User user;

    @NotEmpty
    @Column(name = "FIRST_NAME")
    private String name;

    @Column(name = "FAMILYNAME")
    private String family;

    @Column(name = "GENDER")
    private String gender;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "USER_CATEGORY",
            joinColumns = { @JoinColumn(name = "UINFO_ID") },
            inverseJoinColumns = { @JoinColumn(name = "CATEGORY_ID") })
    private Set<Category> categories;

    @Column(name = "BUSINESS_TYPE")
    private String businessType;

    @Column(name = "BUSINESS_NAME")
    private String businessName;

    @Column(name = "BRAND_NAME")
    private String brandName;

    /*@OneToOne(cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
    @JoinTable(name = "USER_ADDRESS",
            joinColumns = { @JoinColumn(name = "UINFO_ID") },
            inverseJoinColumns = { @JoinColumn(name = "ADDRESS_ID") })*/
    @OneToOne(cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
    private Address address;

    @Column(name = "ADDRESS_DETAIL")
    private String addressDetail;

    @Column(name = "COVERED_AREAS")
    private String coveredAreas;

    @Column(name = "EST_YEAR")
    private String establishedYear;

    @Column(name = "STAFF_NUMBER")
    private Integer staffNumber;

    @Column(name = "STOCK")
    private Integer stock;

    @Column(name = "TOTAL_REVENUE")
    private double totalRevenue;

    @Column(name = "CONTACT_NAME")
    private String contactName;

    @Column(name = "CONTACT_PHONE")
    private String contactPhone;

    @Column(name = "CONTACT_MOBIL")
    private String contactMobil;

    @Column(name = "CONTACT_FAX")
    private String contactFax;

    @Column(name = "CONTACT_EMAIL")
    private String contactEmail;

    @Column(name = "CONTACT_WEBSITE")
    private String contactWebsite;

    @Column(name = "CONTACT_SOCIAL")
    private String contactSocial;

    @Column(name = "TRANS_METHOD")
    private String transmissionMethod;

    @Column(name = "FIRSTNAME")
    private String paymentMethod;

    @Column(name = "DELIVERY_PLACE")
    private String deliveryPlace;

    @Column(name = "KEYWORDS")
    private String keywords;

    @Column(name = "BUSINESS_INFO")
    private String businessInfo;

    @Column(name = "REFERENCE_NUMBER")
    private String referenceNumber;

    @Column(name = "H_TO_FAMILIARITY")
    private String howToFamiliarity;

    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinTable(name = "USER_IMG",joinColumns = {@JoinColumn(name = "UINFO_ID")},inverseJoinColumns = {@JoinColumn(name = "FILE_ID")})
    private FileBucket images;

    @Transient
    private MultipartFile files;

    @Transient
    private String[] categoryItem;

    @Transient
    private String[] addressItem;

    @Transient
    private String userInfoType;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public String getCoveredAreas() {
        return coveredAreas;
    }

    public void setCoveredAreas(String coveredAreas) {
        this.coveredAreas = coveredAreas;
    }

    public String getEstablishedYear() {
        return establishedYear;
    }

    public void setEstablishedYear(String establishedYear) {
        this.establishedYear = establishedYear;
    }

    public Integer getStaffNumber() {
        return staffNumber;
    }

    public void setStaffNumber(Integer staffNumber) {
        this.staffNumber = staffNumber;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getContactMobil() {
        return contactMobil;
    }

    public void setContactMobil(String contactMobil) {
        this.contactMobil = contactMobil;
    }

    public String getContactFax() {
        return contactFax;
    }

    public void setContactFax(String contactFax) {
        this.contactFax = contactFax;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactWebsite() {
        return contactWebsite;
    }

    public void setContactWebsite(String contactWebsite) {
        this.contactWebsite = contactWebsite;
    }

    public String getContactSocial() {
        return contactSocial;
    }

    public void setContactSocial(String contactSocial) {
        this.contactSocial = contactSocial;
    }

    public String getTransmissionMethod() {
        return transmissionMethod;
    }

    public void setTransmissionMethod(String transmissionMethod) {
        this.transmissionMethod = transmissionMethod;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getDeliveryPlace() {
        return deliveryPlace;
    }

    public void setDeliveryPlace(String deliveryPlace) {
        this.deliveryPlace = deliveryPlace;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getBusinessInfo() {
        return businessInfo;
    }

    public void setBusinessInfo(String businessInfo) {
        this.businessInfo = businessInfo;
    }

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public String getHowToFamiliarity() {
        return howToFamiliarity;
    }

    public void setHowToFamiliarity(String howToFamiliarity) {
        this.howToFamiliarity = howToFamiliarity;
    }

    public FileBucket getImages() {
        return images;
    }

    public void setImages(FileBucket images) {
        this.images = images;
    }

    public MultipartFile getFiles() {
        return files;
    }

    public void setFiles(MultipartFile files) {
        this.files = files;
    }

    public String[] getCategoryItem() {
        return categoryItem;
    }

    public void setCategoryItem(String[] categoryItem) {
        this.categoryItem = categoryItem;
    }

    public String[] getAddressItem() {
        return addressItem;
    }

    public void setAddressItem(String[] addressItem) {
        this.addressItem = addressItem;
    }

    public String getUserInfoType() {
        return userInfoType;
    }

    public void setUserInfoType(String userInfoType) {
        this.userInfoType = userInfoType;
    }
}
