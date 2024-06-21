package com.example.bmicalculator;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class ResultShow extends AppCompatActivity {
    TextView bmiVal, bmiRep, bmiTitle;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result_show);

        bmiVal = findViewById(R.id.bmiVal);
        bmiRep = findViewById(R.id.bmiRep);
        bmiTitle = findViewById(R.id.bmiTitle);


        double bmi = getIntent().getDoubleExtra("bmii", 0);
        bmiVal.setText(String.format("Your BMI is %.2f Kg/m^2", bmi));

        if (bmi < 18.5) {
            bmiTitle.setText(R.string.Underweight);
            bmiRep.setText(R.string.UnderweightR);
        } else if (bmi >= 18.5 && bmi <= 24.9) {
            bmiTitle.setText(R.string.Normal);
            bmiRep.setText(R.string.NormalR);
        } else if (bmi >= 25 && bmi <= 29.9) {
            bmiTitle.setText(R.string.Overweight);
            bmiRep.setText(R.string.OverweightR);
        } else if (bmi >= 30 && bmi <= 34.9) {
            bmiTitle.setText(R.string.Obesity1);
            bmiRep.setText(R.string.Obesity1R);
        } else if (bmi >= 35 && bmi <= 39.9) {
            bmiTitle.setText(R.string.Obesity2);
            bmiRep.setText(R.string.Obesity2R);
        } else {
            bmiTitle.setText(R.string.Obesity3);
            bmiRep.setText(R.string.Obesity3R);
        }

    }


}
