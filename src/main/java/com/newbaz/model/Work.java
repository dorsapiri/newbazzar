package com.newbaz.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * Created by dorsa on 12/5/16.
 */
@Entity
@Table(name = "WORK")
public class Work extends Stuff{

    @NotEmpty
    @Column(name = "STUFF_ID")
    private Integer stuffId;

    @NotEmpty
    @Column(name = "PROFESSION", unique = true, nullable = false)
    private String profession;

    @NotEmpty
    @Column(name = "STATE",nullable = false)
    private String state;

    @Transient
    private String[] images;


    public Integer getStuffId() {
        return stuffId;
    }

    public void setStuffId(Integer stuffId) {
        this.stuffId = stuffId;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public String[] getImages() {
        return images;
    }

    public void setImages(String[] images) {
        this.images = images;
    }



}
