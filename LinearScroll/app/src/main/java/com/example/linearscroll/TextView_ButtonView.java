package com.example.linearscroll;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

public class TextView_ButtonView extends AppCompatActivity {

    TextView textView, textView2, text1, text2, text3, clickedtext;
    Button button1, button3, logbtn, signbtn;
    ImageButton button2;
    int count1 = 0, count2 = 0, count3 = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.textview_buttonview);

        textView = findViewById(R.id.helloo);
        textView2 = findViewById(R.id.code);
        button1 = findViewById(R.id.button1);
        button2 = findViewById(R.id.button2);
        button3 = findViewById(R.id.button3);
        logbtn = findViewById(R.id.logbtn);
        signbtn = findViewById(R.id.signbtn);
        text1 = findViewById(R.id.textBtn1);
        text2 = findViewById(R.id.textBtn2);
        text3 = findViewById(R.id.text3);
        clickedtext = findViewById(R.id.clickedtext);

        // only a single function to implement all button
//        button1.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                count1++;
//                text1.setText("Clicked : " + count1);
//            }
//        });
//        button2.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                count2++;
//                text2.setText("Clicked: " + count2);
//            }
//        });
//        button3.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                count3++;
//                text3.setText("Clicked: " + count3);
//            }
//        });
//
//        Handler handler = new Handler();
//        button1.setOnClickListener(handler);
//        button2.setOnClickListener(handler);
//        button3.setOnClickListener(handler);
//        signbtn.setOnClickListener(handler);
//        logbtn.setOnClickListener(handler);
    }

    public void ButtonClicked(View v) {
        if (v.getId() == button1.getId()) {
            count1++;
            text1.setText("Clicked : " + count1);
        }
        if (v.getId() == button2.getId()) {
            count2++;
            text2.setText("Clicked: " + count2);
        }
        if (v.getId() == button3.getId()) {
            count3++;
            text3.setText("Clicked: " + count3);
        }
        if (v.getId() == signbtn.getId()) {
            clickedtext.setText("Sign up clicked!");
        }
        if (v.getId() == logbtn.getId()) {
            clickedtext.setText("Log in clicked!");
        }

        Toast toast = Toast.makeText(this, "Button clicked", Toast.LENGTH_SHORT);
        toast.setGravity(Gravity.CENTER, 0, 0);
        toast.show();

        Log.d("button","button clicked");
    }
}