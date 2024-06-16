package com.example.part1_widget;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class CheckBoxViewWidget extends AppCompatActivity {
    CheckBox pen, pensil, book, khata;
    TextView ordered, genShow;
    Button submit, genSubmit;

    RadioButton male, female;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check_box_view_widget);

        pen = findViewById(R.id.penId);
        pensil = findViewById(R.id.pensilId);
        book = findViewById(R.id.bookId);
        khata = findViewById(R.id.khataId);
        ordered = findViewById(R.id.ordered);
        submit = findViewById(R.id.submit);
        genSubmit = findViewById(R.id.genSubmit);
        male = findViewById(R.id.male);
        female = findViewById(R.id.female);
        genShow = findViewById(R.id.genshow);

        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ans = "Your order list:" + "\n";
                if (pen.isChecked()) ans += pen.getText() + " , ";
                if (pensil.isChecked()) ans += pensil.getText() + " , ";
                if (book.isChecked()) ans += book.getText() + " , ";
                if (khata.isChecked()) ans += khata.getText() + " , ";
                ans = ans.substring(0, ans.length() - 2);

                ordered.setText(ans);
            }
        });

        genSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ans = "Your selected gender is ";
                if (male.isChecked()) genShow.setText("Your selected gender is Male");
                else if (female.isChecked()) genShow.setText("Your selected gender is Female");
                else
                    Toast.makeText(CheckBoxViewWidget.this, "Please select an option", Toast.LENGTH_SHORT).show();
            }
        });
    }
}