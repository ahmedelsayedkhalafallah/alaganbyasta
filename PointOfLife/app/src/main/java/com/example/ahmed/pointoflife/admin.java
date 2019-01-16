package com.example.ahmed.pointoflife;

import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;

public class admin extends AppCompatActivity {

    Spinner s,s1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        s=(Spinner)findViewById(R.id.spinner1);
        s1=(Spinner)findViewById(R.id.spinner2);

        final String[] items = getResources().getStringArray(R.array.Country);
        final String[] minya = getResources().getStringArray(R.array.Minya);
        final String[] giza = getResources().getStringArray(R.array.Giza);
        final String[] qalyubia = getResources().getStringArray(R.array.Qalyubia);
        final String[] alexandria = getResources().getStringArray(R.array.Alexandria);
        final String[] beheira = getResources().getStringArray(R.array.Beheira);
        final String[] matruh = getResources().getStringArray(R.array.Matruh);
        final String[] damietta = getResources().getStringArray(R.array.Damietta);
        final String[] dakahlia = getResources().getStringArray(R.array.Dakahlia);
        final String[] kafrElSheikh = getResources().getStringArray(R.array.KafrElSheikh);
        final String[] gharbia = getResources().getStringArray(R.array.Gharbia);
        final String[] monufia = getResources().getStringArray(R.array.Monufia);
        final String[] sharqia = getResources().getStringArray(R.array.Sharqia);
        final String[] ismailia = getResources().getStringArray(R.array.Ismailia);
        final String[] northSinai = getResources().getStringArray(R.array.NorthSinai);
        final String[] beniSuef = getResources().getStringArray(R.array.BeniSuef);
        final String[] faiyum = getResources().getStringArray(R.array.Faiyum);
        final String[] asyut = getResources().getStringArray(R.array.Asyut);
        final String[] newValley = getResources().getStringArray(R.array.NewValley);
        final String[] sohag = getResources().getStringArray(R.array.Sohag);
        final String[] qena = getResources().getStringArray(R.array.Qena);
        final String[] luxor = getResources().getStringArray(R.array.Luxor);
        final String[] aswan = getResources().getStringArray(R.array.Aswan);


        final ArrayAdapter<String>ia=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,items){
            @Override
            public boolean isEnabled(int position){
                if(position == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            @Override
            public View getDropDownView(int position, View convertView,
                                        ViewGroup parent) {
                View view = super.getDropDownView(position, convertView, parent);
                TextView tv = (TextView) view;
                if(position == 0){
                    // Set the hint text color gray
                    tv.setTextColor(Color.GRAY);
                }
                else {
                    tv.setTextColor(Color.BLACK);
                }
                return view;
            }
        };

        final ArrayAdapter<String>m1=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,minya);
        final ArrayAdapter<String>m2=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,giza);
        final ArrayAdapter<String>m3=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,qalyubia);
        final ArrayAdapter<String>m4=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,alexandria);
        final ArrayAdapter<String>m5=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,beheira);
        final ArrayAdapter<String>m6=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,matruh);
        final ArrayAdapter<String>m7=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,damietta);
        final ArrayAdapter<String>m8=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,dakahlia);
        final ArrayAdapter<String>m9=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,kafrElSheikh);
        final ArrayAdapter<String>m10=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,gharbia);
        final ArrayAdapter<String>m11=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,monufia);
        final ArrayAdapter<String>m12=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,sharqia);
        final ArrayAdapter<String>m13=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,ismailia);
        final ArrayAdapter<String>m14=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,northSinai);
        final ArrayAdapter<String>m15=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,beniSuef);
        final ArrayAdapter<String>m16=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,faiyum);
        final ArrayAdapter<String>m17=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,asyut);
        final ArrayAdapter<String>m18=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,newValley);
        final ArrayAdapter<String>m19=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,sohag);
        final ArrayAdapter<String>m20=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,qena);
        final ArrayAdapter<String>m21=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,luxor);
        final ArrayAdapter<String>m22=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,aswan);

        ia.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        s.setAdapter(ia);

        s.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                switch (parent.getId()){
                    case R.id.spinner1:{
                        if(items[position].equals("Minya")){

                            m1.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m1);

                        }
                        if(items[position].equals("Giza")){

                            m2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m2);

                        }
                        if(items[position].equals("Qalyubia")){

                            m3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m3);

                        }
                        if(items[position].equals("Alexandria")){

                            m4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m4);

                        }

                        if(items[position].equals("Beheira")){

                            m5.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m5);

                        }

                        if(items[position].equals("Matruh")){

                            m6.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m6);

                        }

                        if(items[position].equals("Damietta")){

                            m7.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m7);

                        }
                        if(items[position].equals("Dakahlia")){

                            m8.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m8);

                        }
                        if(items[position].equals("Kafr El Sheikh")){

                            m9.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m9);

                        }
                        if(items[position].equals("Gharbia")){

                            m10.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m10);

                        }
                        if(items[position].equals("Monufia")){

                            m11.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m11);

                        }

                        if(items[position].equals("Sharqia")){

                            m12.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m12);

                        }

                        if(items[position].equals("Ismailia")){

                            m13.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m13);

                        }
                        if(items[position].equals("NorthSinai")){

                            m14.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m14);

                        }
                        if(items[position].equals("BeniSuef")){

                            m15.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m15);

                        }
                        if(items[position].equals("Faiyum")){

                            m16.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m16);

                        }
                        if(items[position].equals("Asyut")){

                            m17.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m17);

                        }
                        if(items[position].equals("NewValley")){

                            m18.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m18);

                        }
                        if(items[position].equals("Sohag")){

                            m19.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m19);

                        }
                        if(items[position].equals("Qena")){

                            m20.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m20);

                        }
                        if(items[position].equals("Luxor")){

                            m21.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m21);

                        }
                        if(items[position].equals("Aswan")){

                            m22.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            s1.setAdapter(m22);

                        }
                    }


                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }
}
