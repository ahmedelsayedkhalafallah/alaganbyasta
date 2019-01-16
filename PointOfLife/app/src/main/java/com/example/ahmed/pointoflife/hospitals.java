package com.example.ahmed.pointoflife;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class hospitals extends AppCompatActivity {

    RecyclerView r;
    RecyclerView.Adapter mAdapter;
    Hospital son;
    List<String> mhospital = new ArrayList<>();
    List<Hospital> obs = new ArrayList<>();

    DatabaseReference mRoot;
    LinearLayoutManager mLayoutManager;
    TextView t ;
    HashMap<Integer,Hospital> h = new HashMap<Integer, Hospital>();
    public static int c=-1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hospitals);

        r = findViewById(R.id.list);


        mRoot = FirebaseDatabase.getInstance().getReference().child("hospitals");
        mLayoutManager = new LinearLayoutManager(this);
        r.setHasFixedSize(true);
        r.setLayoutManager(mLayoutManager);
        mAdapter = new RecyclerAdapter(obs);
        r.setAdapter(mAdapter);

        r.addOnItemTouchListener(
                new RecyclerItemClickListener(this, r ,new RecyclerItemClickListener.OnItemClickListener() {
                    @Override public void onItemClick(View view, int position) {
                        Toast.makeText(hospitals.this, String.valueOf(position), Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(getApplicationContext(), HospitalView.class);
                        intent.putExtra("id",String.valueOf(h.get(position).getId()));
                      startActivity(intent);

                    }

                    @Override public void onLongItemClick(View view, int position) {
                        // do whatever
                    }
                })
        );


        mRoot.addChildEventListener(new ChildEventListener() {
            @Override
            public void onChildAdded(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
                Hospital p = dataSnapshot.getValue(Hospital.class);
                obs.add(p);
                Toast.makeText(hospitals.this, String.valueOf(c), Toast.LENGTH_SHORT).show();
                c++;
                h.put(c, p);
                mAdapter.notifyDataSetChanged();
            }

            @Override
            public void onChildChanged(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {

            }

            @Override
            public void onChildRemoved(@NonNull DataSnapshot dataSnapshot) {

            }

            @Override
            public void onChildMoved(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {

            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });
    }
}
