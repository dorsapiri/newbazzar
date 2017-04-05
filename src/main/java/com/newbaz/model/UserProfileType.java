package com.newbaz.model;

import java.io.Serializable;

/**
 * Created by dorsa on 1/15/17.
 */
public enum UserProfileType implements Serializable {
    USER("USER"),
    SELLER("SELLER"),
    JOB("JOb"),
    ADMIN("ADMIN");

    String userProfileType;

    private UserProfileType(String userProfileType){
        this.userProfileType = userProfileType;
    }

    public String getUserProfileType(){
        return userProfileType;
    }
}
