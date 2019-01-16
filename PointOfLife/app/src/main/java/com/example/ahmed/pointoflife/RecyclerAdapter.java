package com.example.ahmed.pointoflife;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * Created by ahmed on 24/05/18.
 */

public class RecyclerAdapter extends RecyclerView.Adapter<RecyclerAdapter.RecyclerViewHolder>{
//    private List<String> mhospital;
    private List<Hospital> obs;
    public RecyclerAdapter( List<Hospital> obs)
    {

        this.obs = obs;
//        this.mhospital = mhospital;
    }

    @Override
    public RecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.recycler_item,parent,false);
        return new RecyclerViewHolder(v);
    }

    @Override
    public void onBindViewHolder(RecyclerViewHolder holder, int position) {
        Hospital p = obs.get(position);
        holder.b.setText(p.getBags());
        holder.n.setText(p.getName());
        holder.i.setText(p.getId());
    }

    @Override
    public int getItemCount() {
        return obs.size();
    }

    public class RecyclerViewHolder extends RecyclerView.ViewHolder{
        public TextView b ,n,i;
        public RecyclerViewHolder(View view)
        {

            super(view);
            b = view.findViewById(R.id.bags);
            n = view.findViewById(R.id.name);
            i = view.findViewById(R.id.id);
        }
    }

}
