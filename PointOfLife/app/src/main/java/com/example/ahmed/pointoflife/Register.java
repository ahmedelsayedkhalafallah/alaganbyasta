package com.example.ahmed.pointoflife;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Register extends AppCompatActivity {


    EditText name, address, age,phone, type,nid;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_register);
//
//        name = findViewById(R.id.name);
//        address = findViewById(R.id.address);
//        age = findViewById(R.id.age);
//        phone = findViewById(R.id.phone);
//        type = findViewById(R.id.type);
//        nid = findViewById(R.id.nid);

    }


    public void add(View view) {

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String currentDateandTime = sdf.format(new Date());


        String nameS,addressS,ageS,phoneS,typeS,nidS;
        nameS = name.getText().toString();
        addressS = address.getText().toString();
        ageS = age.getText().toString();
        phoneS = phone.getText().toString();
        typeS = type.getText().toString();
        nidS = nid.getText().toString();

        DatabaseReference mRoot = FirebaseDatabase.getInstance().getReference().child("donators").child(nidS);
        mRoot.child("name").setValue(nameS);
        mRoot.child("address").setValue(addressS);
        mRoot.child("age").setValue(ageS);
        mRoot.child("phone").setValue(phoneS);
        mRoot.child("type").setValue(typeS);
        mRoot.child("id").setValue(nidS);
        mRoot.child("date").setValue(currentDateandTime);

    }
}
