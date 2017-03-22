package com.newbaz.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by dorsa on 3/2/17.
 */
@Entity
@Table(name = "STUFF")
@Inheritance(strategy = InheritanceType.JOINED)
public class Stuff implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "ID")
    private Integer id ;

    @NotEmpty
    @Column(name = "NAME", nullable = false)
    private String name;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_DATE", nullable = false)
    private Date createDate;

    @ManyToOne
    private User owner;

    @OneToMany(mappedBy = "id",fetch = FetchType.LAZY)
    private Set<UploadFile> uploadFile;

    @Transient
    private String[] images;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Set<UploadFile> getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(Set<UploadFile> uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String[] getImages() {
        return images;
    }

    public void setImages(String[] images) {
        this.images = images;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }
}
