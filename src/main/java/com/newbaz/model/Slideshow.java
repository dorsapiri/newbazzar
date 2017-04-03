package com.newbaz.model;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by dorsa on 3/26/17.
 */
@Entity
@Table(name = "SLIDE_SHOW")
public class Slideshow {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id ;

    @OneToOne
    @JoinTable(name = "SLIDESHOW_FILE",
            joinColumns = {@JoinColumn(name = "SLIDESHOW_ID")},
            inverseJoinColumns ={@JoinColumn(name = "FILE_ID")})
    private UploadFile uploadFile;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UploadFile getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(UploadFile uploadFile) {
        this.uploadFile = uploadFile;
    }
}
