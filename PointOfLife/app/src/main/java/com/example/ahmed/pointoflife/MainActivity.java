package com.example.ahmed.pointoflife;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.Toast;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;


public class MainActivity extends AppCompatActivity {

    DatabaseReference mRoot , mRoot2;
    HashMap<String,Donator> h = new HashMap<String, Donator>();
    EditText id;
    String idS;
    TabHost tab;
    ImageView imageView;
    EditText name, address, age,phone, type,nid;
    String Sid,Sname, Saddress,Sage,Sphone,Stype;
    String carId = "125",hospitalId="111", oldQuantity, oldCounter, oldCount;
    double quantity;
    String BloodType;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Intent intent = getIntent();



//        carId = intent.getStringExtra("carID");
//        hospitalId = intent.getStringExtra("HospitalID");


        final ImageView ap = (ImageView) findViewById(R.id.ap);
        final ImageView am = (ImageView) findViewById(R.id.am);
        final ImageView bp = (ImageView) findViewById(R.id.bp);
        final ImageView bm = (ImageView) findViewById(R.id.bm);
        final ImageView abp = (ImageView) findViewById(R.id.abp);
        final ImageView abm = (ImageView) findViewById(R.id.abm);
        final ImageView op = (ImageView) findViewById(R.id.op);
        final ImageView om = (ImageView) findViewById(R.id.om);



        name = findViewById(R.id.name);
        address = findViewById(R.id.address);
        age = findViewById(R.id.age);
        phone = findViewById(R.id.phone);
        type = findViewById(R.id.type);
        nid = findViewById(R.id.nid);

        tab = (TabHost) findViewById(R.id.tabhost);
        tab.setup();


        TabHost.TabSpec spec = tab.newTabSpec("tag1");
        spec.setIndicator("State Check");
        spec.setContent(R.id.tab1);
        tab.addTab(spec);

        spec = tab.newTabSpec("tag2");
        spec.setIndicator("Registeration");
        spec.setContent(R.id.tab2);
        tab.addTab(spec);


        spec = tab.newTabSpec("tag3");
        spec.setIndicator("Donation");
        spec.setContent(R.id.tab3);
        tab.addTab(spec);


        tab.getTabWidget().getChildTabViewAt(0).setClickable(false);
        tab.getTabWidget().getChildTabViewAt(1).setClickable(false);
        tab.getTabWidget().getChildTabViewAt(2).setClickable(false);

