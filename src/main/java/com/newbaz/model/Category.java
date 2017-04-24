package com.newbaz.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

/**
 * Created by dorsa on 2/16/17.
 */
@Entity
@Table(name = "CATEGORY")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotEmpty
    @Column(name = "CATEGORY_NAME", unique = true, nullable = false)
    private String categoryName;

    @NotEmpty
    @Column(name = "CATEGORY_LINK",unique = true, nullable = false)
    private String categoryLink;

    @Column(name = "PARENT_ID")
    private Integer parentId;

    @Column(name = "SORT_ORDER")
    private int sortOrder;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryLink() {
        return categoryLink;
    }

    public void setCategoryLink(String categoryLink) {
        this.categoryLink = categoryLink;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public int getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }



    @Override
    public String toString() {
//        return "Category{" +
//                "id=" + id +
//                ", categoryName='" + categoryName + '\'' +
//                ", categoryLink='" + categoryLink + '\'' +
//                ", sortOrder=" + sortOrder +
//                '}';
        return categoryName;
    }
}
