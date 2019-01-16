package com.example.ahmed.pointoflife;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.view.View;
import android.widget.Button;

public class HospitalView extends AppCompatActivity {

    boolean f = true;
    private Button btnap;
    private Button btnan;
    private Button btnbp;
    private Button btnbn;
    private Button btnabp;
    private Button btnabn;
    private Button btnop;
    private Button btnon;
    public CardView fCardView;
    public CardView kCardView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnap = (Button) findViewById(R.id.btnap_Button);
        btnbp = (Button) findViewById(R.id.btnbp_Button);
        btnan = (Button) findViewById(R.id.btnan_Button);
        btnbn = (Button) findViewById(R.id.btnbn_Button);
        btnabp = (Button) findViewById(R.id.btnabp_Button);
        btnabn = (Button) findViewById(R.id.btnabn_Button);
        btnop = (Button) findViewById(R.id.btnop_Button);
        btnon = (Button) findViewById(R.id.btnon_Button);


        fCardView = (CardView) findViewById(R.id.fCardView);
        final CardView sCardView = (CardView) findViewById(R.id.sCardView);
        final CardView tCardView = (CardView) findViewById(R.id.tCardView);
        final CardView rCardView = (CardView) findViewById(R.id.rCardView);
        kCardView = (CardView) findViewById(R.id.kCardView);
        final CardView saCardView = (CardView) findViewById(R.id.saCardView);
        final CardView sbCardView = (CardView) findViewById(R.id.sbCardView);
        final CardView tmCardView = (CardView) findViewById(R.id.tmCardView);




        btnap.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    fCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    fCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });


        btnbp.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    sCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    sCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });

        btnabp.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    tCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    tCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });


        btnop.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    rCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    rCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });

        btnan.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    kCardView.setVisibility(View.VISIBLE);

                    f = false;
                } else {
                    kCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });

        btnbn.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    saCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    saCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });


        btnabn.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    sbCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    sbCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });


        btnon.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View v) {

                if (f) {
                    tmCardView.setVisibility(View.VISIBLE);
                    f = false;
                } else {
                    tmCardView.setVisibility(View.GONE);
                    f = true;
                }
            }

        });

    }


}