        ap.setOnTouchListener(new View.OnTouchListener() {
            @Override
            @SuppressLint("ClickableViewAccessibility")
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(x);
                    ap.setScaleY(y);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(1);
                    bp.setScaleY(1);


                } else if (event.getAction() == MotionEvent.ACTION_UP) {
                    float x = 1;
                    float y = 1;

                    ap.setScaleX(x);
                    ap.setScaleY(y);


                }
                return false;
            }
        });

        bp.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(x);
                    bp.setScaleY(y);

                } else if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = 1;
                    float y = 1;

                    bp.setScaleX(x);
                    bp.setScaleY(y);


                }
                return false;
            }
        });

        am.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {


                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(x);
                    am.setScaleY(y);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(1);
                    bp.setScaleY(1);


                } else if (event.getAction() == MotionEvent.ACTION_UP) {
                    float x = 1;
                    float y = 1;

                    am.setScaleX(x);
                    am.setScaleY(y);


                }
                return false;
            }
        });

        bm.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(x);
                    bm.setScaleY(y);
                    bp.setScaleX(1);
                    bp.setScaleY(1);

                } else if (event.getAction() == MotionEvent.ACTION_UP) {
                    float x = 1;
                    float y = 1;

                    bm.setScaleX(x);
                    bm.setScaleY(y);


                }
                return false;
            }
        });
        abp.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(x);
                    abp.setScaleY(y);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(1);
                    bp.setScaleY(1);

                } else if (event.getAction() == MotionEvent.ACTION_UP) {
                    float x = 1;
                    float y = 1;

                    abp.setScaleX(x);
                    abp.setScaleY(y);


                }
                return false;
            }
        });

        abm.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(x);
                    abm.setScaleY(y);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(1);
                    bp.setScaleY(1);

                } else if (event.getAction() == MotionEvent.ACTION_UP) {
                    float x = 1;
                    float y = 1;

                    abm.setScaleX(x);
                    abm.setScaleY(y);


                }
                return false;
            }
        });
        op.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(1);
                    om.setScaleY(1);
                    op.setScaleX(x);
                    op.setScaleY(y);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(1);
                    bp.setScaleY(1);

                } else if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = 1;
                    float y = 1;

                    op.setScaleX(x);
                    op.setScaleY(y);


                }
                return false;
            }
        });
        om.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN) {
                    float x = (float) 1.10;
                    float y = (float) 1.10;

                    ap.setScaleX(1);
                    ap.setScaleY(1);
                    abm.setScaleX(1);
                    abm.setScaleY(1);
                    am.setScaleX(1);
                    am.setScaleY(1);
                    om.setScaleX(x);
                    om.setScaleY(y);
                    op.setScaleX(1);
                    op.setScaleY(1);
                    abp.setScaleX(1);
                    abp.setScaleY(1);
                    bm.setScaleX(1);
                    bm.setScaleY(1);
                    bp.setScaleX(1);
                    bp.setScaleY(1);

                } else if (event.getAction() == MotionEvent.ACTION_UP) {
                    float x = 1;
                    float y = 1;

                    om.setScaleX(x);
                    om.setScaleY(y);


                }
                return false;
            }
        });

        imageView = findViewById(R.id.pic);
        id = findViewById(R.id.id);
        mRoot = FirebaseDatabase.getInstance().getReference().child("donators");
    }

    public void check(View view) {
        BloodType="A+";
        quantity = 0.5;
        //addBlood();
        idS = id.getText().toString();

        mRoot.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                for (DataSnapshot postSnapshot : dataSnapshot.getChildren()) {
                    Donator donator = postSnapshot.getValue(Donator.class);
                    h.put(donator.getId(),donator);
                }

                if(h.isEmpty()){
                    Toast.makeText(MainActivity.this,"No donators registered", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    if(h.containsKey(idS)){

                        Toast.makeText(MainActivity.this, "found", Toast.LENGTH_SHORT).show();

                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        String currentDateandTime = sdf.format(new Date());

                        try {
                            Date date1;
                            Date date2;

                            SimpleDateFormat dates = new SimpleDateFormat("dd/MM/yyyy");

                            //Setting dates
                            date1 = dates.parse(currentDateandTime);
                            date2 = dates.parse(h.get(idS).getDate());

                            //Comparing dates
                            long difference = Math.abs(date1.getTime() - date2.getTime());
                            long differenceDates = difference / (24 * 60 * 60 * 1000);

                            //Convert long to String
                            String dayDifference = Long.toString(differenceDates);
                            if(differenceDates < 60){
                                imageView.setImageResource(R.drawable.rlamp);
                                Toast.makeText(MainActivity.this, "Not allowed", Toast.LENGTH_SHORT).show();
                            }
                            else{
                                TabHost tabHost =  (TabHost) findViewById(R.id.tabhost);
                                tabHost.setCurrentTab(2);
                            }
                        }
                        catch (Exception e){

                        }


                        }
                    else{

                        Toast.makeText(MainActivity.this, "not found", Toast.LENGTH_SHORT).show();
                        TabHost tabHost =  (TabHost) findViewById(R.id.tabhost);
                        tabHost.setCurrentTab(1);




                    }
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });
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

        TabHost tabHost =  (TabHost) findViewById(R.id.tabhost);
        tabHost.setCurrentTab(2);

          }

