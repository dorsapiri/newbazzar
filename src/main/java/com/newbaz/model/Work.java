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
@AttributeOverrides({
        @AttributeOverride(name="name", column=@Column(name="NAME")),
        @AttributeOverride(name="createDate", column=@Column(name="CREATE_DATE")),
        @AttributeOverride(name="owner", column=@Column(name="OWNER_id"))
})
public class Work extends Stuff{

//    @NotEmpty
//    @JoinTable(name="STUFF", joinColumns = @JoinColumn(name="id"), inverseJoinColumns=@JoinColumn(name="houses_id"))
//    @JoinTable(name="STUFF")
//    private Integer stuffId;

    @NotEmpty
    @Column(name = "PROFESSION", nullable = false)
    private String profession;

    @NotEmpty
    @Column(name = "STATE",nullable = false)
    private String state;

    @Transient
    private String[] images;


   /* public Integer getStuffId() {
        return stuffId;
    }

    public void setStuffId(Integer stuffId) {
        this.stuffId = stuffId;
    }*/

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
