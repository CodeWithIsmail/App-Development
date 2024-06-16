package com.example.part1_widget;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

public class ImageViewWidget extends AppCompatActivity {
    ImageView img1, img2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_image_view);

        img1 = findViewById(R.id.img1);
        img2 = findViewById(R.id.img2);

    }

    public void showToast(View v)
    {
        if(v.getId()==img1.getId())
            Toast.makeText(this, "Image 1 clicked", Toast.LENGTH_SHORT).show();

        if(v.getId()==img2.getId())
            Toast.makeText(this, "Image 2 clicked", Toast.LENGTH_SHORT).show();
     }


}