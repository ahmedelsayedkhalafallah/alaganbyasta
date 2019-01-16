package com.example.ahmed.pointoflife;

public class Hospital {
    private String bags,id,name;
    Long password;
    public Hospital(String bags,String id,String name,Long password)
    {
        this.bags = bags;
        this.id = id;
        this.name = name;
        this.password = password;
    }
    Hospital(){

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBags() {
        return bags;
    }

    public void setBags(String bags) {
        this.bags = bags;
    }

    public Long getPassword() {
        return password;
    }

    public void setPassword(Long password) {
        this.password = password;
    }
}
