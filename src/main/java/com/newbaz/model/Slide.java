package com.newbaz.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * Created by dorsa on 4/8/17.
 */
@Entity
@Table(name = "SLIDE")
public class Slide {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "TITLE")
    private String title;

    @OneToOne
    @JoinTable(name = "SLIDE_FILE",joinColumns = {@JoinColumn(name = "SLIDE_ID")},inverseJoinColumns = {@JoinColumn(name = "FILE_ID")})
    private FileBucket slideImage;

    @Transient
    private MultipartFile file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public FileBucket getSlideImage() {
        return slideImage;
    }

    public void setSlideImage(FileBucket slideImage) {
        this.slideImage = slideImage;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
