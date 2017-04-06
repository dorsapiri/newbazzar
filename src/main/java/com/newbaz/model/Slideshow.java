package com.newbaz.model;


import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Slideshow)) return false;

        Slideshow slideshow = (Slideshow) o;

        if (id != null ? !id.equals(slideshow.id) : slideshow.id != null) return false;
        if (slideName != null ? !slideName.equals(slideshow.slideName) : slideshow.slideName != null) return false;
        return sUploadFile != null ? sUploadFile.equals(slideshow.sUploadFile) : slideshow.sUploadFile == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (slideName != null ? slideName.hashCode() : 0);
        result = 31 * result + (sUploadFile != null ? sUploadFile.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Slideshow{" +
                "id=" + id +
                ", slideName='" + slideName + '\'' +
                ", sUploadFile=" + sUploadFile +
                '}';
    }
}
