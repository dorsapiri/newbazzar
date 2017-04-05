package com.newbaz.model;

import javax.persistence.*;
import java.util.Arrays;

/**
 * Created by dorsa on 1/29/17.
 */
@Entity
@Table(name = "FILES_UPLOAD")
public class UploadFile {
    @Id
    @GeneratedValue
    @Column(name = "UPLOAD_ID")
    private long id;

    @Column(name = "FILE_NAME")
    private String fileName;

    @Column(name = "FILE_DATA")
    private byte[] data;

    @ManyToOne
    private Stuff stuff;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public Stuff getStuff() {
        return stuff;
    }

    public void setStuff(Stuff stuff) {
        this.stuff = stuff;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UploadFile)) return false;

        UploadFile that = (UploadFile) o;

        if (id != that.id) return false;
        if (fileName != null ? !fileName.equals(that.fileName) : that.fileName != null) return false;
        if (!Arrays.equals(data, that.data)) return false;
        return stuff != null ? stuff.equals(that.stuff) : that.stuff == null;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(data);
        result = 31 * result + (stuff != null ? stuff.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "UploadFile{" +
                "id=" + id +
                ", fileName='" + fileName + '\'' +
                ", data=" + Arrays.toString(data) +
                ", stuff=" + stuff +
                '}';
    }
}
