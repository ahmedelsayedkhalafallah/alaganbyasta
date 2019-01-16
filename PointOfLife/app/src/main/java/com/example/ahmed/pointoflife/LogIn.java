package com.example.ahmed.pointoflife;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.HashMap;
import java.util.Map;

public class LogIn extends AppCompatActivity {

    DatabaseReference mRoot;
    Map<String,Car> h;
    Map<String,Hospital> h2;
    EditText name,password;
    String Id,Pass;
    Button login;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_log_in);

        h = new HashMap<String, Car>();
        h2 = new HashMap<String, Hospital>();
        name = findViewById(R.id.name);
        password = findViewById(R.id.password);
        mRoot = FirebaseDatabase.getInstance().getReference().child("cars");
        login = findViewById(R.id.login);
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

        Id = name.getText().toString();
        Pass = password.getText().toString();

                DatabaseReference rootRef = FirebaseDatabase.getInstance().getReference();
                DatabaseReference carsRef = rootRef.child("cars");
                ValueEventListener valueEventListener = new ValueEventListener() {
                    @Override
                    public void onDataChange(DataSnapshot dataSnapshot) {
                        for(DataSnapshot ds : dataSnapshot.getChildren()) {
                            Car car = ds.getValue(Car.class);
                            h.put(car.getId().toString(),car);
                        }
                    }

                    @Override
                    public void onCancelled(@NonNull DatabaseError databaseError) {
                    System.out.print(databaseError.getMessage());}
                };
                carsRef.addListenerForSingleValueEvent(valueEventListener);

                DatabaseReference rootRef2 = FirebaseDatabase.getInstance().getReference();
                DatabaseReference hospitalsRef = rootRef2.child("hospitals");
                ValueEventListener valueEventListener2 = new ValueEventListener() {
                    @Override
                    public void onDataChange(DataSnapshot dataSnapshot) {
                        for(DataSnapshot ds : dataSnapshot.getChildren()) {
                            Hospital hospital = ds.getValue(Hospital.class);
                            h2.put(hospital.getId(),hospital);

                        }
                    }

                    @Override
                    public void onCancelled(@NonNull DatabaseError databaseError) {
                        System.out.print(databaseError.getMessage());}
                };
                hospitalsRef.addListenerForSingleValueEvent(valueEventListener2);
//        mRoot.addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
//                for (DataSnapshot childSnapshot: dataSnapshot.getChildren()) {
//                    Car car = new Car();
//                    car.setHospital(childSnapshot.child("hospital").getValue(Long.class));
//                    car.setId(childSnapshot.child("id").getValue(Long.class));
//                    car.setPassword(childSnapshot.child("password").getValue(Long.class));
//                    h.put(car.getId().toString(),car);
//                }
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        });
//
//        mRoot = FirebaseDatabase.getInstance().getReference().child("hospitals");
//                mRoot.addChildEventListener(new ChildEventListener() {
//                    @Override
//                    public void onChildAdded(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//                        for (DataSnapshot childSnapshot: dataSnapshot.getChildren()) {
//                            Hospital hospital = new Hospital();
//                            hospital.setBags(childSnapshot.child("bags").getValue(String.class));
//                            hospital.setId( childSnapshot.child("id").getValue(String.class));
//                            hospital.setName( childSnapshot.child("name").getValue(String.class));
//                            hospital.setPassword( childSnapshot.child("password").getValue(String.class));
//
//                            h2.put(hospital.getId(), hospital);
//                        }
//
//                    }
//
//                    @Override
//                    public void onChildChanged(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//
//                    }
//
//                    @Override
//                    public void onChildRemoved(@NonNull DataSnapshot dataSnapshot) {
//
//                    }
//
//                    @Override
//                    public void onChildMoved(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//
//                    }
//
//                    @Override
//                    public void onCancelled(@NonNull DatabaseError databaseError) {
//
//                    }
//                });
                if(!(h.isEmpty())){
                    if(h.containsKey(Id)){
                        Intent intent = new Intent(LogIn.this,MainActivity.class);
                        intent.putExtra("id",h.get(Id).getId());
                        intent.putExtra("hospital",h.get(Id).getHospital());
                        startActivity(intent);
                    }
                }
                else{
                    if(!(h2.isEmpty())){
                        Intent intent = new Intent(LogIn.this,hospitals.class);
                        intent.putExtra("id",h2.get(Id).getId());
                        startActivity(intent);
                    }
                    else{
                        Toast.makeText(LogIn.this, "non", Toast.LENGTH_SHORT).show();
                    }
                }
    }
});
    }


}
