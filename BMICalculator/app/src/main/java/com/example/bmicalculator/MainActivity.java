package com.example.bmicalculator;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    Button button;
    TextView textView, editTextText3;
    EditText editTextNumberSigned, editTextNumberDecimal, editTextNumberDecimal2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button = findViewById(R.id.button);
        textView = findViewById(R.id.textView);
        editTextText3 = findViewById(R.id.editTextText3);
//        textView3 = findViewById(R.id.textView3);
//        textView2 = findViewById(R.id.textView2);
        editTextNumberSigned = findViewById(R.id.editTextNumberSigned);
        editTextNumberDecimal = findViewById(R.id.editTextNumberDecimal);
        editTextNumberDecimal2 = findViewById(R.id.editTextNumberDecimal2);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                try {
                    String wt = editTextNumberSigned.getText().toString();
                    String ht1 = editTextNumberDecimal.getText().toString();
                    String ht2 = editTextNumberDecimal2.getText().toString();

                    int weight = Integer.parseInt(wt);
                    int feet = Integer.parseInt(ht1);
                    int inch = Integer.parseInt(ht2);
                    double ht = feet * 0.3048 + inch * 0.0254;
                    double bmi = weight / (ht * ht);

                    Intent intent = new Intent(MainActivity.this, ResultShow.class);
                    intent.putExtra("bmii",bmi);
                    startActivity(intent);
                } catch (Exception e) {
                    e.printStackTrace();
                }


//                textView2.setText(String.format("Your BMI is %.2f Kg/m^2", bmi));
            }
        });
    }
}