//          void sendLocation(String Lat, String Long){
//              firebase.auth().onAuthStateChanged(function(user) {
//                  if (user) {
//                      // User is signed in.
//                      var user = firebase.auth().currentUser;
//                      String uid = user.uid;
//                      DatabaseReference mRoot = FirebaseDatabase.getInstance().getReference().child("cars").child(uid).child("location");
//                      mRoot.child("lat").setValue(Lat);
//                      mRoot.child("long").setValue(Long);
//                  } else {
//                      // No user is signed in.
//                  }
//              });
//            }
//
//            Map<String uid, Location location> getLocations(){
//        Map<String uid, Location location> locations;
//        mRoot = FirebaseDatabase.getInstance().getReference().child("cars");
//        mRoot.addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
//                for (DataSnapshot postSnapshot : dataSnapshot.getChildren()) {
//                    Location location = postSnapshot.getValue(Location.class);
//                    h.put(location.getId(),location);
//                }
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        };
//
//    }



String getDate(){
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String currentDateandTime = sdf.format(new Date());
    return currentDateandTime;
}



void addBlood( ){
    final DatabaseReference mRoot = FirebaseDatabase.getInstance().getReference().child("cars").child(carId).child(""+getDate()+"");

    mRoot.child("counter").addValueEventListener(new ValueEventListener() {
        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            oldCount = dataSnapshot.getValue(String.class);
            if(oldCount == null)
            {
                mRoot.setValue(1);
            }else {

                int v = Integer.valueOf(oldCount);
                v++;
                mRoot.child("counter").setValue(String.valueOf(v));
            }
        }

        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    });


    //
    mRoot.child(BloodType).child("quantity").addValueEventListener(new ValueEventListener() {
        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            oldQuantity = String.valueOf(dataSnapshot.getValue(Double.class));
            if(oldQuantity == null)
            {
                mRoot.child(BloodType).child("quantity").setValue(quantity);
            }else {

                double v = Double.valueOf(oldQuantity);
                v += quantity;
                mRoot.child(BloodType).child("quantity").setValue(String.valueOf(v));
            }
        }

        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    });

    //
    mRoot.child(BloodType).child("counter").addValueEventListener(new ValueEventListener() {
        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            oldCounter = String.valueOf(dataSnapshot.getValue(Integer.class));
            if(oldCounter == null)
            {
                mRoot.child(BloodType).child("counter").setValue(1);
            }else {

                int v = 0;
                v = Integer.valueOf(oldCounter);
                v++;
                mRoot.child(BloodType).child("counter").setValue(String.valueOf(v));
            }
        }

        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    });


//-------------------------
    mRoot2 = FirebaseDatabase.getInstance().getReference().child("hospitals").child(hospitalId).child(""+getDate()+"");

    mRoot2.child("counter").addValueEventListener(new ValueEventListener() {
        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            oldCount = String.valueOf(dataSnapshot.getValue(Integer.class));
            if(oldCount == null)
            {
                mRoot2.setValue(1);
            }else {

                int v = Integer.valueOf(oldCount);
                v++;
                mRoot2.child("counter").setValue(String.valueOf(v));
            }
        }

        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    });


    //
    mRoot2.child(BloodType).child("quantity").addValueEventListener(new ValueEventListener() {
        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            oldQuantity = String.valueOf(dataSnapshot.getValue(Double.class));
            if(oldQuantity == null)
            {
                mRoot2.child(BloodType).child("quantity").setValue(quantity);
            }else {

                double v = Double.valueOf(oldQuantity);
                v += quantity;
                mRoot2.child(BloodType).child("quantity").setValue(String.valueOf(v));
            }
        }

        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    });


    //
    mRoot2.child(BloodType).child("counter").addValueEventListener(new ValueEventListener() {
        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            oldCounter = String.valueOf(dataSnapshot.getValue(Integer.class));
            if(oldCounter == null)
            {
                mRoot2.child(BloodType).child("counter").setValue(1);
            }else {

                int v = Integer.valueOf(oldCounter);
                v++;
                mRoot2.child(BloodType).child("counter").setValue(String.valueOf(v));
            }
        }

        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    });


}





}

