package com.newbaz.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by dorsa on 3/2/17.
 */
@Entity
@Table(name = "PRODUCT")
public class Product extends Stuff {

    /*@NotEmpty
    @Column(name = "STUFF_ID")
    private Integer stuffId;*/

    @Column(name = "SKU")
    private String sku;

    @Column(name = "MADE_IN")
    private String madeIn;

    /*@Column(name = "MODEL_NAME")
    private String modelName;

    @Column(name = "MATERIAL")
    private String material;

    @Column(name = "BRAND_NAME")
    private String brandName;

    @Column(name = "PERFORMANCE")
    private String performance;

    @Column(name = "QUANTITY_DEGREE")
    private String quantityDegree;

    @Column(name = "COLOR")
    private String color;

    @Column(name = "FEATURES")
    private String features;

    @Column(name = "SIZE")
    private String size;

    @Column(name = "MIN_ORDER")
    private int minOrder;

    @Column(name = "MAX_ORDER")
    private int maxOrder;

    @Column(name = "NEMBER_INYEAR")
    private String numberInYear;

    @Column(name = "UNIT")
    private String unit;

    @Column(name = "USECASE")
    private String useCase;

    @Column(name = "STOCK")
    private String stock;

    @Column(name = "COMPANY_PRODUCER")
    private String companyProducer;

    @Column(name = "STANDARDS")
    private String standards;

    @Column(name = "PRODUCT_ABILITY")
    private String productAbility;

    @Column(name = "SPECIAL_FEATURE")
    private String specialFeatures;

    @Column(name = "MANUFACTURE_TECNOLOGY")
    private String manufactureTechnology;

    @Column(name = "SALES_AMOUNT")
    private String salesAmount;
*/
//    public Integer getStuffId() {
//        return stuffId;
//    }

//    public void setStuffId(Integer stuffId) {
//        this.stuffId = stuffId;
//    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    /*public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getPerformance() {
        return performance;
    }

    public void setPerformance(String performance) {
        this.performance = performance;
    }

    public String getQuantityDegree() {
        return quantityDegree;
    }

    public void setQuantityDegree(String quantityDegree) {
        this.quantityDegree = quantityDegree;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getMinOrder() {
        return minOrder;
    }

    public void setMinOrder(int minOrder) {
        this.minOrder = minOrder;
    }

    public int getMaxOrder() {
        return maxOrder;
    }

    public void setMaxOrder(int maxOrder) {
        this.maxOrder = maxOrder;
    }

    public String getNumberInYear() {
        return numberInYear;
    }

    public void setNumberInYear(String numberInYear) {
        this.numberInYear = numberInYear;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUseCase() {
        return useCase;
    }

    public void setUseCase(String useCase) {
        this.useCase = useCase;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getCompanyProducer() {
        return companyProducer;
    }

    public void setCompanyProducer(String companyProducer) {
        this.companyProducer = companyProducer;
    }

    public String getStandards() {
        return standards;
    }

    public void setStandards(String standards) {
        this.standards = standards;
    }

    public String getProductAbility() {
        return productAbility;
    }

    public void setProductAbility(String productAbility) {
        this.productAbility = productAbility;
    }

    public String getSpecialFeatures() {
        return specialFeatures;
    }

    public void setSpecialFeatures(String specialFeatures) {
        this.specialFeatures = specialFeatures;
    }

    public String getManufactureTechnology() {
        return manufactureTechnology;
    }

    public void setManufactureTechnology(String manufactureTechnology) {
        this.manufactureTechnology = manufactureTechnology;
    }

    public String getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(String salesAmount) {
        this.salesAmount = salesAmount;
    }
*/}
