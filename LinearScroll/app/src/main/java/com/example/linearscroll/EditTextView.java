package com.example.linearscroll;

import static com.example.linearscroll.R.*;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

public class EditTextView extends AppCompatActivity {
    ImageButton plus, minus, div, mul;
    EditText num1, num2;
    TextView ans;
    int n1, n2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(layout.activity_edit_text);

        plus = findViewById(R.id.plus);
        minus = findViewById(R.id.min);
        mul = findViewById(R.id.mul);
        div = findViewById(R.id.div);
        ans = findViewById(R.id.ans);
        num1 = findViewById(R.id.num1);
        num2 = findViewById(R.id.num2);
        n1 = Integer.parseInt(num1.getText().toString());
        n2 = Integer.parseInt(num2.getText().toString());
        System.out.println(n1+" "+n2);
    }

    public void calculator(View v) {

        if (v.getId() == plus.getId()) {
            ans.setText(n1 + n2);
        }
        if (v.getId() == minus.getId()) {
            ans.setText(n1 - n2);
        }
        if (v.getId() == mul.getId()) {
            ans.setText(n1 * n2);
        }
        if (v.getId() == div.getId()) {
            ans.setText(n1 / n2);
        }

    }

}