class BMI_info {
  int feet;
  int inch;
  int weight;
  double bmi = 0;
  String result = "";
  String advice = "";

  BMI_info(this.feet, this.inch, this.weight);

  void getResult() {
    double ht = feet.toDouble() * 0.3048 + inch * 0.0254;
    bmi = weight / (ht * ht);
    if (bmi < 18.5) {
      result = "Underweight";
      advice =
          "May indicate malnutrition, eating disorders, or other health issues. Risks include weakened immune system.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = "Normal";
      advice =
          "Typically associated with the lowest risk of developing weight-related health problems. It\'s considered the healthiest range for most people.";
    } else if (bmi >= 25 && bmi <= 29.9) {
      result = "Overweight";
      advice =
          "Higher risk of developing conditions such as cardiovascular disease, type 2 diabetes, high blood pressure, and certain cancers.";
    } else if (bmi >= 30 && bmi <= 34.9) {
      result = "Moderate obesity";
      advice =
          "Increased risk of cardiovascular diseases, type 2 diabetes, high blood pressure, and certain cancers.";
    } else if (bmi >= 35 && bmi <= 39.9) {
      result = "Severe obesity";
      advice =
          "Higher risk of developing conditions such as cardiovascular disease, type 2 diabetes, high blood pressure, and certain cancers, often with greater severity.";
    } else {
      result = "Morbid obesity";
      advice =
          "Significantly increased risk of serious health problems, including heart disease, diabetes, hypertension, sleep apnea, and various cancers";
    }
  }


}
