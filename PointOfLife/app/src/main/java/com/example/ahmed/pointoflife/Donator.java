package com.example.ahmed.pointoflife;

public class Donator {

        private String address,age,date,id,name,phone,type;
        public Donator(String address,String age,String date,String id,String name,String phone,String type)
        {

            this.address = address;
            this.age = age;
            this.date = date;
            this.id = id;
            this.name = name;
            this.phone = phone;
            this.type = type;

        }
        Donator(){

        }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}


