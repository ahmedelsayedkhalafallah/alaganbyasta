package com.example.ahmed.pointoflife;

import com.google.firebase.database.PropertyName;

public class Car {

    private Long hospital,id,password;
    public Car(Long hospital,Long id,Long passowrd)
    {
     this.hospital = hospital;
     this.id = id;
     this.password = passowrd;

    }
    Car(){

    }

    @PropertyName("hospital")
    public Long getHospital() {
        return hospital;
    }

    public void setHospital(Long hospital) {
        this.hospital = hospital;
    }

    @PropertyName("id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @PropertyName("password")
    public Long getPassword() {
        return password;
    }

    public void setPassword(Long password) {
        this.password = password;
    }
}
