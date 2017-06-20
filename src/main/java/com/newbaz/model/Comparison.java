package com.newbaz.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 6/18/17.
 */
@Entity
@Table(name = "COMPARISON")
public class Comparison {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "USER")
    private String user;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "COMPARE_ITEMS",
            joinColumns = { @JoinColumn(name = "COMPARISON_ID") },
            inverseJoinColumns = { @JoinColumn(name = "STUFF_ID") })
    private List<Stuff> listStuffs = new ArrayList<>(4);

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public List<Stuff> getListStuffs() {
        return listStuffs;
    }

    public void setListStuffs(List<Stuff> listStuffs) {
        this.listStuffs = listStuffs;
    }
}
