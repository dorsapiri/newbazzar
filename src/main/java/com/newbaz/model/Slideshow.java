package com.newbaz.model;



import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by dorsa on 3/26/17.
 */
@Entity
@Table(name = "SLIDE_SHOW")
public class Slideshow implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id ;

    @Column(name = "NAME")
    private String slideName;

    /*@JoinTable(name = "SLIDESHOW_FILE",
            joinColumns = {@JoinColumn(name = "SLIDESHOW_ID")},
            inverseJoinColumns ={@JoinColumn(name = "FILE_ID")})*/
//    @JoinColumn(name = "FILE_ID")

    @OneToMany
    @JoinTable(name = "SLIDE_FILE",
            joinColumns = {@JoinColumn(name = "SLIDE_ID")},
            inverseJoinColumns = {@JoinColumn(name = "FILE_ID")})
    private Set<UploadFile> sUploadFile;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSlideName() {
        return slideName;
    }

    public void setSlideName(String slideName) {
        this.slideName = slideName;
    }

    public Set<UploadFile> getsUploadFile() {
        return sUploadFile;
    }

    public void setsUploadFile(Set<UploadFile> sUploadFile) {
        this.sUploadFile = sUploadFile;
    }
}
