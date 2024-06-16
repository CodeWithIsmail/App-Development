package com.example.part1_widget;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

public class MiniCalculator extends AppCompatActivity {
    EditText num1, num2;
    ImageButton plus, min, mul, div;
    TextView ans;
    double n1, n2, n;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mini_calculator);

        num1 = findViewById(R.id.num1);
        num2 = findViewById(R.id.num2);
        plus = findViewById(R.id.plus);
        min = findViewById(R.id.min);
        mul = findViewById(R.id.mul);
        div = findViewById(R.id.div);
        ans = findViewById(R.id.ans);


    }

    public void calculate(View v) {


        try {

            n1 = Double.parseDouble(num1.getText().toString());
            n2 = Double.parseDouble(num2.getText().toString());

            if (v.getId() == plus.getId()) {
                n = n1 + n2;
            }
            if (v.getId() == min.getId()) {
                n = n1 - n2;
            }
            if (v.getId() == mul.getId()) {
                n = n1 * n2;
            }
            if (v.getId() == div.getId()) {
                ans.setText("");
                if (n2 == 0)
                    throw new Exception();
                n = n1 / n2;
            }
            ans.setText(String.format("%.2f", n));

        } catch (Exception e) {
            Toast.makeText(this, "Please enter valid input", Toast.LENGTH_SHORT).show();
            // ans.setText("Invalid input");
        }
    }
}